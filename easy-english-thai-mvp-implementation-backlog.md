# Easy English Thai — Developer implementation backlog for MVP

## Purpose
This backlog turns the existing product, API, database, Firebase, Supabase, and Flutter architecture work into buildable engineering work.

It is organized as:
- delivery phases
- epics
- tasks
- acceptance criteria
- dependencies
- suggested ownership

Use this as the base for Jira, Linear, ClickUp, or GitHub Projects.

---

# 1. MVP scope definition

## Included in MVP
- guest auth
- onboarding
- home dashboard
- course map
- lesson intro
- lesson player
- speaking/recording for selected steps
- lesson completion
- word detail
- sound detail
- review queue
- progress dashboard basic
- settings
- reminders
- starter content
- admin ability to seed/manage initial content

## Excluded from MVP
- advanced partner mode
- group/family accounts
- live tutoring
- open conversation AI
- advanced analytics dashboards
- rich offline pack management beyond basic support
- full CMS polish
- payments/subscriptions

---

# 2. Delivery phases

## Phase 0
- foundation
- environment setup
- architecture scaffolding

## Phase 1
- auth
- onboarding
- home
- lesson core loop

## Phase 2
- speaking pipeline
- review
- progress
- settings

## Phase 3
- dialogues
- sounds practice
- downloads basic
- admin content operations

## Phase 4
- QA hardening
- observability
- release prep

---

# 3. Team role assumptions

Use these role tags:
- FE = Flutter/mobile
- BE = backend/API/functions
- DB = database/schema/security
- CMS = admin/content
- QA = testing
- PM = product/coordination
- DEVOPS = deployment/env

---

# 4. Epic list

## EPIC A — Project foundation
## EPIC B — Auth and session
## EPIC C — Onboarding
## EPIC D — Content read models
## EPIC E — Home dashboard
## EPIC F — Lesson player core
## EPIC G — Audio recording and speech pipeline
## EPIC H — Progress persistence
## EPIC I — Review system
## EPIC J — Sounds and words practice
## EPIC K — Dialogues
## EPIC L — Settings and reminders
## EPIC M — Admin CMS and content operations
## EPIC N — Analytics and derived data
## EPIC O — QA, security, and release

---

# 5. Detailed backlog

---

# EPIC A — Project foundation

## A1. Initialize Flutter project structure
Owner: FE  
Priority: P0

### Tasks
- create Flutter app with feature-first folder structure
- configure Riverpod
- configure GoRouter
- configure Freezed/json_serializable
- configure environment handling
- configure base theme and app shell

### Acceptance criteria
- app runs on iOS and Android
- route shell works
- build_runner works
- basic home placeholder renders
- project structure matches agreed architecture

---

## A2. Set up backend environment configuration
Owner: DEVOPS / BE  
Priority: P0

### Tasks
- create dev/staging/prod env config
- configure Firebase projects or Supabase projects
- store secrets securely
- document environment variable names

### Acceptance criteria
- dev and staging environments available
- mobile app can connect to correct environment by flavor/config
- no production secrets in source control

---

## A3. Configure code quality tooling
Owner: FE / BE  
Priority: P1

### Tasks
- Flutter lints
- formatting rules
- commit hooks optional
- TypeScript linting if Firebase functions used
- SQL migration conventions if Supabase path used

### Acceptance criteria
- lint passes in CI
- formatting is consistent
- PR checks fail on lint errors

---

## A4. CI pipeline setup
Owner: DEVOPS  
Priority: P1

### Tasks
- set up GitHub Actions or equivalent
- Flutter analyze/test job
- backend/function test job
- deployment workflow placeholders

### Acceptance criteria
- CI runs on every PR
- failing tests block merge

---

# EPIC B — Auth and session

## B1. Guest authentication flow
Owner: FE + BE  
Priority: P0

### Tasks
- implement anonymous auth sign-in
- create learner profile doc/row on first sign-in
- persist session locally
- restore session on app launch

### Acceptance criteria
- first app launch creates guest learner session
- relaunch restores session without re-auth prompt
- user profile exists in backend after guest sign-in

---

## B2. Email/password signup and login
Owner: FE + BE  
Priority: P1

### Tasks
- signup screen
- login screen
- password validation
- backend account creation/update
- logout flow

### Acceptance criteria
- user can sign up with email/password
- user can log in after logout
- failed login shows useful error
- logout clears local session state

---

## B3. Guest upgrade to registered account
Owner: FE + BE  
Priority: P1

