import { onDocumentWritten } from 'firebase-functions/v2/firestore';
import { db, FieldValue } from '../utils/firestore';
import { upsertReviewQueueItem } from '../services/reviewQueueService';
import { buildDerivedHome, writeDerivedHome } from '../services/derivedHomeService';
import { buildDerivedProgress, writeDerivedProgress } from '../services/derivedProgressService';
import { checkFirstLessonAchievement } from '../services/achievementService';
import { daysFromNow } from '../utils/dates';

/**
 * Triggered when a lesson progress document is created or updated.
 * - Updates the learner profile (lessons completed, current lesson pointer).
 * - Rebuilds derived home and progress documents.
 * - Unlocks first-lesson achievement.
 * - Enqueues review items when a lesson is completed.
 */
export const onLessonProgressWrite = onDocumentWritten(
  'users/{uid}/lessonProgress/{lessonId}',
  async (event) => {
    const uid = event.params.uid;
    const lessonId = event.params.lessonId;
    const after = event.data?.after?.data();

    if (!after) return;

    // Update top-level user document with current lesson pointer
    await db.doc(`users/${uid}`).set(
      {
        currentLessonId: lessonId,
        updatedAt: FieldValue.serverTimestamp(),
      },
      { merge: true }
    );

    // Unlock achievement if first lesson completed
    if (after.status === 'completed') {
      await checkFirstLessonAchievement(uid);

      // Enqueue review items for target words
      const targetWordIds: string[] = after.targetWordIds || [];
      await Promise.all(
        targetWordIds.map((wordId) =>
          upsertReviewQueueItem({
            uid,
            contentType: 'word',
            contentId: wordId,
            dueAt: daysFromNow(1),
            priority: 6,
            sourceReason: `lesson_complete:${lessonId}`,
            exerciseType: 'word_flashcard',
          })
        )
      );

      // Enqueue review items for target sentences
      const targetSentenceIds: string[] = after.targetSentenceIds || [];
      await Promise.all(
        targetSentenceIds.map((sentenceId) =>
          upsertReviewQueueItem({
            uid,
            contentType: 'sentence',
            contentId: sentenceId,
            dueAt: daysFromNow(2),
            priority: 8,
            sourceReason: `lesson_complete:${lessonId}`,
            exerciseType: 'speak_sentence',
          })
        )
      );
    }

    // Rebuild derived documents
    const [homeData, progressData] = await Promise.all([
      buildDerivedHome(uid),
      buildDerivedProgress(uid),
    ]);

    await Promise.all([
      writeDerivedHome(uid, homeData),
      writeDerivedProgress(uid, progressData),
    ]);
  }
);
