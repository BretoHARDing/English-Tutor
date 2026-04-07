
-- Easy English Thai
-- Postgres / Supabase SQL schema
-- Version: 1.0.0
-- Matches the OpenAPI 3.1 contract artifacts generated previously.

-- Recommended extensions
create extension if not exists pgcrypto;

-- =========================================================
-- ENUMS
-- =========================================================

do $$
begin
  if not exists (select 1 from pg_type where typname = 'interface_language_enum') then
    create type interface_language_enum as enum ('th', 'en', 'bilingual');
  end if;

  if not exists (select 1 from pg_type where typname = 'voice_speed_enum') then
    create type voice_speed_enum as enum ('slow', 'normal');
  end if;

  if not exists (select 1 from pg_type where typname = 'learning_goal_enum') then
    create type learning_goal_enum as enum ('daily_life', 'home_conversation', 'travel', 'start_from_zero');
  end if;

  if not exists (select 1 from pg_type where typname = 'difficulty_level_enum') then
    create type difficulty_level_enum as enum ('beginner', 'intermediate', 'advanced');
  end if;

  if not exists (select 1 from pg_type where typname = 'lesson_type_enum') then
    create type lesson_type_enum as enum ('standard', 'review', 'sound_focus', 'dialogue_focus');
  end if;

  if not exists (select 1 from pg_type where typname = 'step_type_enum') then
    create type step_type_enum as enum (
      'audio_listen',
      'audio_repeat',
      'syllable_drill',
      'word_flashcard',
      'image_match',
      'listen_choose',
      'speak_word',
      'speak_sentence',
      'speak_answer',
      'dialogue_turn',
      'review_quiz'
    );
  end if;

  if not exists (select 1 from pg_type where typname = 'dialogue_mode_enum') then
    create type dialogue_mode_enum as enum ('guided', 'repeat', 'open');
  end if;

  if not exists (select 1 from pg_type where typname = 'review_content_type_enum') then
    create type review_content_type_enum as enum ('word', 'sound', 'sentence', 'dialogue');
  end if;

  if not exists (select 1 from pg_type where typname = 'review_result_enum') then
    create type review_result_enum as enum ('correct', 'incorrect', 'partial', 'skipped');
  end if;

  if not exists (select 1 from pg_type where typname = 'lesson_progress_status_enum') then
    create type lesson_progress_status_enum as enum ('not_started', 'in_progress', 'completed');
  end if;

  if not exists (select 1 from pg_type where typname = 'speaker_enum') then
    create type speaker_enum as enum ('app', 'learner');
  end if;

  if not exists (select 1 from pg_type where typname = 'voice_gender_enum') then
    create type voice_gender_enum as enum ('male', 'female');
  end if;

  if not exists (select 1 from pg_type where typname = 'platform_enum') then
    create type platform_enum as enum ('ios', 'android');
  end if;

  if not exists (select 1 from pg_type where typname = 'asset_type_enum') then
    create type asset_type_enum as enum (
      'image',
      'audio_normal',
      'audio_slow',
      'mouth_diagram',
      'icon',
      'user_recording',
      'other'
    );
  end if;

  if not exists (select 1 from pg_type where typname = 'analytics_event_name_enum') then
    create type analytics_event_name_enum as enum (
      'onboarding_started',
      'language_selected',
      'onboarding_completed',
      'level_check_started',
      'level_check_completed',
      'home_viewed',
      'today_lesson_tapped',
      'review_tapped',
      'sound_practice_tapped',
      'lesson_started',
      'lesson_step_viewed',
      'audio_played',
      'audio_slow_played',
      'mic_started',
      'mic_completed',
      'speech_scored',
      'hint_opened',
      'lesson_completed',
      'review_started',
      'review_item_answered',
      'review_item_marked_hard',
      'review_completed',
      'dialogue_started',
      'dialogue_turn_attempted',
      'dialogue_turn_passed',
      'dialogue_turn_failed',
      'dialogue_completed',
      'setting_changed',
      'reminder_set',
      'download_started',
      'download_removed'
    );
  end if;
end$$;

-- =========================================================
-- GENERIC UPDATED_AT TRIGGER
-- =========================================================

create or replace function set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

-- =========================================================
-- CORE IDENTITY / USER TABLES
-- =========================================================

