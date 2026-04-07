# Easy English Thai — Admin CMS specification

## Purpose
This document defines the standalone **Admin CMS** for managing the English-learning app content.

It covers:
- admin roles and permissions
- information architecture
- screen inventory
- workflows
- content models
- validation rules
- publishing lifecycle
- QA tooling
- operational requirements

This spec is aligned with the previously defined:
- API contract
- OpenAPI spec
- Supabase/Postgres schema
- Firebase/Firestore schema
- Flutter/mobile product structure

---

# 1. CMS goals

The CMS exists to let authorized staff:

- create and edit curriculum structure
- manage lessons, sounds, words, sentences, dialogues, and packs
- upload and attach media assets
- publish or unpublish content safely
- detect content gaps before release
- review basic learner-impacting metrics

The CMS is **not** intended for:
- full BI/warehouse analytics
- support ticketing
- subscription/billing operations
- freeform AI content generation in MVP

---

# 2. Primary admin users

## 2.1 Content manager
Responsibilities:
- create/edit lessons
- manage word/sentence/sound/dialogue content
- manage publishing

## 2.2 Linguistic reviewer
Responsibilities:
- verify Thai meanings
- verify pronunciation hints
- verify sentence naturalness
- verify dialogue correctness

## 2.3 Audio/media editor
Responsibilities:
- upload audio/image assets
- attach assets to content
- replace broken media
- confirm format/duration quality

## 2.4 QA/content operations
Responsibilities:
- run QA reports
- find missing content
- verify lesson completeness
- support release checklist

## 2.5 Admin/super admin
Responsibilities:
- role assignment
- content publishing authority
- system configuration
- audit access

---

# 3. Role and permission model

## Roles
- `content_editor`
- `linguistic_reviewer`
- `media_editor`
- `qa_editor`
- `admin`
- `super_admin`

## Permission groups

### Content structure
- view courses
- edit courses
- edit levels/modules/units
- reorder lessons

### Lesson content
- create lesson
- edit lesson
- add/edit steps
- publish lesson

### Library content
- create/edit words
- create/edit sentences
- create/edit sounds
- create/edit minimal pairs
- create/edit dialogues

### Media
- upload asset
- replace asset
- delete asset
- attach asset to content

### QA
- view QA reports
- resolve QA issues
- export QA list

### Admin
- manage users/roles
- view audit log
- publish global content
- change config

## Recommended permissions by role

### content_editor
- content structure: yes
- lesson content: yes
- library content: yes
- media upload: no
- QA: limited
- admin: no

### linguistic_reviewer
- content structure: read
- lesson content: edit text only
- library content: edit text only
- media: no
- QA: yes
- admin: no

### media_editor
- content structure: read
- lesson content: limited
- library content: limited
- media: yes
- QA: limited
- admin: no

### qa_editor
- view all content
- view QA reports
- mark issues resolved
- no publish unless explicitly granted

### admin
- all standard content and publish permissions

### super_admin
- all permissions including role management and system settings

---

# 4. CMS product structure

## Main navigation
- Dashboard
- Curriculum
- Lessons
- Words
- Sentences
- Sounds
- Dialogues
- Minimal Pairs
- Assets
- Download Packs
- QA Reports
- Analytics
- Users & Roles
- Settings
- Audit Log

For MVP, the minimum practical nav is:
- Dashboard
- Curriculum
- Lessons
- Words
- Sentences
- Sounds
- Dialogues
- Assets
- QA Reports

---

# 5. Dashboard specification

## Purpose
Give admins a quick operational view.

## Widgets
- draft lessons count
- published lessons count
- missing audio issues count
- missing translation issues count
- recently updated content
- content awaiting review
- top weak sounds from learner data
- quick links:
  - create lesson
  - upload asset
  - run QA check

## Actions
- jump to incomplete lesson
- open QA issue list
- open recent content edits

## Data requirements
- lesson counts by publish state
- issue counts by type
- recent content activity
- optional learner trend summary

---

# 6. Curriculum management specification

## 6.1 Curriculum list screen
Shows:
- courses
- levels
- modules/weeks
- units
- lesson counts

Actions:
- create level/module/unit
- reorder modules
- open unit
- open lesson list

## 6.2 Course detail screen
Fields:
- title
- description
- source language
- target language
- version
- publish state

Sections:
- levels
- metadata
- release notes optional

## 6.3 Level/module/unit editor
Fields:
- title
- description
- order
- linked children

Actions:
- create child
- reorder child items
- archive optional

## 6.4 Lesson ordering screen
Purpose:
- reorder lessons inside unit
- visualize publish state
- detect gaps

