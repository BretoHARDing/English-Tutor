# Easy English Thai — Master handoff pack

## Purpose
This document is the master index for the full project handoff.

It links the major artifacts already created and organizes them in the order a team would typically use them:
1. product/design
2. API/backend contract
3. database/security
4. Firebase option
5. starter data
6. app architecture
7. implementation planning
8. admin/CMS
9. deployment

---

# 1. Recommended build path

## If you want the fastest mobile MVP
Use the **Firebase/Firestore** path first.

## If you want the cleaner long-term backend model
Use the **Supabase/Postgres** path first.

## If you want the cleanest execution sequence overall
Follow this order:
1. master handoff
2. MVP implementation backlog
3. chosen backend stack
4. seed content
5. Flutter architecture/repository layer
6. deployment checklist
7. admin CMS

---

# 2. Product and design artifacts

## Wireframe / screen design work
- Wireframe spec for every screen was delivered in-chat earlier in the project thread.

## Curriculum and app concept
- Full beginner curriculum was delivered in-chat earlier in the thread.
- App specification, screen definitions, and data structures were also produced in-chat earlier.

---

# 3. API and contract artifacts

## Detailed API contract
- Detailed API contract was delivered in-chat earlier.

## OpenAPI specs
- [Original OpenAPI 3.1 spec](sandbox:/mnt/data/easy-english-thai-openapi-3.1.yaml)
- [Refined OpenAPI 3.1 spec](sandbox:/mnt/data/easy-english-thai-openapi-3.1-refined.yaml)
- [Strict OpenAPI 3.1 spec](sandbox:/mnt/data/easy-english-thai-openapi-3.1-strict.yaml)

## Recommended use
- Use **strict** as the main contract for implementation.
- Keep **original** and **refined** for change history and comparison.

---

# 4. Supabase / Postgres backend pack

## Core schema
- [Supabase/Postgres schema](sandbox:/mnt/data/easy-english-thai-supabase-postgres-schema.sql)

## Security
- [Supabase RLS policies](sandbox:/mnt/data/easy-english-thai-supabase-rls-policies.sql)
- [Supabase storage policies](sandbox:/mnt/data/easy-english-thai-supabase-storage-policies.sql)

## Seed content
- [Supabase/Postgres seed data](sandbox:/mnt/data/easy-english-thai-seed-data.sql)

## Recommended use
Use this pack if:
- you want relational clarity
- you want cleaner reporting/analytics
- you want stronger long-term admin/content operations

---

# 5. Firebase / Firestore backend pack

## Rules
- [Firestore rules](sandbox:/mnt/data/easy-english-thai-firestore.rules)
- [Firebase Storage rules](sandbox:/mnt/data/easy-english-thai-storage.rules)

## Seed package
- [Firestore seed JSON](sandbox:/mnt/data/easy-english-thai-firestore-seed.json)
- [Firebase Admin SDK seed importer](sandbox:/mnt/data/easy-english-thai-firebase-seed-firestore.ts)

## Cloud Functions
- [Cloud Functions design](sandbox:/mnt/data/easy-english-thai-cloud-functions-design.md)
- [Cloud Functions starter implementation](sandbox:/mnt/data/easy-english-thai-firebase-functions-starter.ts)

## Recommended use
Use this pack if:
- you want the fastest mobile-first MVP
- you want simple user-scoped data paths
- you want easy integration with Firebase Auth, Storage, and FCM

---

# 6. Flutter app architecture artifacts

## Flutter architecture
- Flutter architecture and state implementation plan was delivered in-chat earlier.

## Firebase-specific repository/service layer
- [Flutter Firebase repository/service layer](sandbox:/mnt/data/easy-english-thai-flutter-firebase-repository-layer.md)

## Recommended use
Use this if:
- Flutter is the implementation target
- Firebase is the selected backend
- you want feature-first repository wiring guidance

---

# 7. Planning and execution artifacts

## MVP implementation backlog
- [MVP implementation backlog](sandbox:/mnt/data/easy-english-thai-mvp-implementation-backlog.md)

This is the best execution document for engineering management because it contains:
- epics
- tasks
- acceptance criteria
- sprint order
- critical path
- signoff scenarios

## Deployment planning
- [Deployment checklist](sandbox:/mnt/data/easy-english-thai-deployment-checklist.md)

