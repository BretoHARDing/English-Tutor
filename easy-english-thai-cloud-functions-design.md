# Easy English Thai — Cloud Functions design

## Goal
Maintain derived learner documents and queues so the mobile app can read:
- `users/{uid}/derived/home`
- `users/{uid}/derived/progress`
- `users/{uid}/reviewQueue/*`

without recomputing complex state on-device.

## Recommended runtime
- Node.js 20
- TypeScript
- Firebase Admin SDK
- Firestore triggers + scheduled functions + callable functions when needed

## Functions overview

### 1. `onLessonProgressWrite`
**Trigger**
- `users/{uid}/lessonProgress/{lessonId}` on create/update

**Responsibilities**
- update lessons completed count
- update current lesson pointer in `users/{uid}`
- update `users/{uid}/derived/home`
- update `users/{uid}/derived/progress`
- unlock `first_lesson_complete`
- enqueue review items for lesson words/sentences when lesson becomes completed

**Inputs**
- lesson progress document
- lesson document
- target word IDs
- target sentence IDs

**Outputs**
- `users/{uid}`
- `users/{uid}/derived/home`
- `users/{uid}/derived/progress`
- `users/{uid}/reviewQueue/*`
- `users/{uid}/achievements/first_lesson_complete`

---

### 2. `onWordProgressWrite`
**Trigger**
- `users/{uid}/wordProgress/{wordId}` on create/update

**Responsibilities**
- recompute words learned count
- add/remove hard-word recommendations
- schedule next review if missing
- update home recent words list
- update progress summary

**Rules**
- if `isHardWord == true`, increase review priority
- if `timesCorrect >= 3` and `familiarityScore >= 70`, count as learned

---

### 3. `onSoundProgressWrite`
**Trigger**
- `users/{uid}/soundProgress/{soundId}` on create/update

**Responsibilities**
- recompute weak sounds array
- surface recommended sound practice on home
- schedule sound review queue entries

**Rules**
- if `accuracyScore < 60`, mark weak
- if `difficultyFlag == true`, boost review priority

---

### 4. `onSentenceProgressWrite`
**Trigger**
- `users/{uid}/sentenceProgress/{sentenceId}` on create/update

**Responsibilities**
- schedule sentence review items
- contribute to weekly speaking confidence score
- refresh progress derived document

---

### 5. `onDialogueSessionWrite`
**Trigger**
- `users/{uid}/dialogueSessions/{sessionId}` on create/update

**Responsibilities**
- when completed, increment completed dialogues count
- update progress dashboard
- enqueue follow-up dialogue or dialogue review
- unlock first dialogue achievement

---

### 6. `rebuildDerivedHome`
**Trigger**
- callable/admin callable
- scheduled nightly fallback
- can also be invoked by other triggers internally

**Responsibilities**
Compute:
- greetingName
- todayLesson
- reviewDue counts
- recommendedPractice
- recentWords
- summary block

**Write target**
- `users/{uid}/derived/home`

---

### 7. `rebuildDerivedProgress`
**Trigger**
- callable/admin callable
- scheduled nightly fallback
- invoked by lesson/word/sound/dialogue progress triggers

**Responsibilities**
Compute:
- courseCompletionPercent
- lessonsCompleted
- wordsLearned
- dialoguesCompleted
- streakDays
- pronunciationTrend
- weakSounds

**Write target**
- `users/{uid}/derived/progress`

---

### 8. `upsertReviewQueueItem`
**Utility function**
Internal shared helper used by multiple triggers.

**Parameters**
- uid
- contentType
- contentId
- dueAt
- priority
- sourceReason
- exerciseType

**Behavior**
- use deterministic doc IDs where possible:
  - `word_word_water`
  - `sound_sound_r`
  - `sentence_sentence_i_want_water`
- update existing item rather than duplicate unless queue model requires historical records

---

### 9. `sendDailyReviewReminders`
**Trigger**
- scheduled function every hour

**Responsibilities**
- find users whose local reminder time matches
- count due review items
- send FCM push if due count > 0

**Requires**
- `users/{uid}/reminders/default`
- `users/{uid}/deviceTokens/*`

---

### 10. `cleanupOldRecordingsMetadata`
**Trigger**
- scheduled daily/weekly

**Responsibilities**
- delete stale speaking attempt metadata if retention policy requires
- optionally delete old private recordings from Storage

---

## Derived document shapes

### `users/{uid}/derived/home`
```json
{
  "greetingName": "Mali",
  "todayLesson": {
    "id": "lesson_009",
    "title": "Water and Yes",
    "estimatedMinutes": 12,
    "progressPercent": 0,
    "cta": "start"
  },
  "reviewDue": {
    "wordCount": 8,
    "soundCount": 2,
    "sentenceCount": 3,
    "dialogueCount": 1
  },
  "recommendedPractice": {
    "type": "sound",
    "targetId": "sound_w",
    "title": "Practice W sound"
  },
  "recentWords": [],
  "summary": {
    "lessonsCompleted": 8,
    "wordsLearned": 41,
    "streakDays": 6
  },
  "updatedAt": "serverTimestamp"
}
```

### `users/{uid}/derived/progress`
```json
{
  "courseCompletionPercent": 14,
  "lessonsCompleted": 8,
  "wordsLearned": 41,
  "dialoguesCompleted": 3,
  "streakDays": 6,
  "pronunciationTrend": [
    { "week": 1, "score": 62 },
    { "week": 2, "score": 67 }
  ],
  "weakSounds": [
    { "soundId": "sound_r", "label": "R", "accuracyScore": 41 }
  ],
  "updatedAt": "serverTimestamp"
}
```

---

## Priority logic for recommendations

### Home recommendation order
1. weak sound with accuracy < 60
2. hard word due now
3. unfinished current lesson
4. next unlocked lesson
5. review sentence due now

### Review priority formula
Base examples:
- hard word: 10
- weak sound: 9
- sentence due: 8
- dialogue refresh: 7
- normal word due: 6

Boosts:
- +2 if overdue > 3 days
- +2 if failed last 2 attempts
- +1 if explicitly hard/favorite for practice

---

## Suggested implementation structure

```text
functions/src/
  index.ts
  triggers/
    lessonProgress.ts
    wordProgress.ts
    soundProgress.ts
    sentenceProgress.ts
    dialogueSessions.ts
  scheduled/
    reviewReminders.ts
    cleanup.ts
  callable/
    rebuildHome.ts
    rebuildProgress.ts
  services/
    derivedHomeService.ts
    derivedProgressService.ts
    reviewQueueService.ts
    achievementService.ts
    streakService.ts
    notificationsService.ts
  utils/
    firestore.ts
    dates.ts
    ids.ts
```

---

## Important implementation notes

### Idempotency
All trigger handlers should be idempotent.
Use deterministic review queue IDs whenever possible.

### Avoid recursive trigger loops
When writing derived docs:
- only update if content actually changed
- separate source collections from derived collections

### Batch writes
Use batched writes or transactions for:
- lesson completion summary updates
- achievement unlocks
- queue item upserts

### Eventual consistency
Accept minor lag for home/progress docs.
The app should tolerate short delays.

---

## Best first functions to build
1. `onLessonProgressWrite`
2. `onWordProgressWrite`
3. `rebuildDerivedHome`
4. `rebuildDerivedProgress`
5. `sendDailyReviewReminders`

These cover the core learner experience first.