### Tasks
- convert guest to permanent account
- preserve progress
- handle email conflict path

### Acceptance criteria
- guest user can upgrade without losing progress
- duplicate email shows correct error
- upgraded account survives reinstall/login

---

# EPIC C — Onboarding

## C1. Splash and bootstrap routing
Owner: FE  
Priority: P0

### Tasks
- splash screen
- check auth state
- check onboarding state
- route to home or onboarding

### Acceptance criteria
- signed-in onboarded user goes to home
- signed-in non-onboarded user goes to onboarding
- unauthenticated user goes through guest bootstrap

---

## C2. Language selection
Owner: FE  
Priority: P0

### Tasks
- Thai / English / bilingual selection UI
- save setting to backend/local

### Acceptance criteria
- language selection saved successfully
- next screen reflects selected interface language

---

## C3. Account/profile setup step
Owner: FE + BE  
Priority: P0

### Tasks
- display name input
- learning goal selection
- native language capture
- save onboarding profile

### Acceptance criteria
- profile info persists
- validation prevents blank required fields

---

## C4. Placement/level-check flow
Owner: FE + BE + PM  
Priority: P1

### Tasks
- render placement questions
- save answers
- compute beginner default result
- show result screen

### Acceptance criteria
- answers persist
- completion sets current level and lesson
- result screen clearly indicates starting point

---

# EPIC D — Content read models

## D1. Course map retrieval
Owner: FE + BE  
Priority: P0

### Tasks
- fetch course
- fetch level/module/unit structure
- fetch lesson summaries
- map to app models

### Acceptance criteria
- course map renders with 12 weeks
- lesson lock/completion state visible
- app handles empty/failure state gracefully

---

## D2. Lesson detail and steps retrieval
Owner: FE + BE  
Priority: P0

### Tasks
- fetch lesson detail
- fetch ordered lesson steps
- cache lesson content locally

### Acceptance criteria
- lesson intro screen renders title, duration, targets
- lesson steps ordered correctly
- repeated opens do not refetch unnecessarily if cache valid

---

## D3. Word, sentence, sound content retrieval
Owner: FE + BE  
Priority: P1

### Tasks
- fetch word detail
- fetch sentence detail
- fetch sound detail
- fetch minimal pair groups
- fetch dialogues and turns

### Acceptance criteria
- content detail screens show translations, audio, and supporting text
- missing content state handled safely

---

# EPIC E — Home dashboard

## E1. Home derived data endpoint/doc integration
Owner: FE + BE  
Priority: P0

### Tasks
- fetch derived home document or home API
- map today lesson
- map review due counts
- map recommendations
- map recent words

### Acceptance criteria
- home shows today lesson card
- home shows review counts
- home shows recommendation block
- home refresh updates after lesson completion

---

## E2. Home navigation actions
Owner: FE  
Priority: P0

### Tasks
- start/resume lesson CTA
- navigate to review
- navigate to word detail
- navigate to progress

### Acceptance criteria
- all primary home actions navigate correctly
- returning from lesson refreshes home state

---

# EPIC F — Lesson player core

## F1. Lesson intro screen
Owner: FE  
Priority: P0

### Tasks
- lesson title/subtitle
- estimated minutes
- target words/sentences preview
- start button

### Acceptance criteria
- intro renders from live data
- tapping start initializes lesson progress

---

## F2. Step renderer framework
Owner: FE  
Priority: P0

### Tasks
- create step renderer factory
- support step types:
  - audio_listen
  - syllable_drill
  - word_flashcard
  - speak_sentence
  - dialogue_turn

### Acceptance criteria
- renderer picks correct widget for each step type
- unsupported step type shows safe fallback state

---

## F3. Lesson state controller
Owner: FE  
Priority: P0

### Tasks
- current step state
- progress percent
- next/back/continue logic
- pause/exit logic
- completion transition

### Acceptance criteria
- step progression works across all implemented step types
- exiting and resuming restores state
- completion screen triggers when last step finished

---

## F4. Step progress persistence
Owner: FE + BE  
Priority: P0

### Tasks
- save per-step progress
- update parent lesson progress
- restore current step on reopen

### Acceptance criteria
- leaving mid-lesson preserves current step
- reopen resumes correctly
- lesson progress visible on home/course map

---

## F5. Lesson completion flow
Owner: FE + BE  
Priority: P0

### Tasks
- final score handling
- completion screen UI
- recommended next actions
- update course/home/progress state