create table if not exists users (
  id uuid primary key default gen_random_uuid(),
  auth_user_id uuid unique, -- can map to auth.users.id in Supabase
  email text unique,
  phone text unique,
  display_name text not null,
  native_language text,
  interface_language interface_language_enum not null default 'th',
  learning_goal learning_goal_enum not null default 'start_from_zero',
  current_level_id uuid,
  current_lesson_id uuid,
  is_guest boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint users_email_or_guest_chk check (
    is_guest = true or email is not null or phone is not null
  )
);

create trigger users_set_updated_at
before update on users
for each row execute function set_updated_at();

create table if not exists user_settings (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null unique references users(id) on delete cascade,
  interface_language interface_language_enum not null default 'th',
  thai_translation_enabled boolean not null default true,
  bilingual_mode boolean not null default true,
  preferred_voice_gender voice_gender_enum not null default 'female',
  audio_speed_default voice_speed_enum not null default 'normal',
  subtitles_enabled boolean not null default true,
  notifications_enabled boolean not null default true,
  daily_reminder_time time,
  save_recordings boolean not null default true,
  strict_answer_mode boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create trigger user_settings_set_updated_at
before update on user_settings
for each row execute function set_updated_at();

create table if not exists device_tokens (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  platform platform_enum not null,
  device_token text not null,
  device_id text not null,
  created_at timestamptz not null default now(),
  unique (platform, device_token),
  unique (user_id, device_id)
);

-- =========================================================
-- COURSE / CURRICULUM STRUCTURE
-- =========================================================

create table if not exists courses (
  id uuid primary key default gen_random_uuid(),
  stable_key text unique,
  title text not null,
  description text not null,
  source_language text not null,
  target_language text not null,
  version integer not null default 1,
  is_published boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create trigger courses_set_updated_at
before update on courses
for each row execute function set_updated_at();

create table if not exists levels (
  id uuid primary key default gen_random_uuid(),
  course_id uuid not null references courses(id) on delete cascade,
  stable_key text unique,
  level_order integer not null,
  title text not null,
  description text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (course_id, level_order)
);

create trigger levels_set_updated_at
before update on levels
for each row execute function set_updated_at();

create table if not exists modules (
  id uuid primary key default gen_random_uuid(),
  level_id uuid not null references levels(id) on delete cascade,
  stable_key text unique,
  module_order integer not null,
  title text not null,
  description text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (level_id, module_order)
);

create trigger modules_set_updated_at
before update on modules
for each row execute function set_updated_at();

create table if not exists units (
  id uuid primary key default gen_random_uuid(),
  module_id uuid not null references modules(id) on delete cascade,
  stable_key text unique,
  unit_order integer not null,
  title text not null,
  description text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (module_id, unit_order)
);

create trigger units_set_updated_at
before update on units
for each row execute function set_updated_at();

create table if not exists sounds (
  id uuid primary key default gen_random_uuid(),
  stable_key text unique,
  sound_code text not null,
  display_symbol text not null,
  title text not null,
  description_th text not null,
  mouth_hint text,
  category text not null,
  thai_difficulty_flag boolean not null default false,
  audio_demo_normal_url text,
  audio_demo_slow_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (sound_code)
);

create trigger sounds_set_updated_at
before update on sounds
for each row execute function set_updated_at();

create table if not exists lessons (
  id uuid primary key default gen_random_uuid(),
  stable_key text unique,
  unit_id uuid not null references units(id) on delete cascade,
  lesson_order integer not null,
  title text not null,
  subtitle text,
  estimated_minutes integer not null check (estimated_minutes > 0),
  lesson_type lesson_type_enum not null default 'standard',
  sound_focus_id uuid references sounds(id) on delete set null,
  is_review_lesson boolean not null default false,
  is_published boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (unit_id, lesson_order)
);

create trigger lessons_set_updated_at
before update on lessons
for each row execute function set_updated_at();

create table if not exists lesson_steps (
  id uuid primary key default gen_random_uuid(),
  stable_key text unique,
  lesson_id uuid not null references lessons(id) on delete cascade,
  step_order integer not null,
  step_type step_type_enum not null,
  title text,
  instruction_en text not null,
  instruction_th text not null,
  payload_json jsonb not null default '{}'::jsonb,
  passing_rule_json jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (lesson_id, step_order)
);

create trigger lesson_steps_set_updated_at
before update on lesson_steps
for each row execute function set_updated_at();

-- =========================================================
-- CONTENT LIBRARY
-- =========================================================

create table if not exists assets (
  id uuid primary key default gen_random_uuid(),
  stable_key text unique,
  asset_type asset_type_enum not null,
  url text not null,
  localizable_key text,
  duration_ms integer,
  metadata_json jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists sentence_patterns (
  id uuid primary key default gen_random_uuid(),
  stable_key text unique,
  pattern_text text not null,
  pattern_text_th text not null,
  explanation_th text,
  difficulty_level difficulty_level_enum not null default 'beginner',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (pattern_text)
);

create trigger sentence_patterns_set_updated_at
before update on sentence_patterns
for each row execute function set_updated_at();

create table if not exists words (
  id uuid primary key default gen_random_uuid(),
  stable_key text unique,
  english_text text not null,
  thai_text text not null,
  transliteration text,
  pronunciation_hint text,
  ipa text,
  syllable_split text[] not null default '{}',
  part_of_speech text,
  category text not null,
  difficulty_level difficulty_level_enum not null default 'beginner',
  frequency_rank integer,
  image_asset_id uuid references assets(id) on delete set null,
  audio_normal_asset_id uuid references assets(id) on delete set null,
  audio_slow_asset_id uuid references assets(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (english_text, category)
);

create trigger words_set_updated_at
before update on words
for each row execute function set_updated_at();

create table if not exists sentences (
  id uuid primary key default gen_random_uuid(),
  stable_key text unique,
  english_text text not null,
  thai_text text not null,
  pronunciation_hint text,
  ipa text,
  sentence_pattern_id uuid references sentence_patterns(id) on delete set null,
  difficulty_level difficulty_level_enum not null default 'beginner',
  audio_normal_asset_id uuid references assets(id) on delete set null,
  audio_slow_asset_id uuid references assets(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (english_text)
);

create trigger sentences_set_updated_at
before update on sentences
for each row execute function set_updated_at();

create table if not exists sentence_words (
  sentence_id uuid not null references sentences(id) on delete cascade,
  word_id uuid not null references words(id) on delete cascade,
  display_order integer not null default 1,
  primary key (sentence_id, word_id)
);

create table if not exists lesson_words (
  lesson_id uuid not null references lessons(id) on delete cascade,
  word_id uuid not null references words(id) on delete cascade,
  display_order integer not null default 1,
  primary key (lesson_id, word_id)
);

create table if not exists lesson_sentences (
  lesson_id uuid not null references lessons(id) on delete cascade,
  sentence_id uuid not null references sentences(id) on delete cascade,
  display_order integer not null default 1,
  primary key (lesson_id, sentence_id)
);

create table if not exists word_sounds (
  word_id uuid not null references words(id) on delete cascade,
  sound_id uuid not null references sounds(id) on delete cascade,
  primary key (word_id, sound_id)
);

create table if not exists minimal_pair_groups (
  id uuid primary key default gen_random_uuid(),
  stable_key text unique,
  title text not null,
  sound_a_id uuid not null references sounds(id) on delete cascade,
  sound_b_id uuid not null references sounds(id) on delete cascade,
  created_at timestamptz not null default now(),
  constraint minimal_pair_distinct_sounds_chk check (sound_a_id <> sound_b_id)
);

create table if not exists minimal_pair_items (
  id uuid primary key default gen_random_uuid(),
  group_id uuid not null references minimal_pair_groups(id) on delete cascade,
  word_a_id uuid not null references words(id) on delete cascade,
  word_b_id uuid not null references words(id) on delete cascade,
  audio_a_asset_id uuid references assets(id) on delete set null,
  audio_b_asset_id uuid references assets(id) on delete set null,
  created_at timestamptz not null default now(),
  constraint minimal_pair_distinct_words_chk check (word_a_id <> word_b_id)
);

create table if not exists dialogues (
  id uuid primary key default gen_random_uuid(),
  stable_key text unique,
  title text not null,
  description text not null,
  context_type text not null,
  mode dialogue_mode_enum not null default 'guided',
  level_id uuid not null references levels(id) on delete cascade,
  target_phrases jsonb not null default '[]'::jsonb,
  validation_json jsonb not null default '{}'::jsonb,
  is_published boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create trigger dialogues_set_updated_at
before update on dialogues
for each row execute function set_updated_at();

create table if not exists dialogue_turns (
  id uuid primary key default gen_random_uuid(),
  dialogue_id uuid not null references dialogues(id) on delete cascade,
  turn_order integer not null,
  speaker speaker_enum not null,
  text text,
  thai_text text,
  audio_asset_id uuid references assets(id) on delete set null,
  expected_answers jsonb,
  validation_type text,
  hint_text text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (dialogue_id, turn_order)
);

create trigger dialogue_turns_set_updated_at
before update on dialogue_turns
for each row execute function set_updated_at();

create table if not exists download_packs (
  id uuid primary key default gen_random_uuid(),
  stable_key text unique,
  title text not null,
  size_mb numeric(10,2) not null default 0,
  asset_count integer not null default 0,
  is_published boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create trigger download_packs_set_updated_at
before update on download_packs
for each row execute function set_updated_at();

create table if not exists download_pack_files (
  id uuid primary key default gen_random_uuid(),
  pack_id uuid not null references download_packs(id) on delete cascade,
  asset_id uuid not null references assets(id) on delete cascade,
  url text not null,
  checksum text not null,
  created_at timestamptz not null default now(),
  unique (pack_id, asset_id)
);

-- =========================================================
-- ONBOARDING / PLACEMENT
-- =========================================================

create table if not exists onboarding_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  interface_language interface_language_enum not null,
  learning_goal learning_goal_enum not null,
  recommended_flow jsonb not null default '[]'::jsonb,
  status text not null default 'started',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create trigger onboarding_sessions_set_updated_at
before update on onboarding_sessions
for each row execute function set_updated_at();

create table if not exists onboarding_answers (
  id uuid primary key default gen_random_uuid(),
  onboarding_session_id uuid not null references onboarding_sessions(id) on delete cascade,
  question_id text not null,
  answer_json jsonb not null,
  created_at timestamptz not null default now(),
  unique (onboarding_session_id, question_id)
);

-- =========================================================
-- USER PROGRESS
-- =========================================================

create table if not exists user_lesson_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  lesson_id uuid not null references lessons(id) on delete cascade,
  status lesson_progress_status_enum not null default 'not_started',
  started_at timestamptz,
  completed_at timestamptz,
  score_overall numeric(5,2),
  pronunciation_score numeric(5,2),
  comprehension_score numeric(5,2),
  retry_count integer not null default 0,
  time_spent_seconds integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, lesson_id),
  constraint lesson_progress_completion_chk check (
    (status <> 'completed') or completed_at is not null
  )
);

create trigger user_lesson_progress_set_updated_at
before update on user_lesson_progress
for each row execute function set_updated_at();

create table if not exists user_lesson_step_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  lesson_id uuid not null references lessons(id) on delete cascade,
  lesson_step_id uuid not null references lesson_steps(id) on delete cascade,
  status text not null default 'not_started',
  attempts integer not null default 0,
  time_spent_seconds integer not null default 0,
  score_json jsonb,
  response_summary_json jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, lesson_step_id)
);

create trigger user_lesson_step_progress_set_updated_at
before update on user_lesson_step_progress
for each row execute function set_updated_at();

create table if not exists user_word_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  word_id uuid not null references words(id) on delete cascade,
  familiarity_score numeric(5,2) not null default 0,
  pronunciation_score numeric(5,2) not null default 0,
  listening_score numeric(5,2) not null default 0,
  speaking_score numeric(5,2) not null default 0,
  times_seen integer not null default 0,
  times_correct integer not null default 0,
  times_incorrect integer not null default 0,
  last_seen_at timestamptz,
  next_review_at timestamptz,
  is_hard_word boolean not null default false,
  is_favorite boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, word_id)
);

create trigger user_word_progress_set_updated_at
before update on user_word_progress
for each row execute function set_updated_at();

create table if not exists user_sound_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  sound_id uuid not null references sounds(id) on delete cascade,
  accuracy_score numeric(5,2) not null default 0,
  attempts_count integer not null default 0,
  last_practiced_at timestamptz,
  next_review_at timestamptz,
  difficulty_flag boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, sound_id)
);

