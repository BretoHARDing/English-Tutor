import { onSchedule } from 'firebase-functions/v2/scheduler';
import { logger } from 'firebase-functions/v2';
import { db } from '../utils/firestore';

/**
 * Cleanup old speaking attempt recordings
 *
 * Runs weekly on Sunday at 03:00 Asia/Bangkok.
 * Uses a collection-group query on `speakingAttempts` to find documents older
 * than RETENTION_DAYS across ALL users, then deletes them in chunks of 500
 * (Firestore batch limit) until no more remain.
 *
 * This avoids iterating all users and never hits batch size limits.
 */

const RETENTION_DAYS = 90;
const CHUNK_SIZE = 500;

export const cleanupOldRecordings = onSchedule(
  {
    schedule: '0 3 * * 0', // 03:00 every Sunday
    timeZone: 'Asia/Bangkok',
    memory: '512MiB',
    timeoutSeconds: 540,
  },
  async () => {
    try {
      const cutoff = new Date();
      cutoff.setDate(cutoff.getDate() - RETENTION_DAYS);

      let totalDeleted = 0;

      // Loop until no more documents remain
      while (true) {
        const snap = await db
          .collectionGroup('speakingAttempts')
          .where('createdAt', '<', cutoff)
          .limit(CHUNK_SIZE)
          .get();

        if (snap.empty) break;

        const batch = db.batch();
        snap.docs.forEach((doc) => batch.delete(doc.ref));
        await batch.commit();

        totalDeleted += snap.size;
        logger.info(`[Cleanup] Deleted ${snap.size} attempts (total so far: ${totalDeleted})`);

        if (snap.size < CHUNK_SIZE) break;
      }

      logger.info(`[Cleanup] Completed — deleted ${totalDeleted} old speaking attempt records.`);
    } catch (error) {
      logger.error('[Cleanup] Fatal error', { error });
      throw error;
    }
  }
);
