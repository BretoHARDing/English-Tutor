import { onDocumentWritten } from 'firebase-functions/v2/firestore';
import { logger } from 'firebase-functions/v2';
import { db, FieldValue } from '../utils/firestore';
import { addReviewQueueItemToBatch } from '../services/reviewQueueService';
import { buildDerivedHome, writeDerivedHome } from '../services/derivedHomeService';
import { daysFromNow } from '../utils/dates';

const HARD_WORD_PRIORITY = 10;
const NORMAL_WORD_PRIORITY = 6;
const OVERDUE_BOOST = 2;
/** Familiarity + correct-answer thresholds for "learned" status. */
const LEARNED_MIN_CORRECT = 3;
const LEARNED_MIN_FAMILIARITY = 70;

/**
 * Triggered when a word progress document is created or updated.
 *
 * - Schedules or reschedules the review queue item using SM-2 priority.
 * - Increments stats.wordsLearned when a word crosses the "learned" threshold
 *   for the first time.
 * - Rebuilds the derived home screen data.
 */
export const onWordProgressWrite = onDocumentWritten(
  'users/{uid}/wordProgress/{wordId}',
  async (event) => {
    const uid = event.params.uid;
    const wordId = event.params.wordId;

    try {
      const after = event.data?.after?.data();
      if (!after) return;

      const before = event.data?.before?.data();

      const isHard = !!after.isHardWord;
      let priority = isHard ? HARD_WORD_PRIORITY : NORMAL_WORD_PRIORITY;

      // Boost priority if the last two attempts were failures
      const recentAttempts: boolean[] = after.recentAttempts || [];
      const lastTwo = recentAttempts.slice(-2);
      if (lastTwo.length === 2 && lastTwo.every((r) => r === false)) {
        priority += OVERDUE_BOOST;
      }

      const daysUntilReview = isHard ? 1 : 3;

      const batch = db.batch();

      // Update review queue
      addReviewQueueItemToBatch(batch, {
        uid,
        contentType: 'word',
        contentId: wordId,
        dueAt: daysFromNow(daysUntilReview),
        priority,
        sourceReason: 'word_progress_update',
        exerciseType: 'word_flashcard',
      });

      // Detect word crossing the "learned" threshold for the first time
      const wasLearned =
        (before?.timesCorrect ?? 0) >= LEARNED_MIN_CORRECT &&
        (before?.familiarityScore ?? 0) >= LEARNED_MIN_FAMILIARITY;
      const isNowLearned =
        (after.timesCorrect ?? 0) >= LEARNED_MIN_CORRECT &&
        (after.familiarityScore ?? 0) >= LEARNED_MIN_FAMILIARITY;

      if (isNowLearned && !wasLearned) {
        batch.update(db.doc(`users/${uid}`), {
          'stats.wordsLearned': FieldValue.increment(1),
          updatedAt: FieldValue.serverTimestamp(),
        });
      }

      await batch.commit();

      // Rebuild home screen derived data
      const homeData = await buildDerivedHome(uid);
      await writeDerivedHome(uid, homeData);
    } catch (error) {
      logger.error('onWordProgressWrite failed', { uid, wordId, error });
      throw error;
    }
  }
);
