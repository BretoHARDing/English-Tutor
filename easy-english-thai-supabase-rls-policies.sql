
-- Easy English Thai
-- Supabase Row Level Security (RLS) policies
-- Assumes:
--   1) public.users.auth_user_id maps to auth.uid()
--   2) admin users are listed in public.admin_users via public.users.id
--   3) content tables are readable by authenticated users only when published
--   4) learner-owned tables are readable/writable only by the owning learner

-- =========================================================
-- HELPER FUNCTIONS
-- =========================================================

create or replace function public.current_app_user_id()
returns uuid
language sql
stable
as $$
  select u.id
  from public.users u
  where u.auth_user_id = auth.uid()
  limit 1
$$;

create or replace function public.is_admin_user()
returns boolean
language sql
stable
as $$
  select exists (
    select 1
    from public.admin_users au
    join public.users u on u.id = au.user_id
    where u.auth_user_id = auth.uid()
  )
$$;

-- =========================================================
-- ENABLE RLS
-- =========================================================

alter table public.users enable row level security;
alter table public.user_settings enable row level security;
alter table public.device_tokens enable row level security;

alter table public.courses enable row level security;
alter table public.levels enable row level security;
alter table public.modules enable row level security;
alter table public.units enable row level security;
alter table public.lessons enable row level security;
alter table public.lesson_steps enable row level security;

alter table public.assets enable row level security;
alter table public.sentence_patterns enable row level security;
alter table public.words enable row level security;
alter table public.sentences enable row level security;
alter table public.sentence_words enable row level security;
alter table public.lesson_words enable row level security;
alter table public.lesson_sentences enable row level security;
alter table public.word_sounds enable row level security;
alter table public.minimal_pair_groups enable row level security;
alter table public.minimal_pair_items enable row level security;
alter table public.dialogues enable row level security;
alter table public.dialogue_turns enable row level security;
alter table public.download_packs enable row level security;
alter table public.download_pack_files enable row level security;

alter table public.onboarding_sessions enable row level security;
alter table public.onboarding_answers enable row level security;

alter table public.user_lesson_progress enable row level security;
alter table public.user_lesson_step_progress enable row level security;
alter table public.user_word_progress enable row level security;
alter table public.user_sound_progress enable row level security;
alter table public.user_sentence_progress enable row level security;
alter table public.dialogue_sessions enable row level security;
alter table public.dialogue_session_turns enable row level security;
alter table public.user_speaking_attempts enable row level security;
alter table public.review_queue enable row level security;

alter table public.achievements enable row level security;
alter table public.user_achievements enable row level security;
alter table public.reminder_preferences enable row level security;
alter table public.analytics_events enable row level security;

alter table public.admin_users enable row level security;
alter table public.content_qa_issues enable row level security;

-- =========================================================
-- USERS / PROFILE
-- =========================================================

drop policy if exists users_select_self on public.users;
create policy users_select_self
on public.users
for select
to authenticated
using (auth_user_id = auth.uid());

drop policy if exists users_insert_self on public.users;
create policy users_insert_self
on public.users
for insert
to authenticated
with check (auth_user_id = auth.uid());

drop policy if exists users_update_self on public.users;
create policy users_update_self
on public.users
for update
to authenticated
using (auth_user_id = auth.uid())
with check (auth_user_id = auth.uid());

drop policy if exists users_admin_all on public.users;
create policy users_admin_all
on public.users
for all
to authenticated
using (public.is_admin_user())
with check (public.is_admin_user());

drop policy if exists user_settings_select_self on public.user_settings;
create policy user_settings_select_self
on public.user_settings
for select
to authenticated
using (user_id = public.current_app_user_id());

drop policy if exists user_settings_insert_self on public.user_settings;
create policy user_settings_insert_self
on public.user_settings
for insert
to authenticated
with check (user_id = public.current_app_user_id());

drop policy if exists user_settings_update_self on public.user_settings;
create policy user_settings_update_self
on public.user_settings
for update
to authenticated
using (user_id = public.current_app_user_id())
with check (user_id = public.current_app_user_id());