### Acceptance criteria
- completed lesson marked complete in backend
- completion screen shows success state
- next lesson/review CTA available

---

# EPIC G — Audio recording and speech pipeline

## G1. Audio playback service
Owner: FE  
Priority: P0

### Tasks
- play normal audio
- play slow audio
- handle stop/pause
- prevent overlapping playback

### Acceptance criteria
- all lesson/sound/word/sentence audio plays reliably
- only one active playback at a time

---

## G2. Microphone permission flow
Owner: FE  
Priority: P0

### Tasks
- request permission
- blocked state UI
- open settings action

### Acceptance criteria
- denied permission shows clear recovery path
- allowed permission enables recording immediately

---

## G3. Audio recording service
Owner: FE  
Priority: P0

### Tasks
- start recording
- stop recording
- local path generation
- duration guardrails

### Acceptance criteria
- learner can record on speaking steps
- local file path returned successfully
- recording interruptions handled safely

---

## G4. Recording upload integration
Owner: FE + BE  
Priority: P0

### Tasks
- upload to Storage/private bucket
- return storage path/URL
- handle upload failure and retry

### Acceptance criteria
- successful upload returns valid stored asset reference
- failed upload surfaces retry path
- recording path stored with attempt when needed

---

## G5. Speech transcription integration
Owner: BE + FE  
Priority: P1

### Tasks
- call speech transcription backend/function
- return transcript and confidence
- surface transcript in UI

### Acceptance criteria
- transcription result shown after processing
- failed transcription gives retry option

---

## G6. Pronunciation scoring integration
Owner: BE + FE  
Priority: P1

### Tasks
- word scoring
- sentence scoring
- sound scoring
- feedback object mapping

### Acceptance criteria
- pronunciation score returned and displayed
- feedback is short and actionable
- user can retry without leaving lesson

---

## G7. Speaking attempt persistence
Owner: FE + BE  
Priority: P1

### Tasks
- save attempt metadata
- save transcript
- save score
- attach target context (word/sentence/lesson/dialogue)

### Acceptance criteria
- each speaking attempt can be audited in backend
- app can later use attempt history for progress

---

# EPIC H — Progress persistence

## H1. User lesson progress model
Owner: BE + FE  
Priority: P0

### Tasks
- store lesson status
- started/completed timestamps
- overall/comprehension/pronunciation score

### Acceptance criteria
- backend reflects live lesson progression
- progress view can read completed lesson count

---

## H2. Word/sound/sentence progress models
Owner: BE + FE  
Priority: P1

### Tasks
- save scores and counts
- update last seen/practiced
- calculate next review timestamps

### Acceptance criteria
- review scheduling has required fields
- progress docs/rows update after practice

---

## H3. Derived home/progress rebuild
Owner: BE  
Priority: P1

### Tasks
- derived home generator
- derived progress generator
- trigger on progress writes

### Acceptance criteria
- home and progress documents refresh after lesson/review completion
- weak sounds appear when expected

---

# EPIC I — Review system

## I1. Review queue generation
Owner: BE  
Priority: P1

### Tasks
- queue word items after lesson completion
- queue sound items for weak sounds
- queue sentence items for low sentence speaking score
- deterministic queue ID strategy

### Acceptance criteria
- review queue created automatically from learner activity
- no duplicate spam entries for same due item

---

## I2. Review hub screen
Owner: FE  
Priority: P1

### Tasks
- due today summary
- hard items summary
- start quick review CTA

### Acceptance criteria
- review hub matches backend counts
- no-review state handled

---

## I3. Review session player
Owner: FE  
Priority: P1

### Tasks
- fetch due items
- exercise renderer
- correct/incorrect states
- confidence selection
- next item progression

### Acceptance criteria
- learner can finish a mixed review session
- each answer updates backend
- result screen displays counts

---

## I4. Review completion persistence
Owner: FE + BE  
Priority: P1

### Tasks
- set completedAt or reschedule item
- update derived home/progress if needed

### Acceptance criteria
- completed reviews disappear from due-now list
- next review date updates as expected

---

# EPIC J — Sounds and words practice

## J1. Sounds list and detail
Owner: FE  
Priority: P1

### Tasks
- sounds hub
- category list
- sound detail screen
- example words
- audio demo controls

### Acceptance criteria
- learner can browse sound inventory
- sound detail plays normal and slow audio

---

## J2. Minimal pair practice
Owner: FE + BE  
Priority: P2

