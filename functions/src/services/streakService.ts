import { logger } from 'firebase-functions/v2';
import { db, FieldValue } from '../utils/firestore';
import type { StreakData } from '../types';

/** Asia/Bangkok offset from UTC in hours */
const BANGKOK_UTC_OFFSET_HOURS = 7;

/**
 * Returns the current date string 'YYYY-MM-DD' in Asia/Bangkok timezone.
 */
export function todayBangkok(): string {
  const now = new Date();
  const bangkokMs = now.getTime() + BANGKOK_UTC_OFFSET_HOURS * 60 * 60 * 1000;
  const d = new Date(bangkokMs);
  return d.toISOString().slice(0, 10);
}

/**
 * Returns the date string for yesterday in Asia/Bangkok timezone.
 */
function yesterdayBangkok(): string {
  const now = new Date();
  const bangkokMs =
    now.getTime() + BANGKOK_UTC_OFFSET_HOURS * 60 * 60 * 1000 - 24 * 60 * 60 * 1000;
  const d = new Date(bangkokMs);
  return d.toISOString().slice(0, 10);
}

/**
 * Updates the streak for a learner after they complete an activity (lesson,
 * review, or dialogue).  Reads the existing streak document, increments if
 * last active was yesterday, resets if longer ago, no-ops if already active today.
 *
 * The streak document lives at `users/{uid}/streak/current`.
 */
export async function updateStreak(uid: string): Promise<void> {
  const ref = db.doc(`users/${uid}/streak/current`);

  try {
    await db.runTransaction(async (tx) => {
      const snap = await tx.get(ref);
      const today = todayBangkok();
      const yesterday = yesterdayBangkok();

      if (!snap.exists) {
        // First activity ever
        const newStreak: StreakData = {
          currentStreak: 1,
          longestStreak: 1,
          lastActiveDate: today,
          updatedAt: FieldValue.serverTimestamp() as FirebaseFirestore.Timestamp,
        };
        tx.set(ref, newStreak);
        return;
      }

      const data = snap.data() as StreakData;

      if (data.lastActiveDate === today) {
        // Already active today — no change needed
        return;
      }

      let newCurrent: number;
      if (data.lastActiveDate === yesterday) {
        // Continued streak
        newCurrent = (data.currentStreak || 0) + 1;
      } else {
        // Broken streak — reset to 1
        newCurrent = 1;
      }

      const newLongest = Math.max(newCurrent, data.longestStreak || 0);

      tx.update(ref, {
        currentStreak: newCurrent,
        longestStreak: newLongest,
        lastActiveDate: today,
        updatedAt: FieldValue.serverTimestamp(),
      });

      // Also mirror currentStreak onto the user document for cheap reads
      tx.update(db.doc(`users/${uid}`), {
        'stats.streakDays': newCurrent,
        updatedAt: FieldValue.serverTimestamp(),
      });
    });
  } catch (error) {
    logger.error('updateStreak failed', { uid, error });
    throw error;
  }
}

/**
 * Resets the streak to 0 for a learner if their last active date is not today
 * or yesterday (i.e., they missed a full day).
 * Called by the daily scheduled streak-reset function.
 */
export async function maybeResetStreak(uid: string): Promise<boolean> {
  const ref = db.doc(`users/${uid}/streak/current`);

  try {
    let wasReset = false;
    await db.runTransaction(async (tx) => {
      const snap = await tx.get(ref);
      if (!snap.exists) return;

      const data = snap.data() as StreakData;
      const yesterday = yesterdayBangkok();
      const today = todayBangkok();

      const isActive =
        data.lastActiveDate === today || data.lastActiveDate === yesterday;

      if (!isActive && (data.currentStreak || 0) > 0) {
        tx.update(ref, {
          currentStreak: 0,
          updatedAt: FieldValue.serverTimestamp(),
        });
        tx.update(db.doc(`users/${uid}`), {
          'stats.streakDays': 0,
          updatedAt: FieldValue.serverTimestamp(),
        });
        wasReset = true;
      }
    });
    return wasReset;
  } catch (error) {
    logger.error('maybeResetStreak failed', { uid, error });
    throw error;
  }
}
