import * as admin from 'firebase-admin';
import { db } from '../utils/firestore';

/**
 * Sends an FCM push notification to all active device tokens for a learner.
 */
export async function sendPushToUser(
  uid: string,
  notification: { title: string; body: string }
): Promise<void> {
  const tokensSnap = await db
    .collection(`users/${uid}/deviceTokens`)
    .where('active', '==', true)
    .get();

  const tokens = tokensSnap.docs.map((d) => d.data().token as string);
  if (tokens.length === 0) return;

  const messaging = admin.messaging();
  const results = await messaging.sendEachForMulticast({
    tokens,
    notification,
  });

  // Deactivate invalid tokens
  const invalidIndexes: number[] = [];
  results.responses.forEach((r, i) => {
    if (!r.success && r.error?.code === 'messaging/registration-token-not-registered') {
      invalidIndexes.push(i);
    }
  });

  await Promise.all(
    invalidIndexes.map((i) =>
      tokensSnap.docs[i].ref.update({ active: false })
    )
  );
}
