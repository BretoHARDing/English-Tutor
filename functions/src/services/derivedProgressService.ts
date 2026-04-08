import { logger } from 'firebase-functions/v2';
import { db, FieldValue } from '../utils/firestore';
import type { PronunciationTrendPoint, WeakSound } from '../types';

const WEAK_SOUNDS_PAGE_SIZE = 5;

export interface DerivedProgressData {
  courseCompletionPercent: number;
  lessonsCompleted: number;
  wordsLearned: number;
  dialoguesCompleted: number;
  streakDays: number;
  pronunciationTrend: PronunciationTrendPoint[];
  weakSounds: WeakSound[];
  weakSoundsHasMore: boolean;
}

export async function writeDerivedProgress(
  uid: string,
  data: DerivedProgressData
): Promise<void> {
  try {
    await db.doc(`users/${uid}/derived/progress`).set(
      { ...data, updatedAt: FieldValue.serverTimestamp() },
      { merge: true }
    );
  } catch (error) {
    logger.error('writeDerivedProgress failed', { uid, error });
    throw error;
  }
}

export async function buildDerivedProgress(uid: string): Promise<DerivedProgressData> {
  try {
    // Fetch user doc (aggregate counters + trend), weak sounds, and
    // recent speaking attempts (for pronunciation trend) concurrently.
    const [userDoc, soundProgressSnap, speakingAttemptsSnap] = await Promise.all([
      db.doc(`users/${uid}`).get(),
      db
        .collection(`users/${uid}/soundProgress`)
        .where('accuracyScore', '<', 60)
        .orderBy('accuracyScore', 'asc')
        // Fetch one extra to determine hasMore
        .limit(WEAK_SOUNDS_PAGE_SIZE + 1)
        .get(),
      // Most recent 50 speaking attempts to compute pronunciation trend
      db
        .collection(`users/${uid}/speakingAttempts`)
        .where('pronunciationScore', '>', 0)
        .orderBy('createdAt', 'desc')
        .limit(50)
        .get(),
    ]);

    const userData = userDoc.data() || {};
    const stats = (userData.stats as Record<string, number>) || {};

    // Read aggregate counters (O(1) instead of full subcollection scans)
    const lessonsCompleted = stats.lessonsCompleted ?? 0;
    const wordsLearned = stats.wordsLearned ?? 0;
    const dialoguesCompleted = stats.dialoguesCompleted ?? 0;
    const streakDays = stats.streakDays ?? 0;

    // Total lessons from appConfig (falls back to constant if not set)
    const appConfigDoc = await db.doc('appConfig/content').get();
    const TOTAL_LESSONS: number =
      (appConfigDoc.exists ? appConfigDoc.data()?.totalLessons : undefined) ?? 50;

    const courseCompletionPercent = Math.round(
      (lessonsCompleted / TOTAL_LESSONS) * 100
    );

    // Weak sounds with hasMore flag
    const weakSoundsHasMore = soundProgressSnap.size > WEAK_SOUNDS_PAGE_SIZE;
    const weakSounds: WeakSound[] = soundProgressSnap.docs
      .slice(0, WEAK_SOUNDS_PAGE_SIZE)
      .map((doc) => {
        const d = doc.data();
        return {
          soundId: d.soundId,
          label: d.label || d.soundId,
          accuracyScore: d.accuracyScore || 0,
        };
      });

    // Pronunciation trend: compute weekly average from speakingAttempts
    const weekScores: Map<string, { sum: number; count: number }> = new Map();
    speakingAttemptsSnap.forEach((doc) => {
      const d = doc.data();
      const score: number = d.pronunciationScore ?? 0;
      const createdAt: Date = d.createdAt?.toDate?.() ?? new Date();

      // ISO week key 'YYYY-WW'
      const weekKey = getIsoWeekKey(createdAt);
      const existing = weekScores.get(weekKey) ?? { sum: 0, count: 0 };
      weekScores.set(weekKey, { sum: existing.sum + score, count: existing.count + 1 });
    });

    const pronunciationTrend: PronunciationTrendPoint[] = Array.from(
      weekScores.entries()
    )
      .map(([key, { sum, count }]) => {
        const [yearStr, weekStr] = key.split('-W');
        return {
          year: parseInt(yearStr, 10),
          week: parseInt(weekStr, 10),
          score: Math.round(sum / count),
        };
      })
      .sort((a, b) => a.year - b.year || a.week - b.week)
      .slice(-12); // Keep the last 12 weeks

    return {
      courseCompletionPercent,
      lessonsCompleted,
      wordsLearned,
      dialoguesCompleted,
      streakDays,
      pronunciationTrend,
      weakSounds,
      weakSoundsHasMore,
    };
  } catch (error) {
    logger.error('buildDerivedProgress failed', { uid, error });
    throw error;
  }
}

// ── Helpers ───────────────────────────────────────────────────────────────

/**
 * Returns an ISO week key 'YYYY-WNN' for a given Date.
 * Uses a simple Thursday-based ISO week calculation.
 */
function getIsoWeekKey(date: Date): string {
  const d = new Date(date);
  d.setHours(0, 0, 0, 0);
  // Thursday of the current week
  d.setDate(d.getDate() + 3 - ((d.getDay() + 6) % 7));
  const year = d.getFullYear();
  const startOfYear = new Date(year, 0, 4); // Jan 4 is always in week 1
  const week = Math.round(
    ((d.getTime() - startOfYear.getTime()) / 86400000 + ((startOfYear.getDay() + 6) % 7)) / 7
  ) + 1;
  return `${year}-W${String(week).padStart(2, '0')}`;
}
