import { db, FieldValue } from '../utils/firestore';
import type { ReviewContentType } from '../utils/ids';
import { reviewQueueDocId } from '../utils/ids';

export interface UpsertReviewQueueParams {
  uid: string;
  contentType: ReviewContentType;
  contentId: string;
  dueAt: FirebaseFirestore.Timestamp;
  priority: number;
  sourceReason: string;
  exerciseType: string;
}

/**
 * Upserts a single review queue item for a learner.
 * Uses a deterministic doc ID to avoid duplicates.
 */
export async function upsertReviewQueueItem(
  params: UpsertReviewQueueParams
): Promise<void> {
  const { uid, contentType, contentId, dueAt, priority, sourceReason, exerciseType } =
    params;
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