### Tasks
- fetch minimal pair group
- listen/choose/speak interaction
- update sound progress

### Acceptance criteria
- learner can complete minimal pair exercise
- results update sound progress

---

## J3. Words list and detail
Owner: FE  
Priority: P1

### Tasks
- list words
- search/filter basic
- detail screen
- favorite toggle

### Acceptance criteria
- learner can open word details from list/home
- favorite state persists

---

## J4. Word review exercises
Owner: FE  
Priority: P2

### Tasks
- audio to meaning
- speak word
- picture to word optional if assets exist

### Acceptance criteria
- word review updates progress and hard/favorite state correctly

---

# EPIC K — Dialogues

## K1. Dialogue list and intro
Owner: FE  
Priority: P2

### Tasks
- dialogue list
- context filters basic
- dialogue intro screen
- start session button

### Acceptance criteria
- learner can browse starter dialogues
- intro displays target phrases and context

---

## K2. Dialogue session state machine
Owner: FE  
Priority: P2

### Tasks
- current turn logic
- play app turn
- record learner turn
- process response
- retry with hint
- completion logic

### Acceptance criteria
- dialogue session progresses turn by turn
- learner turn can be retried
- accepted responses move to next turn

---

## K3. Dialogue persistence and scoring
Owner: FE + BE  
Priority: P2

### Tasks
- save session
- save turn responses
- mark complete
- update progress summary

### Acceptance criteria
- completed dialogue appears in learner progress
- dialogue review item may be queued if configured

---

# EPIC L — Settings and reminders

## L1. Profile screen
Owner: FE  
Priority: P1

### Tasks
- display name
- learning goal
- account status guest/registered

### Acceptance criteria
- profile reads live learner data
- editable fields save successfully

---

## L2. Settings screen
Owner: FE  
Priority: P1

### Tasks
- translation toggle
- bilingual mode
- subtitles
- voice gender
- audio speed
- strict answer mode

### Acceptance criteria
- settings persist and reload correctly
- lesson/player behavior reflects applicable settings

---

## L3. Reminder configuration
Owner: FE + BE  
Priority: P1

### Tasks
- reminder time picker
- save reminder doc/settings
- device token registration
- scheduled reminder sender

### Acceptance criteria
- reminder settings persist
- test push reminder can be triggered
- disabled reminders do not send

---

## L4. Delete recordings
Owner: FE + BE  
Priority: P2

### Tasks
- delete recordings action
- remove metadata
- remove storage assets if required

### Acceptance criteria
- user can request recording cleanup
- deleted recordings no longer accessible

---

# EPIC M — Admin CMS and content operations

## M1. Seed content import
Owner: CMS + BE  
Priority: P0

### Tasks
- load starter course
- verify lessons/words/sentences/sounds/dialogues
- verify storage asset paths

### Acceptance criteria
- app has enough content for full MVP flow
- no missing critical content for first 12 weeks path

---

## M2. Admin auth and access control
Owner: BE  
Priority: P1

### Tasks
- define admin role
- secure admin read/write operations
- verify learner cannot access admin content ops

### Acceptance criteria
- admin-only actions are restricted
- learner auth cannot mutate published content

---

## M3. Basic content management operations
Owner: CMS + BE  
Priority: P2

### Tasks
- create/update lesson
- create/update word
- create/update sentence
- create/update dialogue
- publish/unpublish lesson/dialogue

### Acceptance criteria
- content can be updated without DB manual edits
- publish state respected by learner app

---

## M4. Content QA checks
Owner: CMS + BE  
Priority: P2

### Tasks
- missing audio report
- missing translation report
- missing dialogue turns report

### Acceptance criteria
- QA issues detectable before release

---

# EPIC N — Analytics and derived data

## N1. Client analytics instrumentation
Owner: FE  
Priority: P1

### Tasks
- event service
- track core lesson/review/dialogue/settings events
- queue events if offline

### Acceptance criteria
- lesson start/completion events visible
- review completion event visible
- settings change event visible

---

## N2. Backend analytics ingest / storage
Owner: BE  
Priority: P2

### Tasks
- accept client analytics
- store or forward to analytics platform
- basic reporting hooks

### Acceptance criteria
- events can be queried or viewed in analytics tool

---

## N3. Achievement unlocking logic
Owner: BE  
Priority: P2

### Tasks
- first lesson complete
- first dialogue complete
- 100 words learned
- 7-day streak placeholder or actual

