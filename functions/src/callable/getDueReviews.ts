import { onCall, HttpsError } from 'firebase-functions/v2/https';
import { logger } from 'firebase-functions/v2';
import { db } from '../utils/firestore';
import type { ReviewQueueItem } from '../types';

const MAX_PAGE_SIZE = 50;
const DEFAULT_PAGE_SIZE = 20;

/**
 * getDueReviews — callable Cloud Function
 *
 * Returns paginated review items that are currently due for the authenticated
 * learner.  Results are sorted by dueAt ascending then priority descending so
 * the most overdue high-priority items surface first.
 *
 * Request shape:
 * ```json
 * {
 *   "limit": 20,
 *   "afterDueAt": "2026-04-01T00:00:00.000Z"  // optional cursor for pagination
 * }
 * ```
 *
 * Response shape:
 * ```json
 * {
 *   "items": [ ...ReviewQueueItem ],
 *   "hasMore": true
 * }
 * ```
 */
export const getDueReviews = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (!uid) {
    throw new HttpsError('unauthenticated', 'Authentication required.');
  }

  const rawLimit = request.data?.limit;
  const afterDueAt: string | undefined = request.data?.afterDueAt;

  const limit = Math.min(
    typeof rawLimit === 'number' && rawLimit > 0 ? rawLimit : DEFAULT_PAGE_SIZE,
    MAX_PAGE_SIZE
  );

  try {
    // Fetch one extra doc to determine hasMore without a separate count query
    let query = db
      .collection(`users/${uid}/reviewQueue`)
      .where('dueAt', '<=', new Date())
      .where('completedAt', '==', null)
      .orderBy('dueAt', 'asc')
      .orderBy('priority', 'desc')
      .limit(limit + 1);

    if (afterDueAt) {
      const cursorDate = new Date(afterDueAt);
      if (!isNaN(cursorDate.getTime())) {
        query = query.startAfter(
          FirebaseFirestore.Timestamp.fromDate(cursorDate)
        );
      }
    }

    const snap = await query.get();

    const hasMore = snap.size > limit;
    const items: ReviewQueueItem[] = snap.docs
      .slice(0, limit)
      .map((doc) => doc.data() as ReviewQueueItem);

    return { items, hasMore };
  } catch (error) {
    logger.error('getDueReviews failed', { uid, error });
    throw new HttpsError('internal', 'Failed to fetch due reviews.');
  }
});