Columns:
- order
- lesson ID
- title
- type
- sound focus
- publish state
- updated at

Actions:
- drag reorder
- duplicate lesson
- create lesson
- publish/unpublish lesson

---

# 7. Lesson management specification

## 7.1 Lesson list screen
Filters:
- unit
- week/module
- level
- published/draft
- sound focus
- search text

Columns:
- lesson ID
- title
- subtitle
- lesson type
- sound focus
- estimated minutes
- step count
- publish state
- last updated

Bulk actions:
- publish
- unpublish
- export
- move unit optional

## 7.2 Lesson detail/editor screen

### Header
- lesson ID
- title
- subtitle
- publish badge
- save button
- publish/unpublish button
- preview button

### Metadata section
Fields:
- unit
- lesson order
- title
- subtitle
- estimated minutes
- lesson type
- sound focus
- review lesson flag

### Targets section
- target words
- target sentences

Actions:
- add/remove word
- add/remove sentence
- reorder targets optional

### Steps section
Displays ordered lesson steps.

Each step row shows:
- step order
- step type
- instruction EN
- instruction TH
- payload summary
- passing rule summary

Actions:
- add step
- edit step
- duplicate step
- delete step
- drag reorder

### Validation panel
Checks:
- has title
- has at least one step
- steps in valid order
- required targets exist
- referenced assets exist
- no broken sound/word/sentence references

## 7.3 Step editor modal/screen
Fields:
- step type
- step order
- instruction EN
- instruction TH
- payload JSON or structured fields
- passing rule JSON or structured fields

Structured step forms should exist for common step types.

### audio_listen
Fields:
- sound ID or asset
- autoplay optional
- slow version optional

### syllable_drill
Fields:
- syllables list
- prompt text
- target sound

### word_flashcard
Fields:
- selected word IDs
- reveal mode
- audio enabled

### speak_sentence
Fields:
- target sentence ID
- minimum attempts
- scoring enabled

### dialogue_turn
Fields:
- dialogue ID or inline prompt reference
- hint mode
- retry limit

---

# 8. Word management specification

## 8.1 Word list screen
Filters:
- category
- difficulty
- lesson
- sound
- published usage
- search by English/Thai

Columns:
- word ID
- English
- Thai
- category
- difficulty
- syllable split
- audio status
- image status
- used in lessons count

Actions:
- create word
- edit word
- duplicate
- delete if unused
- open usages

## 8.2 Word editor screen
Fields:
- word ID/stable key
- English text
- Thai text
- transliteration optional
- pronunciation hint
- IPA optional
- syllable split
- part of speech
- category
- difficulty
- frequency rank optional

Media section:
- image asset
- normal audio asset
- slow audio asset

Links section:
- sound IDs
- example sentence
- lesson usages

Validation:
- English required
- Thai required
- category required
- syllable split present
- no duplicate stable key
- audio/image references valid

---

# 9. Sentence management specification

## 9.1 Sentence list screen
Filters:
- sentence pattern
- difficulty
- lesson
- search by English/Thai

Columns:
- sentence ID
- English
- Thai
- pattern
- audio status
- used in lessons count

## 9.2 Sentence editor screen
Fields:
- sentence ID/stable key
- English text
- Thai text
- pronunciation hint
- IPA optional
- sentence pattern
- difficulty
- target word IDs

Media:
- normal audio
- slow audio

Links:
- lesson usages

Validation:
- English required
- Thai required
- valid sentence pattern required
- target words must exist

---

# 10. Sentence pattern management

## Pattern list screen
Columns:
- pattern ID
- pattern text
- Thai text
- difficulty
- example count

## Pattern editor
Fields:
- pattern text
- Thai text
- explanation TH
- difficulty
- example sentence links

---

# 11. Sound management specification

## 11.1 Sound list screen
Filters:
- category
- Thai difficulty flag
- used in lessons
- search

Columns:
- sound ID
- code
- display symbol
- title
- category
- difficulty flag
- audio status
- example words count

## 11.2 Sound editor screen
Fields:
- sound ID/stable key
- sound code
- display symbol
- title
- description TH
- mouth hint
- category
- Thai difficulty flag

Media:
- demo audio normal
- demo audio slow
- mouth diagram optional

Links:
- example words
- lesson usages
- minimal pair groups

Validation:
- sound code unique
- display symbol required
- at least one demo audio preferred before publish

---

# 12. Minimal pairs specification

## Minimal pair group list
Columns:
- group ID
- title
- sound A
- sound B
- item count

## Group editor
Fields:
- title
- sound A
- sound B

