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

// ── SM-2 spaced repetition algorithm ─────────────────────────────────────

/**
 * SM-2 review item state, stored alongside each review queue document.
 * `interval`  — current inter-repetition interval in days.
 * `repetition`— number of successful reviews in a row (n ≥ 0).
 * `efactor`   — ease factor (≥ 1.3), default 2.5.
 */
export interface Sm2State {
  interval: number;
  repetition: number;
  efactor: number;
}

/**
 * Quality of the learner response (0–5 scale, identical to SM-2 spec).
 *
 * 5 — perfect response
 * 4 — correct response after a hesitation
 * 3 — correct response with serious difficulty
 * 2 — incorrect; correct answer seemed easy
 * 1 — incorrect; correct answer remembered
 * 0 — complete blackout
 */
export type Sm2Quality = 0 | 1 | 2 | 3 | 4 | 5;

/**
 * Compute the next SM-2 state after a review attempt.
 *
 * Returns the new state plus the number of days until the next review.
 * Re-presents items with quality < 3 the same session (interval = 0),
 * which callers can treat as "retry immediately."
 */
export function computeNextSm2(
  current: Sm2State,
  quality: Sm2Quality
): Sm2State & { nextIntervalDays: number } {
  let { interval, repetition, efactor } = current;

  if (quality < 3) {
    // Forgotten — restart repetition count but keep (adjusted) e-factor.
    repetition = 0;
    interval = 1;
  } else {
    // Correct response
    if (repetition === 0) {
      interval = 1;
    } else if (repetition === 1) {
      interval = 6;
    } else {
      interval = Math.round(interval * efactor);
    }
    repetition += 1;
  }

  // Adjust ease factor based on response quality (SM-2 formula)
  efactor = Math.max(
    1.3,
    efactor + 0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02)
  );

  return { interval, repetition, efactor, nextIntervalDays: interval };
}

/**
 * Record the result of a review attempt for a queue item and schedule the
 * next review using the SM-2 algorithm.
 *
 * @param uid        Learner UID
 * @param reviewId   The review queue document ID (from `reviewQueueDocId`)
 * @param quality    Learner response quality (0–5)
 */
export async function recordReviewResult(
  uid: string,
  reviewId: string,
  quality: Sm2Quality
): Promise<void> {
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

  await ref.set(
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
}
