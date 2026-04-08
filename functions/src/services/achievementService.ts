import { logger } from 'firebase-functions/v2';
import { db, FieldValue } from '../utils/firestore';

const WORD_LEARNED_THRESHOLD_CORRECT = 3;
const WORD_LEARNED_THRESHOLD_FAMILIARITY = 70;

/**
 * Award an achievement to a learner if not already awarded.
 * Uses a transaction to prevent double-writes on concurrent triggers.
 */
export async function awardAchievement(
  uid: string,
  achievementId: string
): Promise<void> {
  try {
    const ref = db.doc(`users/${uid}/achievements/${achievementId}`);
    await db.runTransaction(async (tx) => {
      const snap = await tx.get(ref);
      if (!snap.exists) {
        tx.set(ref, {
          achievementId,
          unlockedAt: FieldValue.serverTimestamp(),
        });
      }
    });
  } catch (error) {
    logger.error('awardAchievement failed', { uid, achievementId, error });
    throw error;
  }
}

/**
 * Adds an achievement award to an existing batch.
 * Callers must ensure the achievement doc does not already exist, or
 * accept that a set() with merge will be a no-op on existing docs.
 */
export function addAchievementToBatch(
  batch: FirebaseFirestore.WriteBatch,
  uid: string,
  achievementId: string
): void {
  const ref = db.doc(`users/${uid}/achievements/${achievementId}`);
  // set with merge: true is idempotent — safe to call multiple times
  batch.set(
    ref,
    { achievementId, unlockedAt: FieldValue.serverTimestamp() },
    { merge: true }
  );
}

/**
 * Check and award first-lesson-complete achievement.
 */
export async function checkFirstLessonAchievement(uid: string): Promise<void> {
  try {
    const snap = await db
      .collection(`users/${uid}/lessonProgress`)
      .where('status', '==', 'completed')
      .limit(1)
      .get();
    if (!snap.empty) {
      await awardAchievement(uid, 'first_lesson_complete');
    }
  } catch (error) {
    logger.error('checkFirstLessonAchievement failed', { uid, error });
    throw error;
  }
}

/**
 * Check and award first-dialogue-complete achievement.
 */
export async function checkFirstDialogueAchievement(uid: string): Promise<void> {
  try {
    const snap = await db
      .collection(`users/${uid}/dialogueSessions`)
      .where('status', '==', 'completed')
      .limit(1)
      .get();
    if (!snap.empty) {
      await awardAchievement(uid, 'first_dialogue_complete');
    }
  } catch (error) {
    logger.error('checkFirstDialogueAchievement failed', { uid, error });
    throw error;
  }
}

export { WORD_LEARNED_THRESHOLD_CORRECT, WORD_LEARNED_THRESHOLD_FAMILIARITY };
