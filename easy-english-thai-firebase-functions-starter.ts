/**
 * Easy English Thai
 * Firebase Cloud Functions starter implementation
 *
 * Runtime:
 *   - Firebase Functions v2
 *   - TypeScript
 *
 * Install:
 *   npm install firebase-admin firebase-functions
 */

import { onDocumentWritten } from 'firebase-functions/v2/firestore';
import { onSchedule } from 'firebase-functions/v2/scheduler';
import { onCall, HttpsError } from 'firebase-functions/v2/https';
import * as admin from 'firebase-admin';

if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore();
const FieldValue = admin.firestore.FieldValue;

type ReviewContentType = 'word' | 'sound' | 'sentence' | 'dialogue';

interface RecommendationItem {
  type: string;
  targetId: string;
  title: string;
}

function reviewQueueDocId(contentType: ReviewContentType, contentId: string): string {
  return `${contentType}_${contentId}`;
}

async function upsertReviewQueueItem(params: {
  uid: string;
  contentType: ReviewContentType;
  contentId: string;
  dueAt: FirebaseFirestore.Timestamp;
  priority: number;
  sourceReason: string;
  exerciseType: string;
}): Promise<void> {
  const { uid, contentType, contentId, dueAt, priority, sourceReason, exerciseType } = params;
  const reviewId = reviewQueueDocId(contentType, contentId);
  const ref = db.doc(`users/${uid}/reviewQueue/${reviewId}`);

  await ref.set(
    {
      reviewId,
      contentType,
      contentId,
      dueAt,
      priority,
      sourceReason,
      exerciseType,
      completedAt: null,
      createdAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
    },
    { merge: true }
  );
}

async function getLessonsCompleted(uid: string): Promise<number> {
  const snap = await db
    .collection(`users/${uid}/lessonProgress`)
    .where('status', '==', 'completed')
    .get();
  return snap.size;
}

async function getWordsLearned(uid: string): Promise<number> {
  const snap = await db.collection(`users/${uid}/wordProgress`).get();
  let learned = 0;
  snap.forEach((doc) => {
    const d = doc.data();
    if ((d.timesCorrect || 0) >= 3 && (d.familiarityScore || 0) >= 70) learned += 1;
  });
  return learned;
}

async function getDialoguesCompleted(uid: string): Promise<number> {
  const snap = await db
    .collection(`users/${uid}/dialogueSessions`)
    .where('status', '==', 'completed')
    .get();
  return snap.size;
}

async function getWeakSounds(uid: string): Promise<any[]> {
  const snap = await db.collection(`users/${uid}/soundProgress`).get();
  const results: any[] = [];
  snap.forEach((doc) => {
    const d = doc.data();
    if ((d.accuracyScore ?? 100) < 60) {
      results.push({
        soundId: d.soundId || doc.id,
        label: d.label || d.soundId || doc.id,
        accuracyScore: d.accuracyScore ?? 0,
      });
    }
  });
  results.sort((a, b) => a.accuracyScore - b.accuracyScore);
  return results.slice(0, 5);
}

async function getReviewDueCounts(uid: string): Promise<Record<string, number>> {
  const now = admin.firestore.Timestamp.now();
  const snap = await db
    .collection(`users/${uid}/reviewQueue`)
    .where('dueAt', '<=', now)
    .get();

  const counts = { wordCount: 0, soundCount: 0, sentenceCount: 0, dialogueCount: 0 };
  snap.forEach((doc) => {
    const d = doc.data();
    switch (d.contentType) {
      case 'word':
        counts.wordCount += 1;
        break;
      case 'sound':
        counts.soundCount += 1;
        break;
      case 'sentence':
        counts.sentenceCount += 1;
        break;
      case 'dialogue':
        counts.dialogueCount += 1;
        break;
    }
  });
  return counts;
}

