import { db, FieldValue } from '../utils/firestore';

export interface DerivedHomeData {
  greetingName: string;
  todayLesson?: {
    id: string;
    title: string;
    estimatedMinutes: number;
    progressPercent: number;
    cta: string;
  } | null;
  reviewDue: {
    wordCount: number;
    soundCount: number;
    sentenceCount: number;
    dialogueCount: number;
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
 * Called from triggers and the rebuildDerivedHome callable.
 */
export async function writeDerivedHome(
  uid: string,
  data: DerivedHomeData
): Promise<void> {
  await db.doc(`users/${uid}/derived/home`).set(
    {
      ...data,
      updatedAt: FieldValue.serverTimestamp(),
    },
    { merge: true }
  );
}

/**
 * Computes the full derived home document for a learner by reading
 * their current progress, lesson state, and review queue.
 */
export async function buildDerivedHome(uid: string): Promise<DerivedHomeData> {
  const userDoc = await db.doc(`users/${uid}`).get();
  const userData = userDoc.data() || {};

  // Lessons completed
  const lessonProgressSnap = await db
    .collection(`users/${uid}/lessonProgress`)
    .where('status', '==', 'completed')
    .get();
  const lessonsCompleted = lessonProgressSnap.size;

  // Words learned
  const wordProgressSnap = await db
    .collection(`users/${uid}/wordProgress`)
    .get();
  let wordsLearned = 0;
  wordProgressSnap.forEach((doc) => {
    const d = doc.data();
    if ((d.timesCorrect || 0) >= 3 && (d.familiarityScore || 0) >= 70) {
      wordsLearned++;
    }
  });

  // Review due counts
  const now = new Date();
  const reviewQueueSnap = await db
    .collection(`users/${uid}/reviewQueue`)
    .where('dueAt', '<=', now)
    .where('completedAt', '==', null)
    .get();

  const reviewDue = { wordCount: 0, soundCount: 0, sentenceCount: 0, dialogueCount: 0 };
  reviewQueueSnap.forEach((doc) => {
    const d = doc.data();
    if (d.contentType === 'word') reviewDue.wordCount++;
    else if (d.contentType === 'sound') reviewDue.soundCount++;
    else if (d.contentType === 'sentence') reviewDue.sentenceCount++;
    else if (d.contentType === 'dialogue') reviewDue.dialogueCount++;
  });

  // Weak sounds for recommendation
  const soundProgressSnap = await db
    .collection(`users/${uid}/soundProgress`)
    .where('accuracyScore', '<', 60)
    .orderBy('accuracyScore', 'asc')
    .limit(1)
    .get();

  let recommendedPractice = null;
  if (!soundProgressSnap.empty) {
    const weakSound = soundProgressSnap.docs[0].data();
    recommendedPractice = {
      type: 'sound',
      targetId: weakSound.soundId,
      title: `ฝึกเสียง ${weakSound.label || weakSound.soundId}`,
    };
  }

  return {
    greetingName: userData.displayName || 'นักเรียน',
    reviewDue,
    recommendedPractice,
    recentWords: [],
    summary: {
      lessonsCompleted,
      wordsLearned,
      streakDays: userData.streakDays || 0,
    },
  };
}
