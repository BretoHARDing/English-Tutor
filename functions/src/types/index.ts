import type * as admin from 'firebase-admin';

// ── Review Queue ──────────────────────────────────────────────────────────

export type ReviewContentType = 'word' | 'sound' | 'sentence' | 'dialogue';

export interface ReviewQueueItem {
  reviewId: string;
  contentType: ReviewContentType;
  contentId: string;
  dueAt: admin.firestore.Timestamp;
  completedAt: admin.firestore.Timestamp | null;
  priority: number;
  sourceReason: string;
  exerciseType: string;
  sm2Interval: number;
  sm2Repetition: number;
  sm2Efactor: number;
  lastQuality: number | null;
  scheduledBySystem?: boolean;
  createdAt: admin.firestore.Timestamp;
  updatedAt: admin.firestore.Timestamp;
}

// ── User stats (aggregate counters stored on the user document) ───────────

export interface UserStats {
  lessonsCompleted: number;
  wordsLearned: number;
  dialoguesCompleted: number;
  speakingAttemptsCount: number;
}

// ── Streak ────────────────────────────────────────────────────────────────

export interface StreakData {
  currentStreak: number;
  longestStreak: number;
  lastActiveDate: string; // ISO date string 'YYYY-MM-DD' in Asia/Bangkok tz
  updatedAt: admin.firestore.Timestamp;
}

// ── Pronunciation trend ───────────────────────────────────────────────────

export interface PronunciationTrendPoint {
  week: number;   // ISO week number (1-52)
  year: number;
  score: number;  // average accuracy score for that week (0-100)
}

// ── Weak sound (with hasMore support) ────────────────────────────────────

export interface WeakSound {
  soundId: string;
  label: string;
  accuracyScore: number;
}

// ── Push notification payload ─────────────────────────────────────────────

export interface PushPayload {
  notification: { title: string; body: string };
  /** Deep-link route opened when the learner taps the notification. */
  data?: { route: string; [key: string]: string };
}
