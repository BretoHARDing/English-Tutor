import { logger } from 'firebase-functions/v2';
import { db, FieldValue } from '../utils/firestore';
import type { ReviewContentType } from '../types';
import { reviewQueueDocId } from '../utils/ids';

// ── Interfaces ────────────────────────────────────────────────────────────

export interface UpsertReviewQueueParams {
  uid: string;
  contentType: ReviewContentType;
  contentId: string;
  dueAt: FirebaseFirestore.Timestamp;
  priority: number;
  sourceReason: string;
  exerciseType: string;
}

// ── Upsert helpers ────────────────────────────────────────────────────────

/**
 * Adds a review queue item to an existing batch.
 * Use this when the caller already owns a batch to keep writes atomic.
 */
export function addReviewQueueItemToBatch(
  batch: FirebaseFirestore.WriteBatch,
  params: UpsertReviewQueueParams
): void {
  const { uid, contentType, contentId, dueAt, priority, sourceReason, exerciseType } =
    params;
  const reviewId = reviewQueueDocId(contentType, contentId);
  const ref = db.doc(`users/${uid}/reviewQueue/${reviewId}`);

  batch.set(
    ref,
    {
      reviewId,
      contentType,
      contentId,
      dueAt,
      priority,
      sourceReason,
      exerciseType,
      completedAt: null,
      sm2Interval: 1,
      sm2Repetition: 0,
      sm2Efactor: 2.5,
      lastQuality: null,
      createdAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
    },
    { merge: true }
  );
}

/**
 * Upserts a single review queue item using its own committed write.
 * Prefer addReviewQueueItemToBatch when batching multiple writes together.
 */
export async function upsertReviewQueueItem(
  params: UpsertReviewQueueParams
): Promise<void> {
  try {
    const batch = db.batch();
    addReviewQueueItemToBatch(batch, params);
    await batch.commit();
  } catch (error) {
    logger.error('upsertReviewQueueItem failed', {
      uid: params.uid,
      contentType: params.contentType,
      contentId: params.contentId,
      error,
    });
    throw error;
  }
}

// ── SM-2 spaced repetition algorithm ─────────────────────────────────────

/**
 * SM-2 review item state stored on each review queue document.
 */
export interface Sm2State {
  interval: number;
  repetition: number;
  efactor: number;
}

/**
 * Quality of the learner response (0-5, SM-2 spec).
 * 5=perfect, 4=hesitation, 3=difficult correct, 2=incorrect easy, 1=incorrect remembered, 0=blackout
 */
export type Sm2Quality = 0 | 1 | 2 | 3 | 4 | 5;

/**
 * Compute the next SM-2 state after a review attempt.
 * Items with quality < 3 receive interval=1 (re-present next session).
 */
export function computeNextSm2(
  current: Sm2State,
  quality: Sm2Quality
): Sm2State & { nextIntervalDays: number } {
  let { interval, repetition, efactor } = current;

  if (quality < 3) {
    repetition = 0;
    interval = 1;
  } else {
    if (repetition === 0) {
      interval = 1;
    } else if (repetition === 1) {
      interval = 6;
    } else {
      interval = Math.round(interval * efactor);
    }
    repetition += 1;
  }

  efactor = Math.max(
    1.3,
    efactor + 0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02)
  );

  return { interval, repetition, efactor, nextIntervalDays: interval };
}

/**
 * Record the result of a review attempt and reschedule the item using SM-2.
 * Also increments the user's stats.reviewsCompleted counter atomically.
 */
export async function recordReviewResult(
  uid: string,
  reviewId: string,
  quality: Sm2Quality
): Promise<void> {
  try {
    const ref = db.doc(`users/${uid}/reviewQueue/${reviewId}`);
    const snap = await ref.get();
    if (!snap.exists) throw new Error(`Review item not found: ${reviewId}`);

    const data = snap.data()!;
    const current: Sm2State = {
      interval: data.sm2Interval ?? 1,
      repetition: data.sm2Repetition ?? 0,
      efactor: data.sm2Efactor ?? 2.5,
    };

    const next = computeNextSm2(current, quality);

    const nextDueDate = new Date();
    nextDueDate.setDate(nextDueDate.getDate() + next.nextIntervalDays);

    const batch = db.batch();

    batch.set(
      ref,
      {
        sm2Interval: next.interval,
        sm2Repetition: next.repetition,
        sm2Efactor: next.efactor,
        lastQuality: quality,
        dueAt: FirebaseFirestore.Timestamp.fromDate(nextDueDate),
        completedAt: FieldValue.serverTimestamp(),
        updatedAt: FieldValue.serverTimestamp(),
      },
      { merge: true }
    );

    batch.update(db.doc(`users/${uid}`), {
      'stats.reviewsCompleted': FieldValue.increment(1),
      updatedAt: FieldValue.serverTimestamp(),
    });

    await batch.commit();
  } catch (error) {
    logger.error('recordReviewResult failed', { uid, reviewId, quality, error });
    throw error;
  }
}
