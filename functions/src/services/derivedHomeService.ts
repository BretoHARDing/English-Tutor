import { logger } from 'firebase-functions/v2';
import { db, FieldValue } from '../utils/firestore';

export interface DerivedHomeData {
  greetingName: string;
  todayLesson?: {
    id: string;
    title: string;
    estimatedMinutes: number;
    progressPercent: number;
    /** 'start' | 'continue' | 'review' */
    cta: string;
  } | null;
  reviewDue: {
    wordCount: number;
    soundCount: number;
    sentenceCount: number;
    dialogueCount: number;
    total: number;
  };
  recommendedPractice?: {
    type: string;
    targetId: string;
    title: string;
  } | null;
  recentWords: Array<{ wordId: string; english: string; thai: string }>;
  summary: {
    lessonsCompleted: number;
    wordsLearned: number;
    streakDays: number;
  };
}

/**
 * Writes the pre-computed home document for a learner.
 */
export async function writeDerivedHome(
  uid: string,
  data: DerivedHomeData
): Promise<void> {
  try {
    await db.doc(`users/${uid}/derived/home`).set(
      { ...data, updatedAt: FieldValue.serverTimestamp() },
      { merge: true }
    );
  } catch (error) {
    logger.error('writeDerivedHome failed', { uid, error });
    throw error;
  }
}

/**
 * Builds the derived home document.
 *
 * Performance notes:
 * - Reads aggregate counters from the user document (O(1)) instead of
 *   scanning full subcollections.
 * - Still reads the review queue for due counts (needed for accuracy).
 */
export async function buildDerivedHome(uid: string): Promise<DerivedHomeData> {
  try {
    const [userDoc, reviewQueueSnap, soundProgressSnap] = await Promise.all([
      db.doc(`users/${uid}`).get(),
      // Due review items only — filtered server-side
      db
        .collection(`users/${uid}/reviewQueue`)
        .where('dueAt', '<=', new Date())
        .where('completedAt', '==', null)
        .get(),
      // Weak sounds for recommendation
      db
        .collection(`users/${uid}/soundProgress`)
        .where('accuracyScore', '<', 60)
        .orderBy('accuracyScore', 'asc')
        .limit(1)
        .get(),
    ]);

    const userData = userDoc.data() || {};
    const stats = (userData.stats as Record<string, number>) || {};

    // Use aggregate counters — fall back to 0 if not yet initialised
    const lessonsCompleted = stats.lessonsCompleted ?? 0;
    const wordsLearned = stats.wordsLearned ?? 0;
    const streakDays = stats.streakDays ?? 0;

    // Count due items by type
    const reviewDue = {
      wordCount: 0,
      soundCount: 0,
      sentenceCount: 0,
      dialogueCount: 0,
      total: 0,
    };
    reviewQueueSnap.forEach((doc) => {
      const d = doc.data();
      reviewDue.total++;
      if (d.contentType === 'word') reviewDue.wordCount++;
      else if (d.contentType === 'sound') reviewDue.soundCount++;
      else if (d.contentType === 'sentence') reviewDue.sentenceCount++;
      else if (d.contentType === 'dialogue') reviewDue.dialogueCount++;
    });

    // Recommend weakest sound
    let recommendedPractice = null;
    if (!soundProgressSnap.empty) {
      const weakSound = soundProgressSnap.docs[0].data();
      recommendedPractice = {
        type: 'sound',
        targetId: weakSound.soundId,
        title: `ฝึกเสียง ${weakSound.label || weakSound.soundId}`,
      };
    }

    // Determine CTA for the current lesson:
    // - 'start' if not yet begun
    // - 'continue' if in progress
    // - 'review' if completed but has due review items from this lesson
    let todayLesson: DerivedHomeData['todayLesson'] = null;
    const currentLessonId = userData.currentLessonId as string | undefined;
    if (currentLessonId) {
      const [lessonDoc, progressDoc] = await Promise.all([
        db.doc(`lessons/${currentLessonId}`).get(),
        db.doc(`users/${uid}/lessonProgress/${currentLessonId}`).get(),
      ]);
      if (lessonDoc.exists) {
        const lesson = lessonDoc.data()!;
        const progress = progressDoc.exists ? progressDoc.data()! : null;
        const status = progress?.status ?? 'not_started';
        const progressPercent = progress?.completionPercent ?? 0;

        let cta = 'start';
        if (status === 'completed') {
          // Show 'review' CTA if there are due review items
          cta = reviewDue.total > 0 ? 'review' : 'start';
        } else if (status === 'in_progress') {
          cta = 'continue';
        }

        todayLesson = {
          id: currentLessonId,
          title: lesson.title ?? '',
          estimatedMinutes: lesson.estimatedMinutes ?? 0,
          progressPercent,
          cta,
        };
      }
    }

    return {
      greetingName: userData.displayName || 'นักเรียน',
      todayLesson,
      reviewDue,
      recommendedPractice,
      recentWords: [],
      summary: { lessonsCompleted, wordsLearned, streakDays },
    };
  } catch (error) {
    logger.error('buildDerivedHome failed', { uid, error });
    throw error;
  }
}