create trigger user_sound_progress_set_updated_at
before update on user_sound_progress
for each row execute function set_updated_at();

create table if not exists user_sentence_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  sentence_id uuid not null references sentences(id) on delete cascade,
  familiarity_score numeric(5,2) not null default 0,
  speaking_score numeric(5,2) not null default 0,
  times_practiced integer not null default 0,
  next_review_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, sentence_id)
);

create trigger user_sentence_progress_set_updated_at
before update on user_sentence_progress
for each row execute function set_updated_at();

create table if not exists dialogue_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  dialogue_id uuid not null references dialogues(id) on delete cascade,
  mode dialogue_mode_enum not null default 'guided',
  current_turn_id uuid references dialogue_turns(id) on delete set null,
  status text not null default 'in_progress',
  score_overall numeric(5,2),
  started_at timestamptz not null default now(),
  completed_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create trigger dialogue_sessions_set_updated_at
before update on dialogue_sessions
for each row execute function set_updated_at();

create table if not exists dialogue_session_turns (
  id uuid primary key default gen_random_uuid(),
  dialogue_session_id uuid not null references dialogue_sessions(id) on delete cascade,
  dialogue_turn_id uuid not null references dialogue_turns(id) on delete cascade,
  transcript_text text,
  audio_asset_id uuid references assets(id) on delete set null,
  accepted boolean,
  score numeric(5,2),
  feedback text,
  created_at timestamptz not null default now(),
  unique (dialogue_session_id, dialogue_turn_id)
);

