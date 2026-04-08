import { onSchedule } from 'firebase-functions/v2/scheduler';
import { db, FieldValue } from '../utils/firestore';
import {
  computeNextSm2,
  type Sm2State,
  type Sm2Quality,
} from '../services/reviewQueueService';

/**
 * Spaced-Repetition Scheduler
 *
 * Runs every 6 hours to surface any review queue items that are overdue and
 * have not yet been rescheduled.  For items that are 2+ days overdue the
 * scheduler acts as a "catch-up" pass: it resets the SM-2 interval to 1 day
 * (treating a long absence as a forgotten review) so learners are not
 * bombarded with a huge overdue backlog.
 *
 * The function processes at most MAX_USERS users and MAX_ITEMS items per user
 * per run to stay within Cloud Functions memory and execution limits.
 */

const MAX_USERS = 200;
const MAX_ITEMS_PER_USER = 50;
const OVERDUE_RESET_THRESHOLD_DAYS = 2;

export const runSpacedRepetitionScheduler = onSchedule(
  {
    schedule: 'every 6 hours',
    timeZone: 'Asia/Bangkok',
    memory: '512MiB',
    timeoutSeconds: 300,
  },
  async () => {
    const now = new Date();
    const overdueCutoff = new Date(now);
    overdueCutoff.setDate(overdueCutoff.getDate() - OVERDUE_RESET_THRESHOLD_DAYS);

    // Query all users with at least one due review item.
    // In production you would page through this with a cursor.
    const usersSnap = await db.collection('users').limit(MAX_USERS).get();

    const promises = usersSnap.docs.map((userDoc) =>
      processUserReviews(userDoc.id, now, overdueCutoff)
    );

    await Promise.allSettled(promises);

    console.log(
      `[SR Scheduler] processed ${usersSnap.size} users at ${now.toISOString()}`
    );
  }
);

async function processUserReviews(
  uid: string,
  now: Date,
  overdueCutoff: Date
): Promise<void> {
  // Find review items that are overdue and still uncompleted
  const overdueSnap = await db
    .collection(`users/${uid}/reviewQueue`)
    .where('dueAt', '<=', now)
    .where('completedAt', '==', null)
    .limit(MAX_ITEMS_PER_USER)
    .get();

  if (overdueSnap.empty) return;

  const batch = db.batch();
  let batchCount = 0;

  for (const doc of overdueSnap.docs) {
    const data = doc.data();
    const dueAt: Date = data.dueAt?.toDate?.() ?? new Date(0);

    // Long overdue: treat as forgotten, reset SM-2 to interval 1
    if (dueAt < overdueCutoff) {
      const current: Sm2State = {
        interval: data.sm2Interval ?? 1,
        repetition: data.sm2Repetition ?? 0,
        efactor: data.sm2Efactor ?? 2.5,
      };

      // Quality 0 = complete blackout (forgotten after long absence).
      // SM-2 resets interval to 1 day for quality < 3, so next.nextIntervalDays
      // will always be 1 here — use it explicitly for algorithm consistency.
      const next = computeNextSm2(current, 0 as Sm2Quality);

      const nextDue = new Date();
      nextDue.setDate(nextDue.getDate() + next.nextIntervalDays);

      batch.update(doc.ref, {
        sm2Interval: next.interval,
        sm2Repetition: next.repetition,
        sm2Efactor: next.efactor,
        lastQuality: 0,
        dueAt: FirebaseFirestore.Timestamp.fromDate(nextDue),
        // Mark as "needs review" but NOT as completed — keep in active queue
        scheduledBySystem: true,
        updatedAt: FieldValue.serverTimestamp(),
      });

      batchCount++;
    }
    // Items that are overdue by less than OVERDUE_RESET_THRESHOLD_DAYS are
    // left untouched; they surface naturally when the learner opens the app.
  }

  if (batchCount > 0) {
    await batch.commit();
    console.log(
      `[SR Scheduler] Reset ${batchCount} long-overdue items for user ${uid}`
    );
  }
}
