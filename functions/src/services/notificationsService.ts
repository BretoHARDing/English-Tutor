import * as admin from 'firebase-admin';
import { logger } from 'firebase-functions/v2';
import { db, FieldValue } from '../utils/firestore';
import type { PushPayload } from '../types';

/** Minimum hours between reminder pushes for a single user. */
const MIN_HOURS_BETWEEN_REMINDERS = 12;

/**
 * Sends an FCM push notification to all active device tokens for a learner.
 * Includes deep-link data in the payload so tapping opens the correct screen.
 * Skips sending if a reminder was already sent within MIN_HOURS_BETWEEN_REMINDERS.
 * Deactivates stale tokens returned as unregistered by FCM.
 */
export async function sendPushToUser(
  uid: string,
  payload: PushPayload
): Promise<void> {
  try {
    // Guard: skip if a reminder was sent too recently
    const userSnap = await db.doc(`users/${uid}`).get();
    if (userSnap.exists) {
      const userData = userSnap.data()!;
      const lastSent: admin.firestore.Timestamp | undefined =
        userData.lastReminderSentAt;
      if (lastSent) {
        const hoursSince =
          (Date.now() - lastSent.toMillis()) / (1000 * 60 * 60);
        if (hoursSince < MIN_HOURS_BETWEEN_REMINDERS) {
          logger.info('sendPushToUser: skipping — reminder sent recently', {
            uid,
            hoursSince: Math.round(hoursSince),
          });
          return;
        }
      }
    }

    const tokensSnap = await db
      .collection(`users/${uid}/deviceTokens`)
      .where('active', '==', true)
      .get();

    const tokens = tokensSnap.docs.map((d) => d.data().token as string);
    if (tokens.length === 0) return;

    // FCM sendEachForMulticast accepts at most 500 tokens per call.
    // Chunk to stay safely within limits.
    const CHUNK_SIZE = 500;
    for (let i = 0; i < tokens.length; i += CHUNK_SIZE) {
      const chunk = tokens.slice(i, i + CHUNK_SIZE);
      const chunkDocs = tokensSnap.docs.slice(i, i + CHUNK_SIZE);

      const results = await admin.messaging().sendEachForMulticast({
        tokens: chunk,
        notification: payload.notification,
        data: payload.data,
      });

      // Deactivate tokens that FCM reports as unregistered
      const staleUpdates: Promise<FirebaseFirestore.WriteResult>[] = [];
      results.responses.forEach((r, idx) => {
        if (
          !r.success &&
          r.error?.code === 'messaging/registration-token-not-registered'
        ) {
          staleUpdates.push(chunkDocs[idx].ref.update({ active: false }));
        }
      });
      await Promise.all(staleUpdates);
    }

    // Record the timestamp so we can enforce the minimum interval
    await db.doc(`users/${uid}`).update({
      lastReminderSentAt: FieldValue.serverTimestamp(),
    });
  } catch (error) {
    logger.error('sendPushToUser failed', { uid, error });
    throw error;
  }
}
