/**
 * Easy English Thai — Cloud Functions entry point
 *
 * Export every function so Firebase picks them up at deploy time.
 * Keep this file thin — all logic lives in triggers/, scheduled/, callable/.
 */

// ── Firestore triggers ─────────────────────────────────────────────────────
export { onLessonProgressWrite } from './triggers/lessonProgress';
export { onWordProgressWrite } from './triggers/wordProgress';

// ── Scheduled jobs ─────────────────────────────────────────────────────────
export { runSpacedRepetitionScheduler } from './scheduled/spacedRepetitionScheduler';
export { runDailyStreakReset } from './scheduled/streakReset';
export { cleanupOldRecordings } from './scheduled/cleanupOldRecordings';

// ── Callable functions (client-facing) ────────────────────────────────────
export { completeReview } from './callable/completeReview';
export { getDueReviews } from './callable/getDueReviews';
