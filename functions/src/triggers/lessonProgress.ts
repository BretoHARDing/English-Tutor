import { onDocumentWritten } from 'firebase-functions/v2/firestore';
import { logger } from 'firebase-functions/v2';
import { db, FieldValue } from '../utils/firestore';
import { addReviewQueueItemToBatch } from '../services/reviewQueueService';
import { addAchievementToBatch } from '../services/achievementService';
import { buildDerivedHome, writeDerivedHome } from '../services/derivedHomeService';
import { buildDerivedProgress, writeDerivedProgress } from '../services/derivedProgressService';
import { updateStreak } from '../services/streakService';
import { daysFromNow } from '../utils/dates';

/**
 * Triggered when a lesson progress document is created or updated.
 *
 * On ANY write:
 *  - Updates the user's currentLessonId pointer.
 *  - Rebuilds derived home and progress documents.
 *
 * On COMPLETION (status === 'completed'):
 *  - Increments stats.lessonsCompleted counter.
 *  - Enqueues review items for target words and sentences.
 *  - Awards first-lesson achievement.
 *  - Updates the learner's daily streak.
 *
 * All Firestore writes in the completion path are committed as a single batch
 * to guarantee consistency: lesson cannot be marked complete without review
 * items being enqueued.
 */
export const onLessonProgressWrite = onDocumentWritten(
  'users/{uid}/lessonProgress/{lessonId}',
  async (event) => {
    const uid = event.params.uid;
    const lessonId = event.params.lessonId;

    try {
      const after = event.data?.after?.data();
      if (!after) return; // Document deleted — nothing to do

      const before = event.data?.before?.data();
      const justCompleted =
        after.status === 'completed' && before?.status !== 'completed';

      const batch = db.batch();

      // Always update current lesson pointer
      batch.set(
        db.doc(`users/${uid}`),
        { currentLessonId: lessonId, updatedAt: FieldValue.serverTimestamp() },
        { merge: true }
      );

      if (justCompleted) {
        // Increment lessons completed counter
        batch.update(db.doc(`users/${uid}`), {
          'stats.lessonsCompleted': FieldValue.increment(1),
          updatedAt: FieldValue.serverTimestamp(),
        });

        // Enqueue review items for target words (due in 1 day)
        const targetWordIds: string[] = after.targetWordIds || [];
        for (const wordId of targetWordIds) {
          addReviewQueueItemToBatch(batch, {
            uid,
            contentType: 'word',
            contentId: wordId,
            dueAt: daysFromNow(1),
            priority: 6,
            sourceReason: `lesson_complete:${lessonId}`,
            exerciseType: 'word_flashcard',
          });
        }

        // Enqueue review items for target sentences (due in 2 days)
        const targetSentenceIds: string[] = after.targetSentenceIds || [];
        for (const sentenceId of targetSentenceIds) {
          addReviewQueueItemToBatch(batch, {
            uid,
            contentType: 'sentence',
            contentId: sentenceId,
            dueAt: daysFromNow(2),
            priority: 8,
            sourceReason: `lesson_complete:${lessonId}`,
            exerciseType: 'speak_sentence',
          });
        }

        // Award first-lesson achievement (idempotent set with merge)
        addAchievementToBatch(batch, uid, 'first_lesson_complete');
      }

      // Commit everything atomically
      await batch.commit();

      // Streak update uses a transaction internally — run after the batch
      if (justCompleted) {
        await updateStreak(uid);
      }

      // Rebuild denormalised documents
      const [homeData, progressData] = await Promise.all([
        buildDerivedHome(uid),
        buildDerivedProgress(uid),
      ]);
      await Promise.all([
        writeDerivedHome(uid, homeData),
        writeDerivedProgress(uid, progressData),
      ]);
    } catch (error) {
      logger.error('onLessonProgressWrite failed', { uid, lessonId, error });
      throw error; // Re-throw to trigger Cloud Functions retry
    }
  }
);