create table if not exists user_speaking_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  lesson_step_id uuid references lesson_steps(id) on delete set null,
  word_id uuid references words(id) on delete set null,
  sentence_id uuid references sentences(id) on delete set null,
  dialogue_id uuid references dialogues(id) on delete set null,
  recording_asset_id uuid references assets(id) on delete set null,
  transcript_text text,
  recognition_confidence numeric(6,4),
  pronunciation_score numeric(5,2),
  phoneme_feedback_json jsonb,
  feedback_text text,
  created_at timestamptz not null default now(),
  constraint speaking_attempt_has_target_chk check (
    lesson_step_id is not null or word_id is not null or sentence_id is not null or dialogue_id is not null
  )
);

create table if not exists review_queue (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  content_type review_content_type_enum not null,
  content_id uuid not null,
  due_at timestamptz not null,
  priority integer not null default 0,
  source_reason text not null,
  created_at timestamptz not null default now(),
  completed_at timestamptz,
  unique (user_id, content_type, content_id, due_at)
);

-- =========================================================
-- ACHIEVEMENTS / NOTIFICATIONS / ANALYTICS
-- =========================================================

create table if not exists achievements (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  title text not null,
  description text,
  icon_asset_id uuid references assets(id) on delete set null,
  created_at timestamptz not null default now()
);

