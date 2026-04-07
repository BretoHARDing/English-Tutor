import { db, FieldValue } from '../utils/firestore';

export interface DerivedProgressData {
  courseCompletionPercent: number;
  lessonsCompleted: number;
  wordsLearned: number;
  dialoguesCompleted: number;
  streakDays: number;
  pronunciationTrend: Array<{ week: number; score: number }>;
  weakSounds: Array<{ soundId: string; label: string; accuracyScore: number }>;
}

export async function writeDerivedProgress(
  uid: string,
  data: DerivedProgressData
): Promise<void> {
  await db.doc(`users/${uid}/derived/progress`).set(
    {
      ...data,
      updatedAt: FieldValue.serverTimestamp(),
    },
    { merge: true }
  );
}

export async function buildDerivedProgress(
  uid: string
): Promise<DerivedProgressData> {
  const userDoc = await db.doc(`users/${uid}`).get();
  const userData = userDoc.data() || {};

  const lessonProgressSnap = await db
    .collection(`users/${uid}/lessonProgress`)
    .where('status', '==', 'completed')
    .get();
  const lessonsCompleted = lessonProgressSnap.size;

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

  const dialogueSessionSnap = await db
    .collection(`users/${uid}/dialogueSessions`)
    .where('status', '==', 'completed')
    .get();
  const dialoguesCompleted = dialogueSessionSnap.size;

  const soundProgressSnap = await db
    .collection(`users/${uid}/soundProgress`)
    .where('accuracyScore', '<', 60)
    .get();
  const weakSounds: DerivedProgressData['weakSounds'] = [];
  soundProgressSnap.forEach((doc) => {
    const d = doc.data();
    weakSounds.push({
      soundId: d.soundId,
      label: d.label || d.soundId,
      accuracyScore: d.accuracyScore || 0,
    });
  });

  // Total lessons available (placeholder — a real implementation reads the
  // courses collection to compute a denominator).
  const TOTAL_LESSONS = 50;
  const courseCompletionPercent = Math.round(
    (lessonsCompleted / TOTAL_LESSONS) * 100
  );

  return {
    courseCompletionPercent,
    lessonsCompleted,
    wordsLearned,
    dialoguesCompleted,
    streakDays: userData.streakDays || 0,
    pronunciationTrend: userData.pronunciationTrend || [],
    weakSounds,
  };
}
