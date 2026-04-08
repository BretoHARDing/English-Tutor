import { onSchedule } from 'firebase-functions/v2/scheduler';
import { logger } from 'firebase-functions/v2';
import { db } from '../utils/firestore';
import { maybeResetStreak } from '../services/streakService';

/**
 * Daily streak reset job
 *
 * Runs once a day at 02:00 Asia/Bangkok time (after midnight, before most
 * learners start their day).  For every learner whose last active date is
 * neither today nor yesterday, resets their current streak to 0.
 *
 * Processes users in pages of PAGE_SIZE to avoid memory pressure.
 */

const PAGE_SIZE = 200;

export const runDailyStreakReset = onSchedule(
  {
    schedule: '0 2 * * *', // 02:00 every day
    timeZone: 'Asia/Bangkok',
    memory: '256MiB',
    timeoutSeconds: 300,
  },
  async () => {
    try {
      let totalChecked = 0;
      let totalReset = 0;
      let lastDocSnap: FirebaseFirestore.DocumentSnapshot | undefined;

      // Paginate through all users
      while (true) {
        let query = db.collection('users').limit(PAGE_SIZE);
        if (lastDocSnap) {
          query = query.startAfter(lastDocSnap);
        }

        const usersSnap = await query.get();
        if (usersSnap.empty) break;

        const results = await Promise.allSettled(
          usersSnap.docs.map(async (userDoc) => {
            const wasReset = await maybeResetStreak(userDoc.id);
            if (wasReset) totalReset++;
            totalChecked++;
          })
        );

        // Log any individual failures without stopping the entire job
        for (const result of results) {
          if (result.status === 'rejected') {
            logger.warn('[Streak Reset] Failed for a user', {
              reason: result.reason,
            });
          }
        }

        lastDocSnap = usersSnap.docs[usersSnap.docs.length - 1];
        if (usersSnap.size < PAGE_SIZE) break;
      }

      logger.info(
        `[Streak Reset] Checked ${totalChecked} users, reset ${totalReset} streaks.`
      );
    } catch (error) {
      logger.error('[Streak Reset] Fatal error', { error });
      throw error;
    }
  }
);