async function getCurrentOrNextLesson(uid: string): Promise<any | null> {
  const userRef = db.doc(`users/${uid}`);
  const userSnap = await userRef.get();
  const user = userSnap.data();
  const currentLessonId = user?.currentLessonId;

  if (currentLessonId) {
    const lessonSnap = await db.doc(`lessons/${currentLessonId}`).get();
    if (lessonSnap.exists) {
      const lesson = lessonSnap.data();
      const lpSnap = await db.doc(`users/${uid}/lessonProgress/${currentLessonId}`).get();
      const lp = lpSnap.exists ? lpSnap.data() : null;
      return {
        id: lessonSnap.id,
        title: lesson?.title,
        estimatedMinutes: lesson?.estimatedMinutes ?? 10,
        progressPercent: lp?.completionPercent ?? 0,
        cta: (lp?.status === 'in_progress') ? 'continue' : 'start',
      };
    }
  }

  const lessonsSnap = await db.collection('lessons').where('isPublished', '==', true).limit(1).get();
  if (!lessonsSnap.empty) {
    const lessonDoc = lessonsSnap.docs[0];
    const lesson = lessonDoc.data();
    return {
      id: lessonDoc.id,
      title: lesson.title,
      estimatedMinutes: lesson.estimatedMinutes ?? 10,
      progressPercent: 0,
      cta: 'start',
    };
  }

  return null;
}

async function getRecentWords(uid: string): Promise<any[]> {
  const snap = await db
    .collection(`users/${uid}/wordProgress`)
    .orderBy('updatedAt', 'desc')
    .limit(5)
    .get();

  const results: any[] = [];
  for (const doc of snap.docs) {
    const d = doc.data();
    const wordId = d.wordId || doc.id;
    const wordSnap = await db.doc(`words/${wordId}`).get();
    if (wordSnap.exists) {
      const word = wordSnap.data();
      results.push({
        id: wordId,
        englishText: word?.englishText,
        thaiText: word?.thaiText,
      });
    }
  }
  return results;
}

async function getRecommendedPractice(uid: string): Promise<RecommendationItem> {
  const weakSounds = await getWeakSounds(uid);
  if (weakSounds.length > 0) {
    return {
      type: 'sound',
      targetId: weakSounds[0].soundId,
      title: `Practice ${weakSounds[0].label} sound`,
    };
  }

  const dueCounts = await getReviewDueCounts(uid);
  if (dueCounts.wordCount > 0) {
    return {
      type: 'review',
      targetId: 'review_words_due',
      title: 'Review due words',
    };
  }

  const lesson = await getCurrentOrNextLesson(uid);
  return {
    type: 'lesson',
    targetId: lesson?.id || 'lesson_001',
    title: 'Continue learning',
  };
}

async function rebuildDerivedHomeForUser(uid: string): Promise<void> {
  const userSnap = await db.doc(`users/${uid}`).get();
  const user = userSnap.data();
  if (!userSnap.exists || !user) return;

  const todayLesson = await getCurrentOrNextLesson(uid);
  const reviewDue = await getReviewDueCounts(uid);
  const recentWords = await getRecentWords(uid);
  const recommendedPractice = await getRecommendedPractice(uid);

  const lessonsCompleted = await getLessonsCompleted(uid);
  const wordsLearned = await getWordsLearned(uid);
  const streakDays = user?.homeSummary?.streakDays ?? 0;

  await db.doc(`users/${uid}/derived/home`).set(
    {
      greetingName: user.displayName || 'Learner',
      todayLesson,
      reviewDue,
      recommendedPractice,
      recentWords,
      summary: {
        lessonsCompleted,
        wordsLearned,
        streakDays,
      },
      updatedAt: FieldValue.serverTimestamp(),
    },
    { merge: true }
  );
}

async function rebuildDerivedProgressForUser(uid: string): Promise<void> {
  const lessonsCompleted = await getLessonsCompleted(uid);
  const wordsLearned = await getWordsLearned(uid);
  const dialoguesCompleted = await getDialoguesCompleted(uid);
  const weakSounds = await getWeakSounds(uid);

  const courseLessonsSnap = await db.collection('lessons').where('isPublished', '==', true).get();
  const totalLessons = Math.max(courseLessonsSnap.size, 1);
  const courseCompletionPercent = Math.floor((lessonsCompleted / totalLessons) * 100);

  await db.doc(`users/${uid}/derived/progress`).set(
    {
      courseCompletionPercent,
      lessonsCompleted,
      wordsLearned,
      dialoguesCompleted,
      streakDays: 0,
      pronunciationTrend: [],
      weakSounds,
      updatedAt: FieldValue.serverTimestamp(),
    },
    { merge: true }
  );
}