Items list:
- pair ID
- word A
- word B
- audio A
- audio B

Validation:
- sound A != sound B
- word A != word B
- all linked words exist

---

# 13. Dialogue management specification

## 13.1 Dialogue list screen
Filters:
- context
- mode
- level
- published/draft
- search

Columns:
- dialogue ID
- title
- context
- mode
- level
- turn count
- publish state

## 13.2 Dialogue editor screen

### Metadata
- title
- description
- context type
- mode
- level
- publish state

### Target phrases
- string list editor

### Turns section
Each turn shows:
- turn order
- speaker
- text
- Thai text
- expected answers count
- audio status

Actions:
- add turn
- reorder turns
- duplicate turn
- delete turn

### Turn editor
Fields:
- turn order
- speaker (app/learner)
- text
- Thai text
- audio asset
- expected answers list
- validation type
- hint text

Validation:
- app turn should usually have text or audio
- learner turn should usually have expected answers
- turn order unique inside dialogue

---

# 14. Asset management specification

## 14.1 Asset library screen
Filters:
- asset type
- upload date
- used/unused
- content owner type
- search by filename/key

Columns:
- asset ID
- type
- filename/url
- duration or dimensions
- linked content count
- uploaded at

Actions:
- upload asset
- replace asset
- preview asset
- view usages
- archive/delete if unused

## 14.2 Asset upload flow
Fields:
- asset type
- file chooser
- optional stable key
- metadata entry
- optional auto-link target

Validation:
- allowed file type
- allowed size
- duration extracted if audio
- checksum optional
- duplicate file warning optional

## 14.3 Asset detail screen
Shows:
- preview/audio player
- metadata
- linked content
- upload history optional

---

# 15. Download packs specification

## Pack list
Columns:
- pack ID
- title
- size MB
- asset count
- published state

## Pack editor
Fields:
- title
- stable key
- files list
- manifest info
- publish state

Validation:
- checksum required
- file URLs valid
- size and asset count consistent

---

# 16. QA reports specification

## Goal
Catch publish-blocking content issues early.

## Report types
- missing normal audio
- missing slow audio
- missing image
- missing Thai translation
- missing pronunciation hint
- missing target words in lesson
- missing lesson steps
- broken asset references
- empty dialogue expected answers
- missing sentence pattern
- unused assets
- unpublished content referenced by published lesson/dialogue

## QA report screen
Filters:
- issue type
- content type
- severity
- open/resolved
- published only

Columns:
- issue ID
- content type
- content ID
- issue type
- severity
- status
- created at

Actions:
- open content
- mark resolved
- export CSV
- batch resolve optional

## Severity model
- blocker
- high
- medium
- low

### Blocker examples
- published lesson with no steps
- published lesson references missing content
- dialogue with invalid turn order
- required audio missing for mandatory speaking/listening flow

---

# 17. Analytics screen specification

MVP analytics can be simple.

## Widgets
- daily active learners
- lessons completed
- average pronunciation score
- top weak sounds
- most failed review content
- top completed dialogues

## Filters
- date range
- level
- lesson optional

This can initially be read-only and minimal.

---

# 18. Users and roles specification

## User list screen
Columns:
- user/admin ID
- email
- role
- status
- created at

Actions:
- assign role
- revoke role
- deactivate optional

## Role assignment modal
Fields:
- user identifier
- role
- effective date optional

Validation:
- at least one super admin remains
- editors cannot grant super admin unless authorized

---

# 19. Settings / system configuration

## Config screen
Fields:
- supported interface languages
- default course ID
- default timezone
- feature flags
- speech provider settings references only, not raw secrets in UI

Sensitive secrets should not be editable in the web CMS unless there is a secure platform for it.

---

# 20. Audit log specification

## Purpose
Track who changed what.

## Audit log entries
- actor
- timestamp
- entity type
- entity ID
- action
- before/after summary optional

Tracked actions:
- create
- update
- delete
- publish
- unpublish
- role change
- asset replace

## Audit log screen
Filters:
- actor
- action
- entity type
- date range

---

# 21. Publishing lifecycle

## States
- draft
- ready_for_review optional
- published
- unpublished

For MVP, minimum states can be:
- draft
- published

## Publish rules
A lesson can be published only if:
- required metadata complete
- at least one step exists
- referenced words/sentences/sounds exist
- required assets exist
- no blocker QA issues

A dialogue can be published only if:
- title/description/context/mode/level present
- at least one turn exists
- turn ordering valid
- learner turns with validation need expected answers

## Unpublish rules
Unpublishing is allowed for admins.
Warn if currently referenced from published parent structures.

---

