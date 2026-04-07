
-- Easy English Thai
-- Supabase Storage bucket layout and storage policies
-- Assumptions:
--   1) auth.uid() is available
--   2) public.users.auth_user_id maps to auth.uid()
--   3) public.is_admin_user() function exists from the RLS policy file
--   4) public.current_app_user_id() exists, though storage policies mostly use auth.uid()

-- =========================================================
-- BUCKET LAYOUT
-- =========================================================
-- Public content buckets:
--   lesson-audio       -> published lesson audio (normal/slow)
--   lesson-images      -> word images, diagrams, icons
--   downloadable-packs -> downloadable audio/content pack files
--
-- Private bucket:
--   user-recordings    -> learner speech recordings
--
-- Suggested object key patterns:
--
-- lesson-audio:
--   courses/<course_key>/lessons/<lesson_key>/<filename>.mp3
--   sounds/<sound_key>/<variant>.mp3
--   dialogues/<dialogue_key>/<turn_order>.mp3
--
-- lesson-images:
--   words/<word_key>/<filename>.png
--   sounds/<sound_key>/<filename>.png
--   icons/<filename>.svg
--
-- downloadable-packs:
--   packs/<pack_key>/<filename>.zip
--   manifests/<pack_key>.json
--
-- user-recordings:
--   users/<auth.uid()>/<yyyy>/<mm>/<uuid>.m4a

-- =========================================================
-- CREATE BUCKETS
-- =========================================================

insert into storage.buckets (id, name, public)
values
  ('lesson-audio', 'lesson-audio', true),
  ('lesson-images', 'lesson-images', true),
  ('downloadable-packs', 'downloadable-packs', true),
  ('user-recordings', 'user-recordings', false)
on conflict (id) do update
set public = excluded.public;

-- =========================================================
-- HELPER FUNCTIONS FOR STORAGE
-- =========================================================

create or replace function public.storage_foldername(name text)
returns text[]
language sql
immutable
as $$
  select string_to_array(name, '/')
$$;

create or replace function public.storage_user_owns_path(name text)
returns boolean
language sql
stable
as $$
  select
    coalesce((public.storage_foldername(name))[1], '') = 'users'
    and coalesce((public.storage_foldername(name))[2], '') = auth.uid()::text
$$;

-- =========================================================
-- CLEAN SLATE: DROP EXISTING POLICIES IF PRESENT
-- =========================================================

drop policy if exists "lesson-audio public read" on storage.objects;
drop policy if exists "lesson-images public read" on storage.objects;
drop policy if exists "downloadable-packs public read" on storage.objects;
drop policy if exists "admins manage public media" on storage.objects;
drop policy if exists "users read own recordings" on storage.objects;
drop policy if exists "users upload own recordings" on storage.objects;
drop policy if exists "users update own recordings" on storage.objects;
drop policy if exists "users delete own recordings" on storage.objects;
drop policy if exists "admins manage user recordings" on storage.objects;

-- =========================================================
-- PUBLIC READ ACCESS FOR PUBLISHED APP MEDIA
-- =========================================================
-- Since these buckets are public, direct file serving is allowed.
-- These policies protect object table access through SQL/API.

create policy "lesson-audio public read"
on storage.objects
for select
to public
using (bucket_id = 'lesson-audio');

create policy "lesson-images public read"
on storage.objects
for select
to public
using (bucket_id = 'lesson-images');

create policy "downloadable-packs public read"
on storage.objects
for select
to public
using (bucket_id = 'downloadable-packs');

-- =========================================================
-- ADMIN MANAGEMENT OF PUBLIC CONTENT BUCKETS
-- =========================================================

create policy "admins manage public media"
on storage.objects
for all
to authenticated
using (
  public.is_admin_user()
  and bucket_id in ('lesson-audio', 'lesson-images', 'downloadable-packs')
)
with check (
  public.is_admin_user()
  and bucket_id in ('lesson-audio', 'lesson-images', 'downloadable-packs')
);

-- =========================================================
-- PRIVATE USER RECORDINGS
-- =========================================================
-- Users can only manage objects in:
--   user-recordings / users / <auth.uid()> / ...

create policy "users read own recordings"
on storage.objects
for select
to authenticated
using (
  bucket_id = 'user-recordings'
  and public.storage_user_owns_path(name)
);

create policy "users upload own recordings"
on storage.objects
for insert
to authenticated
with check (
  bucket_id = 'user-recordings'
  and public.storage_user_owns_path(name)
);

create policy "users update own recordings"
on storage.objects
for update
to authenticated
using (
  bucket_id = 'user-recordings'
  and public.storage_user_owns_path(name)
)
with check (
  bucket_id = 'user-recordings'
  and public.storage_user_owns_path(name)
);

create policy "users delete own recordings"
on storage.objects
for delete
to authenticated
using (
  bucket_id = 'user-recordings'
  and public.storage_user_owns_path(name)
);

-- =========================================================
-- ADMIN ACCESS TO PRIVATE RECORDINGS
-- =========================================================

create policy "admins manage user recordings"
on storage.objects
for all
to authenticated
using (
  public.is_admin_user()
  and bucket_id = 'user-recordings'
)
with check (
  public.is_admin_user()
  and bucket_id = 'user-recordings'
);

-- =========================================================
-- OPTIONAL TIGHTENING NOTES
-- =========================================================
-- If you want to force file types by path or extension, add checks like:
--   lower(right(name, 4)) = '.mp3'
--   lower(right(name, 4)) = '.m4a'
--   lower(right(name, 4)) = '.png'
--
-- Example:
--   and lower(right(name, 4)) = '.m4a'
--
-- You can also separate dialogue audio and lesson audio into more buckets if
-- you want stricter lifecycle management.

-- =========================================================
-- RECOMMENDED STORAGE CONVENTIONS
-- =========================================================
-- lesson-audio:
--   sounds/sound_w/normal.mp3
--   sounds/sound_w/slow.mp3
--   lessons/lesson_009/step_001.mp3
--   dialogues/dialogue_food_001/turn_001.mp3
--
-- lesson-images:
--   words/word_water/main.png
--   sounds/sound_th/mouth.png
--   ui/icons/mic.svg
--
-- downloadable-packs:
--   packs/week_1/week_1_audio.zip
--   manifests/week_1.json
--
-- user-recordings:
--   users/<auth.uid()>/2026/04/<uuid>.m4a