async function maybeUnlockAchievement(uid: string, achievementId: string, title?: string): Promise<void> {
  const ref = db.doc(`users/${uid}/achievements/${achievementId}`);
  const snap = await ref.get();
  if (!snap.exists) {
    await ref.set({
      achievementId,
      code: achievementId,
      title: title || achievementId,
      unlockedAt: FieldValue.serverTimestamp(),
    });
  }
}

export const onLessonProgressWrite = onDocumentWritten(
  'users/{uid}/lessonProgress/{lessonId}',
  async (event) => {
    const uid = event.params.uid;
    const lessonId = event.params.lessonId;
    const after = event.data?.after;
    if (!after?.exists) return;

    const lessonProgress = after.data();
    const batch = db.batch();

    if (lessonProgress.status === 'completed') {
      const lessonSnap = await db.doc(`lessons/${lessonId}`).get();
      const lesson = lessonSnap.data();

      batch.set(
        db.doc(`users/${uid}`),
        {
          currentLessonId: lessonId,
          updatedAt: FieldValue.serverTimestamp(),
        },
        { merge: true }
      );

      const wordIds: string[] = lesson?.targetWordIds || [];
      const sentenceIds: string[] = lesson?.targetSentenceIds || [];
      const tomorrow = admin.firestore.Timestamp.fromDate(
        new Date(Date.now() + 24 * 60 * 60 * 1000)
      );

      await Promise.all(
        wordIds.map((wordId) =>
          upsertReviewQueueItem({
            uid,
            contentType: 'word',
            contentId: wordId,
            dueAt: tomorrow,
            priority: 6,
            sourceReason: 'lesson_completed',
            exerciseType: 'audio_to_meaning',
          })
        )
      );

      await Promise.all(
        sentenceIds.map((sentenceId) =>
          upsertReviewQueueItem({
            uid,
            contentType: 'sentence',
            contentId: sentenceId,
            dueAt: tomorrow,
            priority: 7,
            sourceReason: 'lesson_completed',
            exerciseType: 'speak_sentence',
          })
        )
      );

      await maybeUnlockAchievement(uid, 'first_lesson_complete', 'First Lesson Complete');
    }

    await batch.commit();
    await rebuildDerivedHomeForUser(uid);
    await rebuildDerivedProgressForUser(uid);
  }
);

export const onWordProgressWrite = onDocumentWritten(
  'users/{uid}/wordProgress/{wordId}',
  async (event) => {
    const uid = event.params.uid;
    const wordId = event.params.wordId;
    const after = event.data?.after;
    if (!after?.exists) return;

    const d = after.data();
    const dueAt = admin.firestore.Timestamp.fromDate(
      new Date(Date.now() + 24 * 60 * 60 * 1000)
    );

    if (d.isHardWord === true || (d.timesIncorrect ?? 0) >= 2) {
      await upsertReviewQueueItem({
        uid,
        contentType: 'word',
        contentId: wordId,
        dueAt,
        priority: 10,
        sourceReason: d.isHardWord ? 'hard_word' : 'incorrect_attempts',
        exerciseType: 'audio_to_meaning',
      });
    }

    const wordsLearned = await getWordsLearned(uid);
    if (wordsLearned >= 100) {
      await maybeUnlockAchievement(uid, 'hundred_words', '100 Words');
    }

    await rebuildDerivedHomeForUser(uid);
    await rebuildDerivedProgressForUser(uid);
  }
);

export const onSoundProgressWrite = onDocumentWritten(
  'users/{uid}/soundProgress/{soundId}',
  async (event) => {
    const uid = event.params.uid;
    const soundId = event.params.soundId;
    const after = event.data?.after;
    if (!after?.exists) return;

    const d = after.data();
    const weak = (d.accuracyScore ?? 100) < 60 || d.difficultyFlag === true;
    if (weak) {
      await upsertReviewQueueItem({
        uid,
        contentType: 'sound',
        contentId: soundId,
        dueAt: admin.firestore.Timestamp.now(),
        priority: 9,
        sourceReason: 'low_accuracy',
        exerciseType: 'minimal_pair',
      });
    }

    await rebuildDerivedHomeForUser(uid);
    await rebuildDerivedProgressForUser(uid);
  }
);