drop policy if exists device_tokens_self_all on public.device_tokens;
create policy device_tokens_self_all
on public.device_tokens
for all
to authenticated
using (user_id = public.current_app_user_id())
with check (user_id = public.current_app_user_id());

-- =========================================================
-- PUBLISHED LEARNING CONTENT
-- Learners can read only published content.
-- Admins can fully manage content.
-- =========================================================

drop policy if exists courses_select_published on public.courses;
create policy courses_select_published
on public.courses
for select
to authenticated
using (is_published = true or public.is_admin_user());

drop policy if exists levels_select_published_course on public.levels;
create policy levels_select_published_course
on public.levels
for select
to authenticated
using (
  exists (
    select 1 from public.courses c
    where c.id = levels.course_id
      and (c.is_published = true or public.is_admin_user())
  )
);

drop policy if exists modules_select_published_course on public.modules;
create policy modules_select_published_course
on public.modules
for select
to authenticated
using (
  exists (
    select 1
    from public.levels l
    join public.courses c on c.id = l.course_id
    where l.id = modules.level_id
      and (c.is_published = true or public.is_admin_user())
  )
);

drop policy if exists units_select_published_course on public.units;
create policy units_select_published_course
on public.units
for select
to authenticated
using (
  exists (
    select 1
    from public.modules m
    join public.levels l on l.id = m.level_id
    join public.courses c on c.id = l.course_id
    where m.id = units.module_id
      and (c.is_published = true or public.is_admin_user())
  )
);

drop policy if exists lessons_select_published on public.lessons;
create policy lessons_select_published
on public.lessons
for select
to authenticated
using (is_published = true or public.is_admin_user());

drop policy if exists lesson_steps_select_published_lesson on public.lesson_steps;
create policy lesson_steps_select_published_lesson
on public.lesson_steps
for select
to authenticated
using (
  exists (
    select 1 from public.lessons l
    where l.id = lesson_steps.lesson_id
      and (l.is_published = true or public.is_admin_user())
  )
);

drop policy if exists assets_select_published_linked_or_admin on public.assets;
create policy assets_select_published_linked_or_admin
on public.assets
for select
to authenticated
using (
  public.is_admin_user()
  or exists (
    select 1
    from public.words w
    where (w.image_asset_id = assets.id or w.audio_normal_asset_id = assets.id or w.audio_slow_asset_id = assets.id)
  )
  or exists (
    select 1
    from public.sentences s
    where (s.audio_normal_asset_id = assets.id or s.audio_slow_asset_id = assets.id)
  )
  or exists (
    select 1
    from public.sounds so
    where (so.audio_demo_normal_url = assets.url or so.audio_demo_slow_url = assets.url)
  )
  or exists (
    select 1
    from public.dialogue_turns dt
    where dt.audio_asset_id = assets.id
  )
);

drop policy if exists sentence_patterns_select_all_authenticated on public.sentence_patterns;
create policy sentence_patterns_select_all_authenticated
on public.sentence_patterns
for select
to authenticated
using (true);

drop policy if exists words_select_authenticated on public.words;
create policy words_select_authenticated
on public.words
for select
to authenticated
using (true);

drop policy if exists sentences_select_authenticated on public.sentences;
create policy sentences_select_authenticated
on public.sentences
for select
to authenticated
using (true);

drop policy if exists sentence_words_select_authenticated on public.sentence_words;
create policy sentence_words_select_authenticated
on public.sentence_words
for select
to authenticated
using (true);

drop policy if exists lesson_words_select_published_lesson on public.lesson_words;
create policy lesson_words_select_published_lesson
on public.lesson_words
for select
to authenticated
using (
  exists (
    select 1 from public.lessons l
    where l.id = lesson_words.lesson_id
      and (l.is_published = true or public.is_admin_user())
  )
);

drop policy if exists lesson_sentences_select_published_lesson on public.lesson_sentences;
create policy lesson_sentences_select_published_lesson
on public.lesson_sentences
for select
to authenticated
using (
  exists (
    select 1 from public.lessons l
    where l.id = lesson_sentences.lesson_id
      and (l.is_published = true or public.is_admin_user())
  )
);

