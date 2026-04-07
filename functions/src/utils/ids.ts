export type ReviewContentType = 'word' | 'sound' | 'sentence' | 'dialogue';

/**
 * Deterministic document ID for a review queue item, avoiding duplicates.
 */
export function reviewQueueDocId(
  contentType: ReviewContentType,
  contentId: string
): string {
  return `${contentType}_${contentId}`;
}