### Acceptance criteria
- achievements appear at correct milestones

---

# EPIC O — QA, security, and release

## O1. Automated unit tests
Owner: FE + BE  
Priority: P1

### Tasks
- repository tests
- controller tests
- Cloud Function/service tests
- schema/rules sanity tests

### Acceptance criteria
- core repositories and controllers covered
- critical business logic tested

---

## O2. Widget and flow tests
Owner: FE + QA  
Priority: P1

### Tasks
- onboarding flow
- lesson flow
- review flow
- settings flow

### Acceptance criteria
- major navigation and rendering regressions caught in tests

---

## O3. Security verification
Owner: BE + QA  
Priority: P0

### Tasks
- validate Firestore/Supabase policies
- verify private recordings inaccessible cross-user
- verify admin-only write paths
- verify no public secret leakage

### Acceptance criteria
- negative access tests pass
- owner-only data isolation confirmed

---

## O4. Release readiness
Owner: PM + QA + DEVOPS  
Priority: P0

### Tasks
- environment smoke tests
- seed validation
- push notification test
- crash reporting test
- app store build prep

### Acceptance criteria
- staging signoff complete
- release checklist complete
- pilot users can complete lesson loop without blocker

---

# 6. Suggested sprint order

## Sprint 1
- A1
- A2
- B1
- C1
- C2
- E1
- F1

## Sprint 2
- D1
- D2
- F2
- F3
- H1

## Sprint 3
- G1
- G2
- G3
- F4
- F5

## Sprint 4
- G4
- G5
- G6
- G7
- H2
- N1

## Sprint 5
- I1
- I2
- I3
- I4
- E2
- L2

## Sprint 6
- J1
- J3
- L1
- L3
- O1
- O3

## Sprint 7
- K1
- K2
- K3
- N3
- O2
- O4

## Sprint 8
- M1
- M2
- M3
- M4
- N2
- polish

---

# 7. MVP critical path

These tasks must land for MVP to be real:

- A1
- A2
- B1
- C1
- C2
- C3
- E1
- D2
- F1
- F2
- F3
- F4
- F5
- G1
- G2
- G3
- G4
- G5 or fallback mocked transcription
- H1
- I1
- I2
- I3
- L2
- L3
- M1
- O3
- O4

Without these, the product is not complete enough for pilot users.

---

# 8. Acceptance test scenarios for MVP signoff

## Scenario 1 — brand new learner
- installs app
- enters as guest
- selects Thai UI
- completes onboarding
- starts first lesson
- listens, records, retries, completes lesson
- returns to home and sees updated progress

## Scenario 2 — speaking step failure recovery
- learner denies mic permission
- app shows fallback/recovery path
- learner enables permission
- learner records successfully
- transcription/pronunciation feedback shown

## Scenario 3 — review generation
- learner completes lesson
- review items appear later/in due queue
- learner completes review session
- counts update correctly

## Scenario 4 — returning user
- closes app mid-lesson
- reopens app
- resumes from saved step

## Scenario 5 — reminder
- learner sets reminder
- device token registered
- scheduled reminder can be received in test environment

---

# 9. Suggested ticket format

Use this format for actual tracking.

## Title
`[EPIC CODE] Short action-oriented task name`

## Description
- purpose
- scope
- implementation notes
- out of scope

## Acceptance criteria
- bullet list
- test conditions
- error states if relevant

## Dependencies
- blocking tasks
- required backend/content readiness

## Labels
- feature area
- platform
- priority
- env

---

# 10. Example task written in ticket form

## [F3] Implement lesson player controller

### Description
Create the controller that manages lesson session state, current step index, step transitions, progress persistence hooks, and completion routing.

### Acceptance criteria
- loads lesson steps in order
- exposes current step to UI
- supports continue/advance logic
- updates completion percent
- restores current step from saved lesson progress
- emits completed state on final step

### Dependencies
- D2 lesson detail and steps retrieval
- H1 lesson progress model
- F2 step renderer framework

### Owner
FE

### Priority
P0

---

# 11. Best immediate execution order

If you want the fastest real build, start implementation in this order:

1. foundation setup  
2. guest auth  
3. onboarding  
4. home dashboard  
5. lesson detail + steps  
6. lesson player controller  
7. audio playback  
8. mic + recording  
9. progress persistence  
10. lesson completion  
11. review queue  
12. settings + reminders  
13. dialogues  
14. admin cleanup and QA

That gives a usable pilot faster than trying to build everything evenly.

