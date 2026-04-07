import { onDocumentWritten } from 'firebase-functions/v2/firestore';
import { upsertReviewQueueItem } from '../services/reviewQueueService';
import { buildDerivedHome, writeDerivedHome } from '../services/derivedHomeService';
import { daysFromNow } from '../utils/dates';

const HARD_WORD_PRIORITY = 10;
const NORMAL_WORD_PRIORITY = 6;
const OVERDUE_BOOST = 2;

/**
 * Triggered when a word progress document is created or updated.
 * - Schedules or reschedules the review queue item.
 * - Boosts priority if the word is marked as hard.
 * - Rebuilds the derived home screen data.
 */
export const onWordProgressWrite = onDocumentWritten(
  'users/{uid}/wordProgress/{wordId}',
  async (event) => {
    const uid = event.params.uid;
    const wordId = event.params.wordId;
    const after = event.data?.after?.data();

    if (!after) return;

    const isHard = !!after.isHardWord;
    let priority = isHard ? HARD_WORD_PRIORITY : NORMAL_WORD_PRIORITY;

    // Boost if failed last two attempts
    const recentAttempts: boolean[] = after.recentAttempts || [];
    const lastTwo = recentAttempts.slice(-2);
    if (lastTwo.length === 2 && lastTwo.every((r) => r === false)) {
      priority += OVERDUE_BOOST;
    }

    const daysUntilReview = isHard ? 1 : 3;

    await upsertReviewQueueItem({
      uid,
      contentType: 'word',
      contentId: wordId,
      dueAt: daysFromNow(daysUntilReview),
      priority,
      sourceReason: 'word_progress_update',
      exerciseType: 'word_flashcard',
    });

    // Rebuild home to reflect updated word state
    const homeData = await buildDerivedHome(uid);
    await writeDerivedHome(uid, homeData);
  }
);