# 22. Validation rules by content type

## Lessons
- title required
- unit required
- lesson order required
- estimated minutes > 0
- lesson type valid
- step count > 0 before publish

## Steps
- step order unique within lesson
- valid step type
- instruction EN/TH required
- payload shape valid for chosen type

## Words
- English required
- Thai required
- category required
- difficulty valid
- syllable split non-empty

## Sentences
- English required
- Thai required
- valid sentence pattern
- target words should exist

## Sounds
- code unique
- display symbol required
- category required

## Dialogues
- title required
- mode valid
- level required
- turn order unique
- learner expected answers required for validated turns

## Assets
- supported MIME type
- file path/url valid
- metadata shape valid for asset type

---

# 23. CMS workflow details

## Workflow A — create a new lesson
1. Open Lessons
2. Click Create Lesson
3. Enter metadata
4. Save draft
5. Add target words and sentences
6. Add steps
7. Run validation
8. Fix issues
9. Publish

## Workflow B — replace broken audio
1. Open QA report
2. Filter missing/broken audio
3. Open asset/content detail
4. Upload replacement
5. Attach replacement asset
6. Re-run validation
7. Mark issue resolved

## Workflow C — add new dialogue
1. Open Dialogues
2. Create metadata
3. Add target phrases
4. Add turns
5. Add hints and expected answers
6. Validate
7. Publish

## Workflow D — reorder lessons inside week
1. Open Curriculum > unit
2. Drag lesson rows
3. Save order
4. Validate no duplicate order numbers
5. Republish or auto-apply order

---

# 24. API dependencies for CMS

The CMS depends on admin endpoints already defined, including:
- `/admin/lessons`
- `/admin/lessons/{lesson_id}`
- `/admin/lessons/{lesson_id}/steps`
- `/admin/lessons/{lesson_id}/steps/reorder`
- `/admin/lessons/{lesson_id}/publish`
- `/admin/words`
- `/admin/words/{word_id}`
- `/admin/sentences`
- `/admin/sounds`
- `/admin/dialogues`
- `/admin/dialogues/{dialogue_id}/turns`
- `/admin/assets`
- `/admin/content-qa`
- `/admin/analytics/summary`

If Firebase is used directly instead of a custom admin API, equivalent admin services must be created in Cloud Functions or trusted web backend logic.

---

# 25. Recommended frontend architecture for CMS

## Stack
Best practical options:
- React + TypeScript + Next.js
- React Query
- component library such as MUI
- form library such as React Hook Form + Zod

## Pages
- dashboard
- lessons list/detail
- words list/detail
- sentences list/detail
- sounds list/detail
- dialogues list/detail
- asset library
- QA reports

## State model
- server state with React Query
- form state with RHF
- optimistic updates only where safe
- publishing actions should confirm and refetch

---

# 26. CMS non-functional requirements

## Performance
- list screens load in under 2 seconds for normal dataset sizes
- editor screens load in under 3 seconds
- search/filter responsive

## Reliability
- autosave optional later
- explicit save in MVP
- prevent silent data loss on navigation away

## Security
- admin-only access
- role-based action gating
- audit critical changes
- private assets and secrets protected

## Accessibility
- keyboard navigation for editors
- visible labels
- color contrast acceptable
- form validation readable

---

# 27. MVP CMS cut

To launch MVP, the minimum admin CMS must include:

- login/admin auth
- dashboard basic
- lesson list/detail/editor
- step editor
- word list/detail/editor
- sentence list/detail/editor
- sound list/detail/editor
- dialogue list/detail/editor
- asset upload/library
- publish/unpublish
- QA report for missing audio and broken references

Everything else can follow later.

---

# 28. Recommended implementation backlog for CMS

## Phase 1
- admin auth
- dashboard basic
- lesson list/detail
- word list/detail
- asset upload

## Phase 2
- sentence editor
- sound editor
- publish workflow
- QA report basic

## Phase 3
- dialogue editor
- curriculum reorder
- analytics summary
- audit log

---

# 29. Acceptance criteria for CMS MVP

The CMS MVP is ready when:
- an admin can create/edit/publish a lesson without DB manual edits
- an admin can attach words, sentences, and sounds to lessons
- an admin can upload and attach audio assets
- a QA user can detect missing audio and broken references
- a dialogue can be created and published
- learner app reads updated published content correctly

---

# 30. Strong next follow-up

The strongest next artifact after this would be either:
- a **CMS wireframe spec**
- a **React/Next.js admin frontend architecture**
- a **CMS implementation backlog with tickets**
- a **Zod/JSON schema validation pack for admin forms**