Use this for:
- dev/staging/prod setup
- release readiness
- environment validation
- security and rollout checks

---

# 8. Admin and content operations artifacts

## Admin CMS
- [Admin CMS specification](sandbox:/mnt/data/easy-english-thai-admin-cms-specification.md)

Use this for:
- admin roles and permissions
- content editing workflows
- publishing lifecycle
- QA reports
- CMS screen structure

---

# 9. Suggested “single source of truth” by area

## Product scope
Use:
- MVP backlog
- admin CMS spec
- wireframe spec in chat history

## API contract
Use:
- strict OpenAPI spec

## Database
Use one of:
- Supabase/Postgres schema pack
- Firebase/Firestore schema pack

## Mobile implementation
Use:
- Flutter Firebase repository/service layer
- Flutter architecture plan in chat history

## Operations / release
Use:
- deployment checklist

---

# 10. Recommended decision points

## Decision 1 — backend choice
Choose one:
- Firebase for speed
- Supabase for long-term relational clarity

Do not build both as live production backends at the same time.

## Decision 2 — speech scoring architecture
Choose one:
- external speech API behind backend/functions
- direct speech microservice
- Cloud Function proxy

## Decision 3 — admin tooling
Choose one:
- basic CMS for MVP
- manual seed + light admin operations first
- fuller CMS after pilot

---

# 11. Best practical implementation order

## Option A — fastest MVP path
1. Firebase rules and seed
2. Firebase functions starter
3. Flutter Firebase repository layer
4. MVP backlog execution
5. deployment checklist
6. admin CMS after pilot stabilization

## Option B — long-term backend path
1. Supabase schema
2. RLS policies
3. storage policies
4. seed data
5. custom backend from OpenAPI
6. Flutter app against API
7. admin CMS

---

# 12. What is fully complete vs. what remains to build

## Completed as documentation/specification/code artifacts
- product specification
- full curriculum planning
- wireframe specification
- API contract
- OpenAPI specs
- SQL schema
- RLS and storage policies
- Firebase schema/rules
- seed packages
- Cloud Functions design/starter
- Flutter repository/service architecture
- deployment checklist
- MVP backlog
- admin CMS specification

## Not yet produced as standalone artifacts
- full Flutter starter codebase
- complete React/Next.js admin frontend codebase
- lesson player state diagram
- dialogue session state diagram
- end-to-end test suite
- production speech service implementation

---

# 13. Immediate next best actions

## If starting tomorrow with engineers
Open these in order:
1. [MVP implementation backlog](sandbox:/mnt/data/easy-english-thai-mvp-implementation-backlog.md)
2. choose backend:
   - [Firebase seed/import package](sandbox:/mnt/data/easy-english-thai-firestore-seed.json)
   - or [Supabase schema](sandbox:/mnt/data/easy-english-thai-supabase-postgres-schema.sql)
3. [Strict OpenAPI spec](sandbox:/mnt/data/easy-english-thai-openapi-3.1-strict.yaml)
4. [Flutter Firebase repository/service layer](sandbox:/mnt/data/easy-english-thai-flutter-firebase-repository-layer.md)
5. [Deployment checklist](sandbox:/mnt/data/easy-english-thai-deployment-checklist.md)

## If starting with content team first
Open:
1. [Admin CMS specification](sandbox:/mnt/data/easy-english-thai-admin-cms-specification.md)
2. [Supabase/Postgres seed data](sandbox:/mnt/data/easy-english-thai-seed-data.sql)
3. [Firestore seed JSON](sandbox:/mnt/data/easy-english-thai-firestore-seed.json)

---

# 14. Recommended final stack choice

For this specific project, the most practical recommendation is:

## MVP
- Flutter
- Firebase Auth
- Firestore
- Firebase Storage
- Cloud Functions
- speech scoring through external API or function proxy

## Later scale-up
If reporting, QA workflows, and curriculum operations become more complex:
- migrate or extend toward Supabase/Postgres-backed content/admin services

---

# 15. Handoff summary

You now have a complete planning and backend design pack covering:
- learner experience
- admin operations
- Firebase route
- Supabase route
- implementation sequencing
- release/deployment planning

This master file is intended to be the top-level entry point for the entire project handoff.
