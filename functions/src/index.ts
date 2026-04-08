/**
 * Easy English Thai — Cloud Functions entry point
 *
 * Export every function so Firebase picks them up at deploy time.
 * Keep this file thin — all logic lives in triggers/, scheduled/, callable/.
 */

export { onLessonProgressWrite } from './triggers/lessonProgress';
export { onWordProgressWrite } from './triggers/wordProgress';
export { runSpacedRepetitionScheduler } from './scheduled/spacedRepetitionScheduler';
