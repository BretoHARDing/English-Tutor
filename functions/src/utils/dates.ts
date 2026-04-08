/**
 * Returns a Firestore Timestamp for `daysFromNow` days in the future.
 */
export function daysFromNow(days: number): FirebaseFirestore.Timestamp {
  const d = new Date();
  d.setDate(d.getDate() + days);
  return FirebaseFirestore.Timestamp.fromDate(d);
}

/**
 * Returns a Firestore Timestamp for `hoursFromNow` hours in the future.
 */
export function hoursFromNow(hours: number): FirebaseFirestore.Timestamp {
  const d = new Date();
  d.setHours(d.getHours() + hours);
  return FirebaseFirestore.Timestamp.fromDate(d);
}
