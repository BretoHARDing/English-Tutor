export type { ReviewContentType } from '../types';

/**
 * Deterministic document ID for a review queue item, avoiding duplicates.
 */
export function reviewQueueDocId(
  contentType: import('../types').ReviewContentType,
  contentId: string
): string {
  return `${contentType}_${contentId}`;
}