drop policy if exists word_sounds_select_authenticated on public.word_sounds;
create policy word_sounds_select_authenticated
on public.word_sounds
for select
to authenticated
using (true);

drop policy if exists minimal_pair_groups_select_authenticated on public.minimal_pair_groups;
create policy minimal_pair_groups_select_authenticated
on public.minimal_pair_groups
for select
to authenticated
using (true);

drop policy if exists minimal_pair_items_select_authenticated on public.minimal_pair_items;
create policy minimal_pair_items_select_authenticated
on public.minimal_pair_items
for select
to authenticated
using (true);

drop policy if exists dialogues_select_published on public.dialogues;
create policy dialogues_select_published
on public.dialogues
for select
to authenticated
using (is_published = true or public.is_admin_user());

drop policy if exists dialogue_turns_select_published_dialogue on public.dialogue_turns;
create policy dialogue_turns_select_published_dialogue
on public.dialogue_turns
for select
to authenticated
using (
  exists (
    select 1 from public.dialogues d
    where d.id = dialogue_turns.dialogue_id
      and (d.is_published = true or public.is_admin_user())
  )
);

drop policy if exists download_packs_select_published on public.download_packs;
create policy download_packs_select_published
on public.download_packs
for select
to authenticated
using (is_published = true or public.is_admin_user());

drop policy if exists download_pack_files_select_published_pack on public.download_pack_files;
create policy download_pack_files_select_published_pack
on public.download_pack_files
for select
to authenticated
using (
  exists (
    select 1 from public.download_packs p
    where p.id = download_pack_files.pack_id
      and (p.is_published = true or public.is_admin_user())
  )
);

-- =========================================================
-- ONBOARDING
-- =========================================================

drop policy if exists onboarding_sessions_self_all on public.onboarding_sessions;
create policy onboarding_sessions_self_all
on public.onboarding_sessions
for all
to authenticated
using (user_id = public.current_app_user_id())
with check (user_id = public.current_app_user_id());

drop policy if exists onboarding_answers_self_all on public.onboarding_answers;
create policy onboarding_answers_self_all
on public.onboarding_answers
for all
to authenticated
using (
  exists (
    select 1 from public.onboarding_sessions os
    where os.id = onboarding_answers.onboarding_session_id
      and os.user_id = public.current_app_user_id()
  )
)
with check (
  exists (
    select 1 from public.onboarding_sessions os
    where os.id = onboarding_answers.onboarding_session_id
      and os.user_id = public.current_app_user_id()
  )
);

-- =========================================================
-- USER-OWNED LEARNING DATA
-- =========================================================

drop policy if exists user_lesson_progress_self_all on public.user_lesson_progress;
create policy user_lesson_progress_self_all
on public.user_lesson_progress
for all
to authenticated
using (user_id = public.current_app_user_id())
with check (user_id = public.current_app_user_id());

drop policy if exists user_lesson_step_progress_self_all on public.user_lesson_step_progress;
create policy user_lesson_step_progress_self_all
on public.user_lesson_step_progress
for all
to authenticated
using (user_id = public.current_app_user_id())
with check (user_id = public.current_app_user_id());

drop policy if exists user_word_progress_self_all on public.user_word_progress;
create policy user_word_progress_self_all
on public.user_word_progress
for all
to authenticated
using (user_id = public.current_app_user_id())
with check (user_id = public.current_app_user_id());

drop policy if exists user_sound_progress_self_all on public.user_sound_progress;
create policy user_sound_progress_self_all
on public.user_sound_progress
for all
to authenticated
using (user_id = public.current_app_user_id())
with check (user_id = public.current_app_user_id());

drop policy if exists user_sentence_progress_self_all on public.user_sentence_progress;
create policy user_sentence_progress_self_all
on public.user_sentence_progress
for all
to authenticated
using (user_id = public.current_app_user_id())
with check (user_id = public.current_app_user_id());

drop policy if exists dialogue_sessions_self_all on public.dialogue_sessions;
create policy dialogue_sessions_self_all
on public.dialogue_sessions
for all
to authenticated
using (user_id = public.current_app_user_id())
with check (user_id = public.current_app_user_id());

