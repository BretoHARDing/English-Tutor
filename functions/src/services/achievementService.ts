import { db } from '../utils/firestore';

const WORD_LEARNED_THRESHOLD_CORRECT = 3;
const WORD_LEARNED_THRESHOLD_FAMILIARITY = 70;

/**
 * Award an achievement to a learner if not already awarded.
 */
export async function awardAchievement(
  uid: string,
  achievementId: string
): Promise<void> {
  const ref = db.doc(`users/${uid}/achievements/${achievementId}`);
  const snap = await ref.get();
  if (!snap.exists) {
    await ref.set({
      achievementId,
      unlockedAt: new Date(),
    });
  }
}

/**
 * Check and award first-lesson-complete achievement.
 */
export async function checkFirstLessonAchievement(uid: string): Promise<void> {
  const snap = await db
    .collection(`users/${uid}/lessonProgress`)
    .where('status', '==', 'completed')
    .limit(1)
    .get();
  if (!snap.empty) {
    await awardAchievement(uid, 'first_lesson_complete');
  }
}

/**
 * Check and award first-dialogue-complete achievement.
 */
export async function checkFirstDialogueAchievement(uid: string): Promise<void> {
  const snap = await db
    .collection(`users/${uid}/dialogueSessions`)
    .where('status', '==', 'completed')
    .limit(1)
    .get();
  if (!snap.empty) {
    await awardAchievement(uid, 'first_dialogue_complete');
  }
}

export { WORD_LEARNED_THRESHOLD_CORRECT, WORD_LEARNED_THRESHOLD_FAMILIARITY };
