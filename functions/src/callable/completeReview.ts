import { onCall, HttpsError } from 'firebase-functions/v2/https';
import { logger } from 'firebase-functions/v2';
import { db, FieldValue } from '../utils/firestore';
import {
  computeNextSm2,
  type Sm2State,
  type Sm2Quality,
} from '../services/reviewQueueService';
import { updateStreak } from '../services/streakService';
import { buildDerivedHome, writeDerivedHome } from '../services/derivedHomeService';

/**
 * completeReview — callable Cloud Function
 *
 * Called by the mobile app after the learner finishes a review exercise.
 *
 * Request shape:
 * ```json
 * {
 *   "reviewId": "word_abc123",
 *   "quality": 4,
 *   "pronunciationScore": 82,   // optional — only for speaking exercises
 *   "updateProgressField": "word_flashcard"  // optional hint for progress update
 * }
 * ```
 *
 * What it does (all in one atomic batch):
 * 1. Marks the review item as completedAt = now.
 * 2. Computes next due date using SM-2.
 * 3. Optionally updates wordProgress / soundProgress familiarity.
 * 4. Increments stats.reviewsCompleted.
 * 5. Updates the learner's daily streak.
 */
export const completeReview = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (!uid) {
    throw new HttpsError('unauthenticated', 'Authentication required.');
  }

  const { reviewId, quality, pronunciationScore } = request.data as {
    reviewId: string;
    quality: number;
    pronunciationScore?: number;
  };

  if (typeof reviewId !== 'string' || !reviewId) {
    throw new HttpsError('invalid-argument', 'reviewId is required.');
  }
  if (typeof quality !== 'number' || quality < 0 || quality > 5) {
    throw new HttpsError('invalid-argument', 'quality must be a number 0–5.');
  }

  try {
    const ref = db.doc(`users/${uid}/reviewQueue/${reviewId}`);
    const snap = await ref.get();

    if (!snap.exists) {
      throw new HttpsError('not-found', `Review item not found: ${reviewId}`);
    }

    const data = snap.data()!;
    const current: Sm2State = {
      interval: data.sm2Interval ?? 1,
      repetition: data.sm2Repetition ?? 0,
      efactor: data.sm2Efactor ?? 2.5,
    };

    const next = computeNextSm2(current, quality as Sm2Quality);

    const nextDueDate = new Date();
    nextDueDate.setDate(nextDueDate.getDate() + next.nextIntervalDays);

    const batch = db.batch();

    // Mark review item complete and schedule next occurrence
    batch.set(
      ref,
      {
        sm2Interval: next.interval,
        sm2Repetition: next.repetition,
        sm2Efactor: next.efactor,
        lastQuality: quality,
        dueAt: FirebaseFirestore.Timestamp.fromDate(nextDueDate),
        completedAt: FieldValue.serverTimestamp(),
        updatedAt: FieldValue.serverTimestamp(),
      },
      { merge: true }
    );

    // Increment user aggregate review counter
    batch.update(db.doc(`users/${uid}`), {
      'stats.reviewsCompleted': FieldValue.increment(1),
      updatedAt: FieldValue.serverTimestamp(),
    });

    // If this is a word review, update the word's familiarity score
    const contentType: string = data.contentType ?? '';
    const contentId: string = data.contentId ?? '';

    if (contentType === 'word' && contentId) {
      const wordRef = db.doc(`users/${uid}/wordProgress/${contentId}`);
      const familiarityDelta = quality >= 3 ? 10 : -15;
      const scoreIncrement = pronunciationScore !== undefined ? pronunciationScore : 0;

      batch.set(
        wordRef,
        {
          familiarityScore: FieldValue.increment(familiarityDelta),
          timesCorrect: quality >= 3 ? FieldValue.increment(1) : FieldValue.increment(0),
          timesIncorrect: quality < 3 ? FieldValue.increment(1) : FieldValue.increment(0),
          pronunciationScore: scoreIncrement > 0 ? scoreIncrement : FieldValue.increment(0),
          updatedAt: FieldValue.serverTimestamp(),
        },
        { merge: true }
      );
    }

    if (contentType === 'sound' && contentId && pronunciationScore !== undefined) {
      const soundRef = db.doc(`users/${uid}/soundProgress/${contentId}`);
      batch.set(
        soundRef,
        {
          accuracyScore: pronunciationScore,
          attemptsCount: FieldValue.increment(1),
          updatedAt: FieldValue.serverTimestamp(),
        },
        { merge: true }
      );
    }

    await batch.commit();

    // Update streak (uses its own transaction)
    await updateStreak(uid);

    // Rebuild home screen so due counts update immediately
    const homeData = await buildDerivedHome(uid);
    await writeDerivedHome(uid, homeData);

    return {
      success: true,
      nextDueDate: nextDueDate.toISOString(),
      nextIntervalDays: next.nextIntervalDays,
    };
  } catch (error) {
    if (error instanceof HttpsError) throw error;
    logger.error('completeReview failed', { uid, reviewId, quality, error });
    throw new HttpsError('internal', 'Failed to complete review.');
  }
});