create table if not exists user_achievements (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users(id) on delete cascade,
  achievement_id uuid not null references achievements(id) on delete cascade,
  unlocked_at timestamptz not null default now(),
  unique (user_id, achievement_id)
);

create table if not exists reminder_preferences (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null unique references users(id) on delete cascade,
  enabled boolean not null default true,
  daily_time time not null,
  timezone text not null default 'Asia/Bangkok',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create trigger reminder_preferences_set_updated_at
before update on reminder_preferences
for each row execute function set_updated_at();

create table if not exists analytics_events (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references users(id) on delete set null,
  event_name analytics_event_name_enum not null,
  event_time timestamptz not null default now(),
  properties_json jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

-- =========================================================
-- ADMIN / QA SUPPORT
-- =========================================================

create table if not exists admin_users (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null unique references users(id) on delete cascade,
  role text not null,
  created_at timestamptz not null default now()
);

create table if not exists content_qa_issues (
  id uuid primary key default gen_random_uuid(),
  content_type text not null,
  content_id uuid not null,
  issue_type text not null,
  issue_data jsonb not null default '{}'::jsonb,
  status text not null default 'open',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create trigger content_qa_issues_set_updated_at
before update on content_qa_issues
for each row execute function set_updated_at();

-- =========================================================
-- FOREIGN KEYS THAT DEPEND ON LATER TABLES
-- =========================================================

alter table users
  drop constraint if exists users_current_level_id_fkey,
  add constraint users_current_level_id_fkey
    foreign key (current_level_id) references levels(id) on delete set null;

alter table users
  drop constraint if exists users_current_lesson_id_fkey,
  add constraint users_current_lesson_id_fkey
    foreign key (current_lesson_id) references lessons(id) on delete set null;

-- =========================================================
-- INDEXES
-- =========================================================

create index if not exists idx_users_auth_user_id on users(auth_user_id);
create index if not exists idx_users_interface_language on users(interface_language);

create index if not exists idx_levels_course_order on levels(course_id, level_order);
create index if not exists idx_modules_level_order on modules(level_id, module_order);
create index if not exists idx_units_module_order on units(module_id, unit_order);
create index if not exists idx_lessons_unit_order on lessons(unit_id, lesson_order);
create index if not exists idx_lessons_published on lessons(is_published);
create index if not exists idx_lessons_sound_focus on lessons(sound_focus_id);
create index if not exists idx_lesson_steps_lesson_order on lesson_steps(lesson_id, step_order);

create index if not exists idx_words_category on words(category);
create index if not exists idx_words_difficulty on words(difficulty_level);
create index if not exists idx_words_english_text on words(english_text);
create index if not exists idx_sentences_pattern on sentences(sentence_pattern_id);
create index if not exists idx_sounds_category on sounds(category);
create index if not exists idx_sounds_thai_difficulty on sounds(thai_difficulty_flag);

create index if not exists idx_dialogues_level on dialogues(level_id);
create index if not exists idx_dialogues_context on dialogues(context_type);
create index if not exists idx_dialogues_published on dialogues(is_published);
create index if not exists idx_dialogue_turns_dialogue_order on dialogue_turns(dialogue_id, turn_order);

create index if not exists idx_onboarding_sessions_user on onboarding_sessions(user_id);
create index if not exists idx_onboarding_answers_session on onboarding_answers(onboarding_session_id);

create index if not exists idx_user_lesson_progress_user on user_lesson_progress(user_id);
create index if not exists idx_user_lesson_progress_lesson on user_lesson_progress(lesson_id);
create index if not exists idx_user_lesson_step_progress_user_lesson on user_lesson_step_progress(user_id, lesson_id);

create index if not exists idx_user_word_progress_user on user_word_progress(user_id);
create index if not exists idx_user_word_progress_next_review on user_word_progress(next_review_at);
create index if not exists idx_user_word_progress_hard on user_word_progress(user_id, is_hard_word);

create index if not exists idx_user_sound_progress_user on user_sound_progress(user_id);
create index if not exists idx_user_sound_progress_next_review on user_sound_progress(next_review_at);

create index if not exists idx_user_sentence_progress_user on user_sentence_progress(user_id);
create index if not exists idx_user_sentence_progress_next_review on user_sentence_progress(next_review_at);

create index if not exists idx_dialogue_sessions_user on dialogue_sessions(user_id);
create index if not exists idx_dialogue_sessions_dialogue on dialogue_sessions(dialogue_id);

create index if not exists idx_user_speaking_attempts_user on user_speaking_attempts(user_id);
create index if not exists idx_user_speaking_attempts_created on user_speaking_attempts(created_at);

create index if not exists idx_review_queue_due on review_queue(user_id, due_at);
create index if not exists idx_review_queue_content on review_queue(user_id, content_type, content_id);

create index if not exists idx_analytics_events_user on analytics_events(user_id);
create index if not exists idx_analytics_events_name on analytics_events(event_name);
create index if not exists idx_analytics_events_time on analytics_events(event_time);

create index if not exists idx_content_qa_issues_status on content_qa_issues(status);
create index if not exists idx_content_qa_issues_type on content_qa_issues(content_type, issue_type);

-- =========================================================
-- VIEW HELPERS
-- =========================================================

create or replace view v_course_map as
select
  c.id as course_id,
  c.title as course_title,
  l.id as level_id,
  l.level_order,
  l.title as level_title,
  m.id as module_id,
  m.module_order,
  m.title as module_title,
  u.id as unit_id,
  u.unit_order,
  u.title as unit_title,
  les.id as lesson_id,
  les.lesson_order,
  les.title as lesson_title,
  les.is_published
from courses c
join levels l on l.course_id = c.id
join modules m on m.level_id = l.id
join units u on u.module_id = m.id
join lessons les on les.unit_id = u.id;

create or replace view v_review_due_counts as
select
  user_id,
  content_type,
  count(*) filter (where completed_at is null and due_at <= now()) as due_count
from review_queue
group by user_id, content_type;

-- =========================================================
-- OPTIONAL: ROW LEVEL SECURITY STARTER NOTES
-- =========================================================
-- For Supabase, you would typically:
--   alter table <table_name> enable row level security;
-- and then add policies such as:
--   users can select/update their own rows
--   users can insert/select/update their own progress rows
--   only admins can access admin tables
--
-- Those policies are intentionally omitted here because exact auth strategy
-- depends on whether you map users.auth_user_id to auth.uid() directly.