export const onSentenceProgressWrite = onDocumentWritten(
  'users/{uid}/sentenceProgress/{sentenceId}',
  async (event) => {
    const uid = event.params.uid;
    const sentenceId = event.params.sentenceId;
    const after = event.data?.after;
    if (!after?.exists) return;

    const d = after.data();
    const weak = (d.speakingScore ?? 100) < 65;
    if (weak) {
      await upsertReviewQueueItem({
        uid,
        contentType: 'sentence',
        contentId: sentenceId,
        dueAt: admin.firestore.Timestamp.now(),
        priority: 8,
        sourceReason: 'low_speaking_score',
        exerciseType: 'speak_sentence',
      });
    }

    await rebuildDerivedProgressForUser(uid);
  }
);

export const onDialogueSessionWrite = onDocumentWritten(
  'users/{uid}/dialogueSessions/{sessionId}',
  async (event) => {
    const uid = event.params.uid;
    const after = event.data?.after;
    if (!after?.exists) return;

    const d = after.data();
    if (d.status === 'completed') {
      await maybeUnlockAchievement(uid, 'first_dialogue_complete', 'First Dialogue Complete');

      if (d.dialogueId) {
        await upsertReviewQueueItem({
          uid,
          contentType: 'dialogue',
          contentId: d.dialogueId,
          dueAt: admin.firestore.Timestamp.fromDate(
            new Date(Date.now() + 3 * 24 * 60 * 60 * 1000)
          ),
          priority: 7,
          sourceReason: 'dialogue_completed',
          exerciseType: 'dialogue_refresh',
        });
      }
    }

    await rebuildDerivedProgressForUser(uid);
  }
);

export const rebuildDerivedHome = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (!uid) throw new HttpsError('unauthenticated', 'Authentication required');
  await rebuildDerivedHomeForUser(uid);
  return { rebuilt: true };
});

export const rebuildDerivedProgress = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (!uid) throw new HttpsError('unauthenticated', 'Authentication required');
  await rebuildDerivedProgressForUser(uid);
  return { rebuilt: true };
});

export const sendDailyReviewReminders = onSchedule('every 60 minutes', async () => {
  const usersSnap = await db.collection('users').get();

  for (const userDoc of usersSnap.docs) {
    const uid = userDoc.id;
    const reminderSnap = await db.doc(`users/${uid}/reminders/default`).get();
    if (!reminderSnap.exists) continue;

    const dueCounts = await getReviewDueCounts(uid);
    const totalDue =
      dueCounts.wordCount + dueCounts.soundCount + dueCounts.sentenceCount + dueCounts.dialogueCount;

    if (totalDue <= 0) continue;

    const tokenSnap = await db.collection(`users/${uid}/deviceTokens`).get();
    const tokens = tokenSnap.docs.map((d) => d.data().deviceToken).filter(Boolean);
    if (tokens.length === 0) continue;

    await admin.messaging().sendEachForMulticast({
      tokens,
      notification: {
        title: 'Time to practice',
        body: `You have ${totalDue} review items due.`,
      },
      data: {
        type: 'review_due',
        totalDue: String(totalDue),
      },
    });
  }
});

export const cleanupOldRecordingsMetadata = onSchedule('every 24 hours', async () => {
  const cutoff = admin.firestore.Timestamp.fromDate(
    new Date(Date.now() - 90 * 24 * 60 * 60 * 1000)
  );

  const usersSnap = await db.collection('users').get();
  for (const userDoc of usersSnap.docs) {
    const attemptsSnap = await db
      .collection(`users/${userDoc.id}/speakingAttempts`)
      .where('createdAt', '<', cutoff)
      .get();

    const batch = db.batch();
    attemptsSnap.docs.forEach((doc) => batch.delete(doc.ref));
    await batch.commit();
  }
});