drop policy if exists dialogue_session_turns_self_all on public.dialogue_session_turns;
create policy dialogue_session_turns_self_all
on public.dialogue_session_turns
for all
to authenticated
using (
  exists (
    select 1 from public.dialogue_sessions ds
    where ds.id = dialogue_session_turns.dialogue_session_id
      and ds.user_id = public.current_app_user_id()
  )
)
with check (
  exists (
    select 1 from public.dialogue_sessions ds
    where ds.id = dialogue_session_turns.dialogue_session_id
      and ds.user_id = public.current_app_user_id()
  )
);

drop policy if exists user_speaking_attempts_self_all on public.user_speaking_attempts;
create policy user_speaking_attempts_self_all
on public.user_speaking_attempts
for all
to authenticated
using (user_id = public.current_app_user_id())
with check (user_id = public.current_app_user_id());

drop policy if exists review_queue_self_all on public.review_queue;
create policy review_queue_self_all
on public.review_queue
for all
to authenticated
using (user_id = public.current_app_user_id())
with check (user_id = public.current_app_user_id());

drop policy if exists user_achievements_self_select on public.user_achievements;
create policy user_achievements_self_select
on public.user_achievements
for select
to authenticated
using (user_id = public.current_app_user_id());

drop policy if exists reminder_preferences_self_all on public.reminder_preferences;
create policy reminder_preferences_self_all
on public.reminder_preferences
for all
to authenticated
using (user_id = public.current_app_user_id())
with check (user_id = public.current_app_user_id());

drop policy if exists analytics_events_self_insert_select on public.analytics_events;
create policy analytics_events_self_insert_select
on public.analytics_events
for select
to authenticated
using (user_id = public.current_app_user_id() or public.is_admin_user());

drop policy if exists analytics_events_self_insert on public.analytics_events;
create policy analytics_events_self_insert
on public.analytics_events
for insert
to authenticated
with check (user_id = public.current_app_user_id());

-- =========================================================
-- GLOBAL READ-ONLY TABLES FOR LEARNERS
-- =========================================================

drop policy if exists achievements_select_authenticated on public.achievements;
create policy achievements_select_authenticated
on public.achievements
for select
to authenticated
using (true);

-- =========================================================
-- ADMIN TABLES
-- Only admins can access these tables directly.
-- =========================================================

drop policy if exists admin_users_admin_all on public.admin_users;
create policy admin_users_admin_all
on public.admin_users
for all
to authenticated
using (public.is_admin_user())
with check (public.is_admin_user());

drop policy if exists content_qa_issues_admin_all on public.content_qa_issues;
create policy content_qa_issues_admin_all
on public.content_qa_issues
for all
to authenticated
using (public.is_admin_user())
with check (public.is_admin_user());

-- =========================================================
-- ADMIN WRITE ACCESS TO CONTENT TABLES
-- =========================================================

do $$
declare
  tbl text;
  tables text[] := array[
    'courses','levels','modules','units','lessons','lesson_steps',
    'assets','sentence_patterns','words','sentences','sentence_words',
    'lesson_words','lesson_sentences','word_sounds','minimal_pair_groups',
    'minimal_pair_items','dialogues','dialogue_turns','download_packs','download_pack_files'
  ];
begin
  foreach tbl in array tables
  loop
    execute format('drop policy if exists %I on public.%I', tbl || '_admin_all', tbl);
    execute format(
      'create policy %I on public.%I for all to authenticated using (public.is_admin_user()) with check (public.is_admin_user())',
      tbl || '_admin_all',
      tbl
    );
  end loop;
end$$;

-- =========================================================
-- OPTIONAL STORAGE NOTES
-- =========================================================
-- If using Supabase Storage for learner audio:
--   - create a private bucket for user recordings
--   - allow upload/read/delete only when the object path includes auth.uid()
-- Example path pattern:
--   recordings/<auth.uid()>/<uuid>.m4a
--
-- Storage policies are not included here because they depend on bucket names.

