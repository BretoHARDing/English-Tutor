import { onSchedule } from 'firebase-functions/v2/scheduler';
import { logger } from 'firebase-functions/v2';
import { db, FieldValue } from '../utils/firestore';
import {
  computeNextSm2,
  type Sm2State,
  type Sm2Quality,
} from '../services/reviewQueueService';
import { sendPushToUser } from '../services/notificationsService';

/**
 * Spaced-Repetition Scheduler
 *
 * Runs every 12 hours.
 *
 * 1. Uses a collection-group query on `reviewQueue` to find ONLY documents
 *    that are actually overdue (instead of iterating all users).
 * 2. For items overdue by ≥ OVERDUE_RESET_THRESHOLD_DAYS, resets SM-2
 *    state so learners aren't bombarded.
 * 3. Sends a push reminder to users who have due items and haven't been
 *    notified recently (lastReminderSentAt guard is in notificationsService).
 *
 * Processes in chunks of BATCH_SIZE to respect Firestore batch limits.
 */

const OVERDUE_RESET_THRESHOLD_DAYS = 2;
const BATCH_SIZE = 400; // keep safely below the 500 batch-write limit

export const runSpacedRepetitionScheduler = onSchedule(
  {
    schedule: 'every 12 hours',
    timeZone: 'Asia/Bangkok',
    memory: '512MiB',
    timeoutSeconds: 540,
  },
  async () => {
    try {
      const now = new Date();
      const overdueCutoff = new Date(now);
      overdueCutoff.setDate(overdueCutoff.getDate() - OVERDUE_RESET_THRESHOLD_DAYS);

      // Collection-group query: only documents that are actually due
      const overdueSnap = await db
        .collectionGroup('reviewQueue')
        .where('dueAt', '<=', now)
        .where('completedAt', '==', null)
        .limit(5000) // safety cap per run; next run will catch the rest
        .get();

      if (overdueSnap.empty) {
        logger.info('[SR Scheduler] No overdue items found.');
        return;
      }

      // Group items by uid (extracted from path: users/{uid}/reviewQueue/{id})
      const byUser = new Map<string, typeof overdueSnap.docs>();
      for (const doc of overdueSnap.docs) {
        const pathSegments = doc.ref.path.split('/');
        const uid = pathSegments[1]; // users/{uid}/reviewQueue/{id}
        if (!uid) continue;
        if (!byUser.has(uid)) byUser.set(uid, []);
        byUser.get(uid)!.push(doc);
      }

      let totalReset = 0;
      let totalNotified = 0;

      for (const [uid, docs] of byUser.entries()) {
        // Process in chunks to stay within batch limits
        for (let i = 0; i < docs.length; i += BATCH_SIZE) {
          const chunk = docs.slice(i, i + BATCH_SIZE);
          const batch = db.batch();
          let chunkReset = 0;

          for (const doc of chunk) {
            const data = doc.data();
            const dueAt: Date = data.dueAt?.toDate?.() ?? new Date(0);

            // Only reset SM-2 for items that are very long overdue
            if (dueAt < overdueCutoff) {
              const current: Sm2State = {
                interval: data.sm2Interval ?? 1,
                repetition: data.sm2Repetition ?? 0,
                efactor: data.sm2Efactor ?? 2.5,
              };

              const next = computeNextSm2(current, 0 as Sm2Quality);
              const nextDue = new Date();
              nextDue.setDate(nextDue.getDate() + next.nextIntervalDays);

              batch.update(doc.ref, {
                sm2Interval: next.interval,
                sm2Repetition: next.repetition,
                sm2Efactor: next.efactor,
                lastQuality: 0,
                dueAt: FirebaseFirestore.Timestamp.fromDate(nextDue),
                scheduledBySystem: true,
                updatedAt: FieldValue.serverTimestamp(),
              });

              chunkReset++;
            }
          }

          if (chunkReset > 0) {
            await batch.commit();
            totalReset += chunkReset;
          }
        }

        // Send a push notification to this user about their due items
        try {
          const dueCount = docs.length;
          await sendPushToUser(uid, {
            notification: {
              title: 'ถึงเวลาทบทวนแล้ว! 📚',
              body: `มี ${dueCount} รายการรอการทบทวน มาฝึกกันเลย!`,
            },
            data: {
              route: '/review',
              dueCount: String(dueCount),
            },
          });
          totalNotified++;
        } catch (notifError) {
          // Non-fatal: log and continue
          logger.warn('[SR Scheduler] Push notification failed', {
            uid,
            notifError,
          });
        }
      }

      logger.info(
        `[SR Scheduler] done at ${now.toISOString()} — ` +
          `reset ${totalReset} items, notified ${totalNotified} users`
      );
    } catch (error) {
      logger.error('[SR Scheduler] fatal error', { error });
      throw error;
    }
  }
);
