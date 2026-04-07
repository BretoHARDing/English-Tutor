-- Easy English Thai
-- Seed data pack
-- Bootstraps course, first 12 weeks, core sounds, starter words, sentence patterns, and starter dialogues
begin;

-- =========================================================
-- COURSE
-- =========================================================

insert into courses (stable_key, title, description, source_language, target_language, version, is_published)
values
  ('course_en_for_thai_beginner', 'Beginner English for Thai Speakers', 'Pronunciation-first beginner English course for Thai-speaking learners', 'th', 'en', 1, true)
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    source_language = excluded.source_language,
    target_language = excluded.target_language,
    version = excluded.version,
    is_published = excluded.is_published;


insert into levels (course_id, stable_key, level_order, title, description)
select c.id, 'level_0', 1, 'Absolute Beginner', 'Starts from zero with sounds, syllables, small words, and short sentences'
from courses c
where c.stable_key = 'course_en_for_thai_beginner'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    level_order = excluded.level_order;


insert into modules (level_id, stable_key, module_order, title, description)
select l.id, 'module_week_1', 1, 'Week 1', 'Week 1 learning module'
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    module_order = excluded.module_order;


insert into units (module_id, stable_key, unit_order, title, description)
select m.id, 'unit_week_1', 1, 'Week 1 Unit', 'Primary unit for week 1'
from modules m
where m.stable_key = 'module_week_1'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    unit_order = excluded.unit_order;


insert into modules (level_id, stable_key, module_order, title, description)
select l.id, 'module_week_2', 2, 'Week 2', 'Week 2 learning module'
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    module_order = excluded.module_order;


insert into units (module_id, stable_key, unit_order, title, description)
select m.id, 'unit_week_2', 1, 'Week 2 Unit', 'Primary unit for week 2'
from modules m
where m.stable_key = 'module_week_2'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    unit_order = excluded.unit_order;


insert into modules (level_id, stable_key, module_order, title, description)
select l.id, 'module_week_3', 3, 'Week 3', 'Week 3 learning module'
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    module_order = excluded.module_order;


insert into units (module_id, stable_key, unit_order, title, description)
select m.id, 'unit_week_3', 1, 'Week 3 Unit', 'Primary unit for week 3'
from modules m
where m.stable_key = 'module_week_3'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    unit_order = excluded.unit_order;


insert into modules (level_id, stable_key, module_order, title, description)
select l.id, 'module_week_4', 4, 'Week 4', 'Week 4 learning module'
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    module_order = excluded.module_order;


insert into units (module_id, stable_key, unit_order, title, description)
select m.id, 'unit_week_4', 1, 'Week 4 Unit', 'Primary unit for week 4'
from modules m
where m.stable_key = 'module_week_4'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    unit_order = excluded.unit_order;


insert into modules (level_id, stable_key, module_order, title, description)
select l.id, 'module_week_5', 5, 'Week 5', 'Week 5 learning module'
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    module_order = excluded.module_order;


insert into units (module_id, stable_key, unit_order, title, description)
select m.id, 'unit_week_5', 1, 'Week 5 Unit', 'Primary unit for week 5'
from modules m
where m.stable_key = 'module_week_5'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    unit_order = excluded.unit_order;


insert into modules (level_id, stable_key, module_order, title, description)
select l.id, 'module_week_6', 6, 'Week 6', 'Week 6 learning module'
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    module_order = excluded.module_order;


insert into units (module_id, stable_key, unit_order, title, description)
select m.id, 'unit_week_6', 1, 'Week 6 Unit', 'Primary unit for week 6'
from modules m
where m.stable_key = 'module_week_6'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    unit_order = excluded.unit_order;


insert into modules (level_id, stable_key, module_order, title, description)
select l.id, 'module_week_7', 7, 'Week 7', 'Week 7 learning module'
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    module_order = excluded.module_order;


insert into units (module_id, stable_key, unit_order, title, description)
select m.id, 'unit_week_7', 1, 'Week 7 Unit', 'Primary unit for week 7'
from modules m
where m.stable_key = 'module_week_7'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    unit_order = excluded.unit_order;


insert into modules (level_id, stable_key, module_order, title, description)
select l.id, 'module_week_8', 8, 'Week 8', 'Week 8 learning module'
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    module_order = excluded.module_order;


insert into units (module_id, stable_key, unit_order, title, description)
select m.id, 'unit_week_8', 1, 'Week 8 Unit', 'Primary unit for week 8'
from modules m
where m.stable_key = 'module_week_8'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    unit_order = excluded.unit_order;


insert into modules (level_id, stable_key, module_order, title, description)
select l.id, 'module_week_9', 9, 'Week 9', 'Week 9 learning module'
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    module_order = excluded.module_order;


insert into units (module_id, stable_key, unit_order, title, description)
select m.id, 'unit_week_9', 1, 'Week 9 Unit', 'Primary unit for week 9'
from modules m
where m.stable_key = 'module_week_9'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    unit_order = excluded.unit_order;


insert into modules (level_id, stable_key, module_order, title, description)
select l.id, 'module_week_10', 10, 'Week 10', 'Week 10 learning module'
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    module_order = excluded.module_order;


insert into units (module_id, stable_key, unit_order, title, description)
select m.id, 'unit_week_10', 1, 'Week 10 Unit', 'Primary unit for week 10'
from modules m
where m.stable_key = 'module_week_10'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    unit_order = excluded.unit_order;


insert into modules (level_id, stable_key, module_order, title, description)
select l.id, 'module_week_11', 11, 'Week 11', 'Week 11 learning module'
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    module_order = excluded.module_order;


insert into units (module_id, stable_key, unit_order, title, description)
select m.id, 'unit_week_11', 1, 'Week 11 Unit', 'Primary unit for week 11'
from modules m
where m.stable_key = 'module_week_11'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    unit_order = excluded.unit_order;


insert into modules (level_id, stable_key, module_order, title, description)
select l.id, 'module_week_12', 12, 'Week 12', 'Week 12 learning module'
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    module_order = excluded.module_order;


insert into units (module_id, stable_key, unit_order, title, description)
select m.id, 'unit_week_12', 1, 'Week 12 Unit', 'Primary unit for week 12'
from modules m
where m.stable_key = 'module_week_12'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    unit_order = excluded.unit_order;

-- =========================================================
-- SOUNDS
-- =========================================================

insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_a_short', 'a', 'A', 'Short A', 'เสียง a สั้น เช่น cat', 'สระ', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_e_short', 'e', 'E', 'Short E', 'เสียง e สั้น เช่น bed', 'สระ', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_i_short', 'i', 'I', 'Short I', 'เสียง i สั้น เช่น sit', 'สระ', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_o_short', 'o', 'O', 'Short O', 'เสียง o สั้น เช่น hot', 'สระ', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_u_short', 'u', 'U', 'Short U', 'เสียง u สั้น เช่น cup', 'สระ', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_b', 'b', 'B', 'B sound', 'เสียง บ', 'consonant', false)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_p', 'p', 'P', 'P sound', 'เสียง พ/ป ลมชัด', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_m', 'm', 'M', 'M sound', 'เสียง ม', 'consonant', false)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_t', 't', 'T', 'T sound', 'เสียง ท/ต', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_d', 'd', 'D', 'D sound', 'เสียง ด', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_n', 'n', 'N', 'N sound', 'เสียง น', 'consonant', false)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_k', 'k', 'K', 'K sound', 'เสียง ค/ก ลมชัด', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_g', 'g', 'G', 'G sound', 'เสียง ก', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_s', 's', 'S', 'S sound', 'เสียง ส', 'consonant', false)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_z', 'z', 'Z', 'Z sound', 'เสียง ซ/สั่น', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_f', 'f', 'F', 'F sound', 'เสียง ฟ ใช้ฟันแตะริมฝีปาก', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_v', 'v', 'V', 'V sound', 'เสียง วี/ฟันแตะริมฝีปากมีเสียง', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_w', 'w', 'W', 'W sound', 'เสียง ว', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_l', 'l', 'L', 'L sound', 'เสียง ล', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_r', 'r', 'R', 'R sound', 'เสียง ร อังกฤษ', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_sh', 'sh', 'SH', 'SH sound', 'เสียง ช/ช์ เช่น she', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_ch', 'ch', 'CH', 'CH sound', 'เสียง ช เช่น chair', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_j', 'j', 'J', 'J sound', 'เสียง จ เช่น job', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_th_unvoiced', 'th', 'TH', 'TH sound (thin)', 'เสียง th เช่น thin', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_th_voiced', 'th_voiced', 'TH', 'TH sound (this)', 'เสียง th เช่น this', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;


insert into sounds (stable_key, sound_code, display_symbol, title, description_th, category, thai_difficulty_flag)
values ('sound_ng', 'ng', 'NG', 'NG final sound', 'เสียง ง ท้ายคำ', 'consonant', true)
on conflict (stable_key) do update
set sound_code = excluded.sound_code,
    display_symbol = excluded.display_symbol,
    title = excluded.title,
    description_th = excluded.description_th,
    category = excluded.category,
    thai_difficulty_flag = excluded.thai_difficulty_flag;

-- =========================================================
-- SENTENCE PATTERNS
-- =========================================================

insert into sentence_patterns (stable_key, pattern_text, pattern_text_th, explanation_th, difficulty_level)
values ('pattern_this_is_blank', 'This is ___.', 'นี่คือ___', 'ใช้ชี้สิ่งของหรือคน', 'beginner')
on conflict (stable_key) do update
set pattern_text = excluded.pattern_text,
    pattern_text_th = excluded.pattern_text_th,
    explanation_th = excluded.explanation_th,
    difficulty_level = excluded.difficulty_level;


insert into sentence_patterns (stable_key, pattern_text, pattern_text_th, explanation_th, difficulty_level)
values ('pattern_that_is_blank', 'That is ___.', 'นั่นคือ___', 'ใช้ชี้สิ่งที่อยู่ไกล', 'beginner')
on conflict (stable_key) do update
set pattern_text = excluded.pattern_text,
    pattern_text_th = excluded.pattern_text_th,
    explanation_th = excluded.explanation_th,
    difficulty_level = excluded.difficulty_level;


insert into sentence_patterns (stable_key, pattern_text, pattern_text_th, explanation_th, difficulty_level)
values ('pattern_it_is_blank', 'It is ___.', 'มันคือ/มันเป็น___', 'ใช้บอกลักษณะหรือสถานะ', 'beginner')
on conflict (stable_key) do update
set pattern_text = excluded.pattern_text,
    pattern_text_th = excluded.pattern_text_th,
    explanation_th = excluded.explanation_th,
    difficulty_level = excluded.difficulty_level;


insert into sentence_patterns (stable_key, pattern_text, pattern_text_th, explanation_th, difficulty_level)
values ('pattern_i_am_blank', 'I am ___.', 'ฉันเป็น/ฉันรู้สึก___', 'ใช้แนะนำตัวหรือบอกความรู้สึก', 'beginner')
on conflict (stable_key) do update
set pattern_text = excluded.pattern_text,
    pattern_text_th = excluded.pattern_text_th,
    explanation_th = excluded.explanation_th,
    difficulty_level = excluded.difficulty_level;


insert into sentence_patterns (stable_key, pattern_text, pattern_text_th, explanation_th, difficulty_level)
values ('pattern_i_want_blank', 'I want ___.', 'ฉันต้องการ___', 'ใช้บอกสิ่งที่ต้องการ', 'beginner')
on conflict (stable_key) do update
set pattern_text = excluded.pattern_text,
    pattern_text_th = excluded.pattern_text_th,
    explanation_th = excluded.explanation_th,
    difficulty_level = excluded.difficulty_level;


insert into sentence_patterns (stable_key, pattern_text, pattern_text_th, explanation_th, difficulty_level)
values ('pattern_i_need_blank', 'I need ___.', 'ฉันต้องการ___', 'ใช้บอกความจำเป็น', 'beginner')
on conflict (stable_key) do update
set pattern_text = excluded.pattern_text,
    pattern_text_th = excluded.pattern_text_th,
    explanation_th = excluded.explanation_th,
    difficulty_level = excluded.difficulty_level;


insert into sentence_patterns (stable_key, pattern_text, pattern_text_th, explanation_th, difficulty_level)
values ('pattern_i_like_blank', 'I like ___.', 'ฉันชอบ___', 'ใช้บอกสิ่งที่ชอบ', 'beginner')
on conflict (stable_key) do update
set pattern_text = excluded.pattern_text,
    pattern_text_th = excluded.pattern_text_th,
    explanation_th = excluded.explanation_th,
    difficulty_level = excluded.difficulty_level;


insert into sentence_patterns (stable_key, pattern_text, pattern_text_th, explanation_th, difficulty_level)
values ('pattern_where_is_blank', 'Where is ___?', '___อยู่ที่ไหน', 'ใช้ถามหาของหรือสถานที่', 'beginner')
on conflict (stable_key) do update
set pattern_text = excluded.pattern_text,
    pattern_text_th = excluded.pattern_text_th,
    explanation_th = excluded.explanation_th,
    difficulty_level = excluded.difficulty_level;


insert into sentence_patterns (stable_key, pattern_text, pattern_text_th, explanation_th, difficulty_level)
values ('pattern_do_you_want_blank', 'Do you want ___?', 'คุณต้องการ___ไหม', 'ใช้ถามความต้องการ', 'beginner')
on conflict (stable_key) do update
set pattern_text = excluded.pattern_text,
    pattern_text_th = excluded.pattern_text_th,
    explanation_th = excluded.explanation_th,
    difficulty_level = excluded.difficulty_level;


insert into sentence_patterns (stable_key, pattern_text, pattern_text_th, explanation_th, difficulty_level)
values ('pattern_can_you_help_me', 'Can you help me?', 'คุณช่วยฉันได้ไหม', 'ใช้ขอความช่วยเหลือ', 'beginner')
on conflict (stable_key) do update
set pattern_text = excluded.pattern_text,
    pattern_text_th = excluded.pattern_text_th,
    explanation_th = excluded.explanation_th,
    difficulty_level = excluded.difficulty_level;

-- =========================================================
-- WORDS
-- =========================================================

insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_i', 'I', 'ฉัน', '{I}', 'pronoun', 'people', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_you', 'you', 'คุณ', '{you}', 'pronoun', 'people', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_he', 'he', 'เขา', '{he}', 'pronoun', 'people', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_she', 'she', 'เธอ', '{she}', 'pronoun', 'people', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_we', 'we', 'พวกเรา', '{we}', 'pronoun', 'people', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_they', 'they', 'พวกเขา', '{they}', 'pronoun', 'people', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_it', 'it', 'มัน', '{it}', 'pronoun', 'people', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_mother', 'mother', 'แม่', '{moth,er}', 'noun', 'family', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_father', 'father', 'พ่อ', '{fa,ther}', 'noun', 'family', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_husband', 'husband', 'สามี', '{hus,band}', 'noun', 'family', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_wife', 'wife', 'ภรรยา', '{wife}', 'noun', 'family', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_baby', 'baby', 'เด็กทารก', '{ba,by}', 'noun', 'family', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_family', 'family', 'ครอบครัว', '{fam,i,ly}', 'noun', 'family', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_friend', 'friend', 'เพื่อน', '{friend}', 'noun', 'people', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_go', 'go', 'ไป', '{go}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_come', 'come', 'มา', '{come}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_eat', 'eat', 'กิน', '{eat}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_drink', 'drink', 'ดื่ม', '{drink}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_sit', 'sit', 'นั่ง', '{sit}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_stand', 'stand', 'ยืน', '{stand}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_sleep', 'sleep', 'นอน', '{sleep}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_walk', 'walk', 'เดิน', '{walk}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_look', 'look', 'มอง', '{look}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_see', 'see', 'เห็น', '{see}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_listen', 'listen', 'ฟัง', '{lis,ten}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_speak', 'speak', 'พูด', '{speak}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_say', 'say', 'พูด', '{say}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_read', 'read', 'อ่าน', '{read}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_write', 'write', 'เขียน', '{write}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_want', 'want', 'ต้องการ', '{want}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_need', 'need', 'จำเป็นต้องมี', '{need}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_like', 'like', 'ชอบ', '{like}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_love', 'love', 'รัก', '{love}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_help', 'help', 'ช่วย', '{help}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_open', 'open', 'เปิด', '{o,pen}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_close', 'close', 'ปิด', '{close}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_give', 'give', 'ให้', '{give}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_wait', 'wait', 'รอ', '{wait}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_stop', 'stop', 'หยุด', '{stop}', 'verb', 'actions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_house', 'house', 'บ้าน', '{house}', 'noun', 'home', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_home', 'home', 'บ้าน', '{home}', 'noun', 'home', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_room', 'room', 'ห้อง', '{room}', 'noun', 'home', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_bed', 'bed', 'เตียง', '{bed}', 'noun', 'home', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_door', 'door', 'ประตู', '{door}', 'noun', 'home', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_window', 'window', 'หน้าต่าง', '{win,dow}', 'noun', 'home', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_chair', 'chair', 'เก้าอี้', '{chair}', 'noun', 'home', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_table', 'table', 'โต๊ะ', '{ta,ble}', 'noun', 'home', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_kitchen', 'kitchen', 'ห้องครัว', '{kitch,en}', 'noun', 'home', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_bathroom', 'bathroom', 'ห้องน้ำ', '{bath,room}', 'noun', 'home', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_rice', 'rice', 'ข้าว', '{rice}', 'noun', 'food', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_water', 'water', 'น้ำ', '{wa,ter}', 'noun', 'drink', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_food', 'food', 'อาหาร', '{food}', 'noun', 'food', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_tea', 'tea', 'ชา', '{tea}', 'noun', 'drink', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_coffee', 'coffee', 'กาแฟ', '{cof,fee}', 'noun', 'drink', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_milk', 'milk', 'นม', '{milk}', 'noun', 'drink', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_juice', 'juice', 'น้ำผลไม้', '{juice}', 'noun', 'drink', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_chicken', 'chicken', 'ไก่', '{chick,en}', 'noun', 'food', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_fish', 'fish', 'ปลา', '{fish}', 'noun', 'food', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_egg', 'egg', 'ไข่', '{egg}', 'noun', 'food', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_meat', 'meat', 'เนื้อ', '{meat}', 'noun', 'food', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_soup', 'soup', 'ซุป', '{soup}', 'noun', 'food', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_noodle', 'noodle', 'ก๋วยเตี๋ยว', '{noo,dle}', 'noun', 'food', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_bread', 'bread', 'ขนมปัง', '{bread}', 'noun', 'food', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_fruit', 'fruit', 'ผลไม้', '{fruit}', 'noun', 'food', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_happy', 'happy', 'มีความสุข', '{hap,py}', 'adj', 'feelings', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_sad', 'sad', 'เศร้า', '{sad}', 'adj', 'feelings', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_tired', 'tired', 'เหนื่อย', '{tired}', 'adj', 'feelings', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_hungry', 'hungry', 'หิว', '{hun,gry}', 'adj', 'feelings', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_thirsty', 'thirsty', 'กระหาย', '{thirst,y}', 'adj', 'feelings', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_sick', 'sick', 'ไม่สบาย', '{sick}', 'adj', 'feelings', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_okay', 'okay', 'โอเค', '{o,kay}', 'adj', 'feelings', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_fine', 'fine', 'สบายดี', '{fine}', 'adj', 'feelings', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_big', 'big', 'ใหญ่', '{big}', 'adj', 'describing', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_small', 'small', 'เล็ก', '{small}', 'adj', 'describing', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_long', 'long', 'ยาว', '{long}', 'adj', 'describing', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_short', 'short', 'สั้น', '{short}', 'adj', 'describing', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_hot', 'hot', 'ร้อน', '{hot}', 'adj', 'describing', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_cold', 'cold', 'เย็น', '{cold}', 'adj', 'describing', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_good', 'good', 'ดี', '{good}', 'adj', 'describing', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_bad', 'bad', 'ไม่ดี', '{bad}', 'adj', 'describing', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_new', 'new', 'ใหม่', '{new}', 'adj', 'describing', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_old', 'old', 'เก่า', '{old}', 'adj', 'describing', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_delicious', 'delicious', 'อร่อย', '{de,li,cious}', 'adj', 'food', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_spicy', 'spicy', 'เผ็ด', '{spi,cy}', 'adj', 'food', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_what', 'what', 'อะไร', '{what}', 'question', 'questions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_where', 'where', 'ที่ไหน', '{where}', 'question', 'questions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_who', 'who', 'ใคร', '{who}', 'question', 'questions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_when', 'when', 'เมื่อไร', '{when}', 'question', 'questions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_why', 'why', 'ทำไม', '{why}', 'question', 'questions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_how', 'how', 'อย่างไร', '{how}', 'question', 'questions', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_today', 'today', 'วันนี้', '{to,day}', 'noun', 'time', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_tomorrow', 'tomorrow', 'พรุ่งนี้', '{to,mor,row}', 'noun', 'time', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_yesterday', 'yesterday', 'เมื่อวาน', '{yes,ter,day}', 'noun', 'time', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_now', 'now', 'ตอนนี้', '{now}', 'noun', 'time', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_later', 'later', 'ทีหลัง', '{la,ter}', 'noun', 'time', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_morning', 'morning', 'ตอนเช้า', '{morn,ing}', 'noun', 'time', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_afternoon', 'afternoon', 'ตอนบ่าย', '{af,ter,noon}', 'noun', 'time', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_evening', 'evening', 'ตอนเย็น', '{eve,ning}', 'noun', 'time', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_night', 'night', 'ตอนกลางคืน', '{night}', 'noun', 'time', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_yes', 'yes', 'ใช่', '{yes}', 'other', 'useful', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_no', 'no', 'ไม่', '{no}', 'other', 'useful', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_please', 'please', 'กรุณา', '{please}', 'other', 'useful', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_thank_you', 'thank you', 'ขอบคุณ', '{thank,you}', 'other', 'useful', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_sorry', 'sorry', 'ขอโทษ', '{sor,ry}', 'other', 'useful', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_hello', 'hello', 'สวัสดี', '{hel,lo}', 'other', 'useful', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_goodbye', 'goodbye', 'ลาก่อน', '{good,bye}', 'other', 'useful', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_here', 'here', 'ที่นี่', '{here}', 'other', 'useful', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_there', 'there', 'ที่นั่น', '{there}', 'other', 'useful', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_this', 'this', 'นี่', '{this}', 'other', 'useful', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_that', 'that', 'นั่น', '{that}', 'other', 'useful', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_excuse_me', 'excuse me', 'ขอโทษนะ/ครับ', '{ex,cuse,me}', 'other', 'useful', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_one', 'one', 'หนึ่ง', '{one}', 'number', 'numbers', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_two', 'two', 'สอง', '{two}', 'number', 'numbers', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_three', 'three', 'สาม', '{three}', 'number', 'numbers', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_four', 'four', 'สี่', '{four}', 'number', 'numbers', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_five', 'five', 'ห้า', '{five}', 'number', 'numbers', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_six', 'six', 'หก', '{six}', 'number', 'numbers', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_seven', 'seven', 'เจ็ด', '{sev,en}', 'number', 'numbers', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_eight', 'eight', 'แปด', '{eight}', 'number', 'numbers', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_nine', 'nine', 'เก้า', '{nine}', 'number', 'numbers', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_ten', 'ten', 'สิบ', '{ten}', 'number', 'numbers', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_twenty', 'twenty', 'ยี่สิบ', '{twen,ty}', 'number', 'numbers', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_thirty', 'thirty', 'สามสิบ', '{thir,ty}', 'number', 'numbers', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_hundred', 'hundred', 'หนึ่งร้อย', '{hun,dred}', 'number', 'numbers', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_shop', 'shop', 'ร้าน', '{shop}', 'noun', 'places', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_market', 'market', 'ตลาด', '{mar,ket}', 'noun', 'places', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_road', 'road', 'ถนน', '{road}', 'noun', 'places', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_station', 'station', 'สถานี', '{sta,tion}', 'noun', 'places', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_hospital', 'hospital', 'โรงพยาบาล', '{hos,pi,tal}', 'noun', 'places', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_car', 'car', 'รถยนต์', '{car}', 'noun', 'travel', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_bus', 'bus', 'รถบัส', '{bus}', 'noun', 'travel', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_taxi', 'taxi', 'แท็กซี่', '{tax,i}', 'noun', 'travel', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_left', 'left', 'ซ้าย', '{left}', 'other', 'travel', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_right', 'right', 'ขวา', '{right}', 'other', 'travel', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_straight', 'straight', 'ตรงไป', '{straight}', 'other', 'travel', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_bag', 'bag', 'กระเป๋า', '{bag}', 'noun', 'objects', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_pen', 'pen', 'ปากกา', '{pen}', 'noun', 'objects', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_book', 'book', 'หนังสือ', '{book}', 'noun', 'objects', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_box', 'box', 'กล่อง', '{box}', 'noun', 'objects', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_phone', 'phone', 'โทรศัพท์', '{phone}', 'noun', 'objects', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_cup', 'cup', 'ถ้วย', '{cup}', 'noun', 'objects', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_spoon', 'spoon', 'ช้อน', '{spoon}', 'noun', 'objects', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_bowl', 'bowl', 'ชาม', '{bowl}', 'noun', 'objects', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_plate', 'plate', 'จาน', '{plate}', 'noun', 'objects', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_bottle', 'bottle', 'ขวด', '{bot,tle}', 'noun', 'objects', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_red', 'red', 'สีแดง', '{red}', 'adj', 'colors', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_blue', 'blue', 'สีน้ำเงิน', '{blue}', 'adj', 'colors', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_green', 'green', 'สีเขียว', '{green}', 'adj', 'colors', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_black', 'black', 'สีดำ', '{black}', 'adj', 'colors', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_white', 'white', 'สีขาว', '{white}', 'adj', 'colors', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;


insert into words (stable_key, english_text, thai_text, syllable_split, part_of_speech, category, difficulty_level)
values ('word_yellow', 'yellow', 'สีเหลือง', '{yel,low}', 'adj', 'colors', 'beginner')
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    syllable_split = excluded.syllable_split,
    part_of_speech = excluded.part_of_speech,
    category = excluded.category,
    difficulty_level = excluded.difficulty_level;

-- =========================================================
-- SENTENCES
-- =========================================================

insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_this_is_a_bag', 'This is a bag.', 'นี่คือกระเป๋า', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_this_is_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_this_is_a_pen', 'This is a pen.', 'นี่คือปากกา', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_this_is_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_this_is_my_room', 'This is my room.', 'นี่คือห้องของฉัน', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_this_is_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_that_is_my_bag', 'That is my bag.', 'นั่นคือกระเป๋าของฉัน', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_that_is_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_it_is_hot', 'It is hot.', 'มันร้อน', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_it_is_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_it_is_cold', 'It is cold.', 'มันเย็น', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_it_is_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_i_am_happy', 'I am happy.', 'ฉันมีความสุข', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_i_am_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_i_am_tired', 'I am tired.', 'ฉันเหนื่อย', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_i_am_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_i_am_hungry', 'I am hungry.', 'ฉันหิว', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_i_am_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_i_want_water', 'I want water.', 'ฉันต้องการน้ำ', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_i_want_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_i_want_rice', 'I want rice.', 'ฉันต้องการข้าว', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_i_want_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_i_want_tea', 'I want tea.', 'ฉันต้องการชา', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_i_want_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_i_need_help', 'I need help.', 'ฉันต้องการความช่วยเหลือ', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_i_need_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_i_like_tea', 'I like tea.', 'ฉันชอบชา', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_i_like_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_i_like_chicken', 'I like chicken.', 'ฉันชอบไก่', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_i_like_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_where_is_the_bathroom', 'Where is the bathroom?', 'ห้องน้ำอยู่ที่ไหน', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_where_is_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_where_is_my_bag', 'Where is my bag?', 'กระเป๋าของฉันอยู่ที่ไหน', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_where_is_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_do_you_want_water', 'Do you want water?', 'คุณต้องการน้ำไหม', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_do_you_want_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_can_you_help_me', 'Can you help me?', 'คุณช่วยฉันได้ไหม', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_can_you_help_me'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_yes_please', 'Yes, please.', 'ค่ะ/ครับ ได้เลย', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_it_is_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_no_thank_you', 'No, thank you.', 'ไม่ ขอบคุณ', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_it_is_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_good_morning', 'Good morning.', 'สวัสดีตอนเช้า', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_it_is_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_open_the_door', 'Open the door.', 'เปิดประตู', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_it_is_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentences (stable_key, english_text, thai_text, sentence_pattern_id, difficulty_level)
select 'sentence_close_the_window', 'Close the window.', 'ปิดหน้าต่าง', sp.id, 'beginner'
from sentence_patterns sp
where sp.stable_key = 'pattern_it_is_blank'
on conflict (stable_key) do update
set english_text = excluded.english_text,
    thai_text = excluded.thai_text,
    sentence_pattern_id = excluded.sentence_pattern_id,
    difficulty_level = excluded.difficulty_level;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 1
from sentences s, words w
where s.stable_key = 'sentence_i_want_water' and w.stable_key = 'word_i'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 2
from sentences s, words w
where s.stable_key = 'sentence_i_want_water' and w.stable_key = 'word_want'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 3
from sentences s, words w
where s.stable_key = 'sentence_i_want_water' and w.stable_key = 'word_water'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 1
from sentences s, words w
where s.stable_key = 'sentence_i_want_rice' and w.stable_key = 'word_i'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 2
from sentences s, words w
where s.stable_key = 'sentence_i_want_rice' and w.stable_key = 'word_want'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 3
from sentences s, words w
where s.stable_key = 'sentence_i_want_rice' and w.stable_key = 'word_rice'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 1
from sentences s, words w
where s.stable_key = 'sentence_i_want_tea' and w.stable_key = 'word_i'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 2
from sentences s, words w
where s.stable_key = 'sentence_i_want_tea' and w.stable_key = 'word_want'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 3
from sentences s, words w
where s.stable_key = 'sentence_i_want_tea' and w.stable_key = 'word_tea'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 1
from sentences s, words w
where s.stable_key = 'sentence_i_need_help' and w.stable_key = 'word_i'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 2
from sentences s, words w
where s.stable_key = 'sentence_i_need_help' and w.stable_key = 'word_need'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 3
from sentences s, words w
where s.stable_key = 'sentence_i_need_help' and w.stable_key = 'word_help'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 1
from sentences s, words w
where s.stable_key = 'sentence_i_like_tea' and w.stable_key = 'word_i'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 2
from sentences s, words w
where s.stable_key = 'sentence_i_like_tea' and w.stable_key = 'word_like'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 3
from sentences s, words w
where s.stable_key = 'sentence_i_like_tea' and w.stable_key = 'word_tea'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 1
from sentences s, words w
where s.stable_key = 'sentence_i_like_chicken' and w.stable_key = 'word_i'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 2
from sentences s, words w
where s.stable_key = 'sentence_i_like_chicken' and w.stable_key = 'word_like'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 3
from sentences s, words w
where s.stable_key = 'sentence_i_like_chicken' and w.stable_key = 'word_chicken'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 1
from sentences s, words w
where s.stable_key = 'sentence_where_is_the_bathroom' and w.stable_key = 'word_where'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 2
from sentences s, words w
where s.stable_key = 'sentence_where_is_the_bathroom' and w.stable_key = 'word_bathroom'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 1
from sentences s, words w
where s.stable_key = 'sentence_where_is_my_bag' and w.stable_key = 'word_where'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 2
from sentences s, words w
where s.stable_key = 'sentence_where_is_my_bag' and w.stable_key = 'word_bag'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 1
from sentences s, words w
where s.stable_key = 'sentence_do_you_want_water' and w.stable_key = 'word_you'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 2
from sentences s, words w
where s.stable_key = 'sentence_do_you_want_water' and w.stable_key = 'word_want'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 3
from sentences s, words w
where s.stable_key = 'sentence_do_you_want_water' and w.stable_key = 'word_water'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 1
from sentences s, words w
where s.stable_key = 'sentence_can_you_help_me' and w.stable_key = 'word_you'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;


insert into sentence_words (sentence_id, word_id, display_order)
select s.id, w.id, 2
from sentences s, words w
where s.stable_key = 'sentence_can_you_help_me' and w.stable_key = 'word_help'
on conflict (sentence_id, word_id) do update
set display_order = excluded.display_order;

-- =========================================================
-- LESSONS
-- =========================================================

insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_001', u.id, 1, 'Bag and Pen', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_b'
where u.stable_key = 'unit_week_1'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_002', u.id, 2, 'Book and Dog', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_i_short'
where u.stable_key = 'unit_week_1'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_003', u.id, 3, 'Cup and Room', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_u_short'
where u.stable_key = 'unit_week_1'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_004', u.id, 4, 'B P M Sounds', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_b'
where u.stable_key = 'unit_week_1'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_005', u.id, 5, 'Tea and Door', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_t'
where u.stable_key = 'unit_week_1'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_006', u.id, 1, 'Go and Come', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_g'
where u.stable_key = 'unit_week_2'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_007', u.id, 2, 'See and Rice', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_s'
where u.stable_key = 'unit_week_2'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_008', u.id, 3, 'Fish and Food', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_f'
where u.stable_key = 'unit_week_2'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_009', u.id, 4, 'Water and Yes', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_2'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_010', u.id, 5, 'Rice and Milk', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_2'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_011', u.id, 1, 'I You He She', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_i_short'
where u.stable_key = 'unit_week_3'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_012', u.id, 2, 'This and That', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_th_voiced'
where u.stable_key = 'unit_week_3'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_013', u.id, 3, 'Family Words', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_f'
where u.stable_key = 'unit_week_3'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_014', u.id, 4, 'Home and Friend', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_m'
where u.stable_key = 'unit_week_3'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_015', u.id, 5, 'Who Is He', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_3'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_016', u.id, 1, 'Room and Chair', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_r'
where u.stable_key = 'unit_week_4'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_017', u.id, 2, 'Door and Window', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_d'
where u.stable_key = 'unit_week_4'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_018', u.id, 3, 'Go Come Sit', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_s'
where u.stable_key = 'unit_week_4'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_019', u.id, 4, 'Eat Drink Open', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_e_short'
where u.stable_key = 'unit_week_4'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_020', u.id, 5, 'At Home', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_o_short'
where u.stable_key = 'unit_week_4'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_021', u.id, 1, 'Happy and Tired', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_a_short'
where u.stable_key = 'unit_week_5'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_022', u.id, 2, 'Hungry and Thirsty', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_th_unvoiced'
where u.stable_key = 'unit_week_5'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_023', u.id, 3, 'I Am', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_i_short'
where u.stable_key = 'unit_week_5'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_024', u.id, 4, 'Need and Help', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_n'
where u.stable_key = 'unit_week_5'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_025', u.id, 5, 'Daily Needs', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_i_short'
where u.stable_key = 'unit_week_5'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_026', u.id, 1, 'Like and Love', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_l'
where u.stable_key = 'unit_week_6'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_027', u.id, 2, 'Chicken and Fruit', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_ch'
where u.stable_key = 'unit_week_6'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_028', u.id, 3, 'Hot and Cold', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_6'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_029', u.id, 4, 'Do You Want', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_6'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_030', u.id, 5, 'Food Talk', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_f'
where u.stable_key = 'unit_week_6'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_031', u.id, 1, 'Numbers 1 to 10', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_7'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_032', u.id, 2, 'Numbers and Money', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_th_unvoiced'
where u.stable_key = 'unit_week_7'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_033', u.id, 3, 'Cheap and Expensive', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_ch'
where u.stable_key = 'unit_week_7'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_034', u.id, 4, 'How Much Is It', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_7'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_035', u.id, 5, 'Shopping Talk', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_sh'
where u.stable_key = 'unit_week_7'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_036', u.id, 1, 'What Who Where', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_8'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_037', u.id, 2, 'When Why How', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_8'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_038', u.id, 3, 'Question Practice 1', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_8'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_039', u.id, 4, 'Question Practice 2', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_8'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_040', u.id, 5, 'Simple Answers', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_m'
where u.stable_key = 'unit_week_8'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_041', u.id, 1, 'R and L', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_r'
where u.stable_key = 'unit_week_9'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_042', u.id, 2, 'V and W', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_v'
where u.stable_key = 'unit_week_9'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_043', u.id, 3, 'TH Sound', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_th_unvoiced'
where u.stable_key = 'unit_week_9'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_044', u.id, 4, 'Final Consonants', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_ng'
where u.stable_key = 'unit_week_9'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_045', u.id, 5, 'Stress Practice', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_a_short'
where u.stable_key = 'unit_week_9'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_046', u.id, 1, 'Left Right Straight', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_l'
where u.stable_key = 'unit_week_10'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_047', u.id, 2, 'Places', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_m'
where u.stable_key = 'unit_week_10'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_048', u.id, 3, 'Car Bus Taxi', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_t'
where u.stable_key = 'unit_week_10'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_049', u.id, 4, 'Asking Directions', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_10'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_050', u.id, 5, 'Outside Talk', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_s'
where u.stable_key = 'unit_week_10'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_051', u.id, 1, 'Phone Basics', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_k'
where u.stable_key = 'unit_week_11'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_052', u.id, 2, 'Morning and Night', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_m'
where u.stable_key = 'unit_week_11'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_053', u.id, 3, 'Today Tomorrow Yesterday', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_t'
where u.stable_key = 'unit_week_11'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_054', u.id, 4, 'Daily Routine', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_11'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_055', u.id, 5, 'Phone Talk', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_11'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_056', u.id, 1, 'My Name Is', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_m'
where u.stable_key = 'unit_week_12'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_057', u.id, 2, 'My Family and Home', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_f'
where u.stable_key = 'unit_week_12'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_058', u.id, 3, 'Food and Needs', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_f'
where u.stable_key = 'unit_week_12'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_059', u.id, 4, 'Daily Conversation', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_12'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lessons (stable_key, unit_id, lesson_order, title, subtitle, estimated_minutes, lesson_type, sound_focus_id, is_review_lesson, is_published)
select 'lesson_060', u.id, 5, 'Final Speaking Test', null, 12, 'standard', s.id, false, true
from units u
left join sounds s on s.stable_key = 'sound_w'
where u.stable_key = 'unit_week_12'
on conflict (stable_key) do update
set title = excluded.title,
    lesson_order = excluded.lesson_order,
    estimated_minutes = excluded.estimated_minutes,
    lesson_type = excluded.lesson_type,
    sound_focus_id = excluded.sound_focus_id,
    is_published = excluded.is_published;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_001' and w.stable_key = 'word_bag'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_001' and w.stable_key = 'word_pen'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_001' and w.stable_key = 'word_book'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_001' and w.stable_key = 'word_bed'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_002' and w.stable_key = 'word_book'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_002' and w.stable_key = 'word_big'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_002' and w.stable_key = 'word_box'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_002' and w.stable_key = 'word_sit'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_003' and w.stable_key = 'word_cup'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_003' and w.stable_key = 'word_room'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_003' and w.stable_key = 'word_good'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_003' and w.stable_key = 'word_bus'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_004' and w.stable_key = 'word_baby'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_004' and w.stable_key = 'word_mother'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_004' and w.stable_key = 'word_pen'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_004' and w.stable_key = 'word_bag'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_005' and w.stable_key = 'word_ten'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_005' and w.stable_key = 'word_door'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_005' and w.stable_key = 'word_tea'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_005' and w.stable_key = 'word_no'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_006' and w.stable_key = 'word_go'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_006' and w.stable_key = 'word_come'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_006' and w.stable_key = 'word_home'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_006' and w.stable_key = 'word_good'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_007' and w.stable_key = 'word_see'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_007' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_007' and w.stable_key = 'word_good'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_007' and w.stable_key = 'word_yes'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_008' and w.stable_key = 'word_fish'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_008' and w.stable_key = 'word_five'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_008' and w.stable_key = 'word_food'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_008' and w.stable_key = 'word_friend'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_009' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_009' and w.stable_key = 'word_yes'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_009' and w.stable_key = 'word_you'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_009' and w.stable_key = 'word_we'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 5
from lessons l, words w
where l.stable_key = 'lesson_009' and w.stable_key = 'word_yellow'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_010' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_010' and w.stable_key = 'word_milk'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_010' and w.stable_key = 'word_egg'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_010' and w.stable_key = 'word_soup'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 5
from lessons l, words w
where l.stable_key = 'lesson_010' and w.stable_key = 'word_bread'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_011' and w.stable_key = 'word_i'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_011' and w.stable_key = 'word_you'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_011' and w.stable_key = 'word_he'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_011' and w.stable_key = 'word_she'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 5
from lessons l, words w
where l.stable_key = 'lesson_011' and w.stable_key = 'word_we'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_012' and w.stable_key = 'word_this'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_012' and w.stable_key = 'word_that'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_012' and w.stable_key = 'word_here'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_012' and w.stable_key = 'word_there'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 5
from lessons l, words w
where l.stable_key = 'lesson_012' and w.stable_key = 'word_it'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_013' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_013' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_013' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_013' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_014' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_014' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_014' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_014' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_015' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_015' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_015' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_015' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_016' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_016' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_016' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_016' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_017' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_017' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_017' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_017' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_018' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_018' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_018' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_018' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_019' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_019' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_019' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_019' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_020' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_020' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_020' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_020' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_021' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_021' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_021' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_021' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_022' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_022' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_022' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_022' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_023' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_023' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_023' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_023' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_024' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_024' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_024' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_024' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_025' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_025' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_025' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_025' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_026' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_026' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_026' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_026' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_027' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_027' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_027' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_027' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_028' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_028' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_028' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_028' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_029' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_029' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_029' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_029' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_030' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_030' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_030' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_030' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_031' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_031' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_031' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_031' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_032' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_032' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_032' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_032' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_033' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_033' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_033' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_033' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_034' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_034' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_034' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_034' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_035' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_035' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_035' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_035' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_036' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_036' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_036' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_036' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_037' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_037' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_037' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_037' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_038' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_038' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_038' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_038' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_039' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_039' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_039' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_039' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_040' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_040' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_040' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_040' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_041' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_041' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_041' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_041' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_042' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_042' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_042' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_042' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_043' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_043' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_043' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_043' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_044' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_044' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_044' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_044' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_045' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_045' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_045' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_045' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_046' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_046' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_046' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_046' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_047' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_047' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_047' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_047' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_048' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_048' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_048' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_048' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_049' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_049' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_049' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_049' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_050' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_050' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_050' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_050' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_051' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_051' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_051' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_051' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_052' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_052' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_052' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_052' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_053' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_053' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_053' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_053' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_054' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_054' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_054' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_054' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_055' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_055' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_055' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_055' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_056' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_056' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_056' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_056' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_057' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_057' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_057' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_057' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_058' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_058' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_058' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_058' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_059' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_059' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_059' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_059' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 1
from lessons l, words w
where l.stable_key = 'lesson_060' and w.stable_key = 'word_water'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 2
from lessons l, words w
where l.stable_key = 'lesson_060' and w.stable_key = 'word_rice'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 3
from lessons l, words w
where l.stable_key = 'lesson_060' and w.stable_key = 'word_help'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_words (lesson_id, word_id, display_order)
select l.id, w.id, 4
from lessons l, words w
where l.stable_key = 'lesson_060' and w.stable_key = 'word_happy'
on conflict (lesson_id, word_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_001' and s.stable_key = 'sentence_this_is_a_bag'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_001' and s.stable_key = 'sentence_this_is_a_pen'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_002' and s.stable_key = 'sentence_this_is_a_pen'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_002' and s.stable_key = 'sentence_it_is_hot'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_003' and s.stable_key = 'sentence_this_is_my_room'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_003' and s.stable_key = 'sentence_i_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_004' and s.stable_key = 'sentence_this_is_a_bag'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_004' and s.stable_key = 'sentence_good_morning'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_005' and s.stable_key = 'sentence_i_want_tea'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_005' and s.stable_key = 'sentence_open_the_door'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_006' and s.stable_key = 'sentence_i_am_happy'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_006' and s.stable_key = 'sentence_i_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_007' and s.stable_key = 'sentence_i_want_rice'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_007' and s.stable_key = 'sentence_it_is_hot'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_008' and s.stable_key = 'sentence_i_like_chicken'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_008' and s.stable_key = 'sentence_i_like_tea'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_009' and s.stable_key = 'sentence_i_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_009' and s.stable_key = 'sentence_yes_please'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_010' and s.stable_key = 'sentence_i_want_rice'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_010' and s.stable_key = 'sentence_no_thank_you'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_011' and s.stable_key = 'sentence_i_am_happy'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_011' and s.stable_key = 'sentence_i_am_tired'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_012' and s.stable_key = 'sentence_that_is_my_bag'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_012' and s.stable_key = 'sentence_this_is_my_room'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_013' and s.stable_key = 'sentence_this_is_my_room'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_013' and s.stable_key = 'sentence_good_morning'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_014' and s.stable_key = 'sentence_this_is_my_room'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_014' and s.stable_key = 'sentence_i_am_happy'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_015' and s.stable_key = 'sentence_can_you_help_me'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_015' and s.stable_key = 'sentence_good_morning'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_016' and s.stable_key = 'sentence_this_is_my_room'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_016' and s.stable_key = 'sentence_where_is_my_bag'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_017' and s.stable_key = 'sentence_open_the_door'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_017' and s.stable_key = 'sentence_close_the_window'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_018' and s.stable_key = 'sentence_i_am_tired'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_018' and s.stable_key = 'sentence_i_am_happy'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_019' and s.stable_key = 'sentence_i_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_019' and s.stable_key = 'sentence_open_the_door'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_020' and s.stable_key = 'sentence_where_is_my_bag'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_020' and s.stable_key = 'sentence_this_is_my_room'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_021' and s.stable_key = 'sentence_i_am_happy'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_021' and s.stable_key = 'sentence_i_am_tired'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_022' and s.stable_key = 'sentence_i_am_hungry'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_022' and s.stable_key = 'sentence_i_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_023' and s.stable_key = 'sentence_i_am_happy'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_023' and s.stable_key = 'sentence_i_am_hungry'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_024' and s.stable_key = 'sentence_i_need_help'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_024' and s.stable_key = 'sentence_can_you_help_me'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_025' and s.stable_key = 'sentence_i_want_rice'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_025' and s.stable_key = 'sentence_i_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_026' and s.stable_key = 'sentence_i_like_tea'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_026' and s.stable_key = 'sentence_i_like_chicken'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_027' and s.stable_key = 'sentence_i_like_chicken'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_027' and s.stable_key = 'sentence_no_thank_you'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_028' and s.stable_key = 'sentence_it_is_hot'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_028' and s.stable_key = 'sentence_it_is_cold'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_029' and s.stable_key = 'sentence_do_you_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_029' and s.stable_key = 'sentence_yes_please'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_030' and s.stable_key = 'sentence_i_want_rice'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_030' and s.stable_key = 'sentence_do_you_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_031' and s.stable_key = 'sentence_this_is_a_bag'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_031' and s.stable_key = 'sentence_i_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_032' and s.stable_key = 'sentence_no_thank_you'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_032' and s.stable_key = 'sentence_yes_please'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_033' and s.stable_key = 'sentence_yes_please'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_033' and s.stable_key = 'sentence_no_thank_you'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_034' and s.stable_key = 'sentence_yes_please'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_034' and s.stable_key = 'sentence_no_thank_you'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_035' and s.stable_key = 'sentence_do_you_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_035' and s.stable_key = 'sentence_yes_please'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_036' and s.stable_key = 'sentence_where_is_my_bag'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_036' and s.stable_key = 'sentence_where_is_the_bathroom'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_037' and s.stable_key = 'sentence_i_am_happy'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_037' and s.stable_key = 'sentence_good_morning'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_038' and s.stable_key = 'sentence_where_is_my_bag'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_038' and s.stable_key = 'sentence_can_you_help_me'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_039' and s.stable_key = 'sentence_where_is_the_bathroom'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_039' and s.stable_key = 'sentence_that_is_my_bag'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_040' and s.stable_key = 'sentence_good_morning'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_040' and s.stable_key = 'sentence_i_am_happy'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_041' and s.stable_key = 'sentence_i_want_rice'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_041' and s.stable_key = 'sentence_where_is_my_bag'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_042' and s.stable_key = 'sentence_i_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_042' and s.stable_key = 'sentence_do_you_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_043' and s.stable_key = 'sentence_can_you_help_me'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_043' and s.stable_key = 'sentence_do_you_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_044' and s.stable_key = 'sentence_i_need_help'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_044' and s.stable_key = 'sentence_i_want_rice'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_045' and s.stable_key = 'sentence_i_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_045' and s.stable_key = 'sentence_this_is_my_room'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_046' and s.stable_key = 'sentence_where_is_the_bathroom'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_046' and s.stable_key = 'sentence_where_is_my_bag'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_047' and s.stable_key = 'sentence_where_is_the_bathroom'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_047' and s.stable_key = 'sentence_can_you_help_me'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_048' and s.stable_key = 'sentence_do_you_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_048' and s.stable_key = 'sentence_yes_please'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_049' and s.stable_key = 'sentence_where_is_the_bathroom'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_049' and s.stable_key = 'sentence_yes_please'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_050' and s.stable_key = 'sentence_can_you_help_me'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_050' and s.stable_key = 'sentence_yes_please'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_051' and s.stable_key = 'sentence_can_you_help_me'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_051' and s.stable_key = 'sentence_yes_please'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_052' and s.stable_key = 'sentence_good_morning'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_052' and s.stable_key = 'sentence_no_thank_you'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_053' and s.stable_key = 'sentence_good_morning'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_053' and s.stable_key = 'sentence_i_am_happy'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_054' and s.stable_key = 'sentence_i_want_rice'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_054' and s.stable_key = 'sentence_i_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_055' and s.stable_key = 'sentence_can_you_help_me'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_055' and s.stable_key = 'sentence_yes_please'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_056' and s.stable_key = 'sentence_i_am_happy'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_056' and s.stable_key = 'sentence_good_morning'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_057' and s.stable_key = 'sentence_this_is_my_room'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_057' and s.stable_key = 'sentence_that_is_my_bag'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_058' and s.stable_key = 'sentence_i_am_hungry'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_058' and s.stable_key = 'sentence_i_need_help'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_059' and s.stable_key = 'sentence_i_want_tea'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_059' and s.stable_key = 'sentence_where_is_my_bag'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 1
from lessons l, sentences s
where l.stable_key = 'lesson_060' and s.stable_key = 'sentence_can_you_help_me'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;


insert into lesson_sentences (lesson_id, sentence_id, display_order)
select l.id, s.id, 2
from lessons l, sentences s
where l.stable_key = 'lesson_060' and s.stable_key = 'sentence_i_want_water'
on conflict (lesson_id, sentence_id) do update
set display_order = excluded.display_order;

-- =========================================================
-- LESSON STEPS
-- =========================================================

insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_001_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_001'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_001_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_001'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_001_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_001'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_001_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_001'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_001_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_001'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_002_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_002'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_002_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_002'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_002_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_002'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_002_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_002'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_002_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_002'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_003_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_003'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_003_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_003'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_003_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_003'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_003_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_003'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_003_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_003'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_004_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_004'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_004_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_004'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_004_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_004'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_004_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_004'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_004_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_004'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_005_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_005'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_005_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_005'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_005_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_005'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_005_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_005'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_005_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_005'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_006_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_006'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_006_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_006'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_006_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_006'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_006_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_006'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_006_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_006'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_007_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_007'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_007_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_007'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_007_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_007'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_007_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_007'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_007_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_007'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_008_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_008'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_008_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_008'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_008_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_008'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_008_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_008'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_008_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_008'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_009_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_009'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_009_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_009'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_009_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_009'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_009_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_009'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_009_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_009'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_010_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_010'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_010_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_010'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_010_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_010'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_010_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_010'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_010_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_010'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_011_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_011'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_011_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_011'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_011_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_011'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_011_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_011'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_011_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_011'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_012_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_012'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_012_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_012'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_012_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_012'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_012_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_012'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_012_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_012'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_013_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_013'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_013_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_013'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_013_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_013'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_013_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_013'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_013_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_013'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_014_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_014'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_014_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_014'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_014_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_014'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_014_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_014'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_014_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_014'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_015_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_015'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_015_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_015'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_015_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_015'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_015_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_015'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_015_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_015'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_016_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_016'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_016_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_016'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_016_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_016'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_016_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_016'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_016_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_016'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_017_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_017'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_017_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_017'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_017_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_017'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_017_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_017'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_017_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_017'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_018_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_018'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_018_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_018'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_018_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_018'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_018_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_018'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_018_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_018'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_019_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_019'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_019_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_019'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_019_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_019'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_019_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_019'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_019_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_019'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_020_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_020'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_020_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_020'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_020_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_020'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_020_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_020'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_020_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_020'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_021_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_021'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_021_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_021'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_021_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_021'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_021_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_021'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_021_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_021'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_022_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_022'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_022_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_022'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_022_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_022'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_022_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_022'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_022_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_022'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_023_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_023'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_023_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_023'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_023_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_023'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_023_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_023'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_023_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_023'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_024_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_024'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_024_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_024'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_024_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_024'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_024_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_024'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_024_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_024'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_025_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_025'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_025_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_025'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_025_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_025'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_025_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_025'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_025_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_025'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_026_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_026'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_026_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_026'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_026_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_026'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_026_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_026'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_026_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_026'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_027_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_027'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_027_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_027'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_027_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_027'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_027_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_027'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_027_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_027'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_028_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_028'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_028_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_028'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_028_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_028'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_028_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_028'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_028_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_028'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_029_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_029'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_029_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_029'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_029_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_029'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_029_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_029'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_029_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_029'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_030_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_030'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_030_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_030'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_030_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_030'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_030_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_030'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_030_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_030'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_031_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_031'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_031_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_031'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_031_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_031'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_031_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_031'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_031_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_031'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_032_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_032'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_032_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_032'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_032_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_032'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_032_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_032'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_032_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_032'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_033_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_033'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_033_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_033'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_033_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_033'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_033_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_033'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_033_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_033'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_034_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_034'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_034_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_034'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_034_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_034'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_034_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_034'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_034_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_034'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_035_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_035'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_035_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_035'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_035_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_035'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_035_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_035'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_035_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_035'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_036_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_036'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_036_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_036'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_036_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_036'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_036_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_036'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_036_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_036'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_037_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_037'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_037_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_037'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_037_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_037'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_037_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_037'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_037_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_037'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_038_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_038'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_038_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_038'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_038_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_038'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_038_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_038'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_038_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_038'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_039_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_039'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_039_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_039'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_039_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_039'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_039_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_039'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_039_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_039'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_040_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_040'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_040_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_040'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_040_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_040'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_040_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_040'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_040_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_040'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_041_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_041'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_041_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_041'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_041_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_041'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_041_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_041'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_041_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_041'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_042_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_042'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_042_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_042'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_042_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_042'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_042_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_042'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_042_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_042'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_043_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_043'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_043_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_043'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_043_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_043'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_043_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_043'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_043_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_043'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_044_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_044'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_044_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_044'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_044_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_044'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_044_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_044'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_044_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_044'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_045_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_045'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_045_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_045'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_045_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_045'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_045_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_045'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_045_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_045'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_046_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_046'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_046_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_046'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_046_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_046'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_046_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_046'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_046_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_046'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_047_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_047'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_047_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_047'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_047_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_047'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_047_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_047'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_047_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_047'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_048_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_048'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_048_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_048'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_048_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_048'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_048_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_048'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_048_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_048'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_049_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_049'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_049_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_049'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_049_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_049'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_049_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_049'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_049_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_049'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_050_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_050'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_050_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_050'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_050_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_050'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_050_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_050'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_050_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_050'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_051_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_051'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_051_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_051'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_051_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_051'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_051_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_051'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_051_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_051'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_052_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_052'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_052_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_052'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_052_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_052'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_052_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_052'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_052_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_052'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_053_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_053'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_053_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_053'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_053_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_053'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_053_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_053'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_053_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_053'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_054_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_054'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_054_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_054'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_054_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_054'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_054_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_054'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_054_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_054'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_055_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_055'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_055_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_055'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_055_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_055'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_055_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_055'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_055_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_055'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_056_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_056'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_056_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_056'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_056_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_056'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_056_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_056'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_056_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_056'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_057_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_057'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_057_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_057'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_057_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_057'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_057_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_057'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_057_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_057'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_058_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_058'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_058_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_058'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_058_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_058'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_058_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_058'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_058_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_058'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_059_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_059'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_059_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_059'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_059_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_059'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_059_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_059'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_059_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_059'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_060_step_001', l.id, 1, 'audio_listen', 'Listen', 'ฟัง', '{"mode":"sound_focus"}'::jsonb, '{"auto_pass_after_play":true}'::jsonb
from lessons l
where l.stable_key = 'lesson_060'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_060_step_002', l.id, 2, 'syllable_drill', 'Say the syllables', 'พูดตามพยางค์', '{"mode":"syllable_drill"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_060'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_060_step_003', l.id, 3, 'word_flashcard', 'Learn the words', 'เรียนคำศัพท์', '{"mode":"word_flashcards"}'::jsonb, '{"min_cards":4}'::jsonb
from lessons l
where l.stable_key = 'lesson_060'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_060_step_004', l.id, 4, 'speak_sentence', 'Say the sentence', 'พูดประโยค', '{"mode":"sentence_speak"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_060'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;


insert into lesson_steps (stable_key, lesson_id, step_order, step_type, instruction_en, instruction_th, payload_json, passing_rule_json)
select 'lesson_060_step_005', l.id, 5, 'dialogue_turn', 'Mini dialogue', 'บทสนทนาสั้น', '{"mode":"mini_dialogue"}'::jsonb, '{"min_attempts":1}'::jsonb
from lessons l
where l.stable_key = 'lesson_060'
on conflict (stable_key) do update
set step_order = excluded.step_order,
    step_type = excluded.step_type,
    instruction_en = excluded.instruction_en,
    instruction_th = excluded.instruction_th,
    payload_json = excluded.payload_json,
    passing_rule_json = excluded.passing_rule_json;

-- =========================================================
-- DIALOGUES
-- =========================================================

insert into dialogues (stable_key, title, description, context_type, mode, level_id, target_phrases, validation_json, is_published)
select 'dialogue_greetings_001', 'Greetings', 'Simple hello and introduction', 'greetings', 'guided', l.id, '["Hello.", "How are you?", "I want water.", "Yes, please."]'::jsonb, '{}'::jsonb, true
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    context_type = excluded.context_type,
    mode = excluded.mode,
    level_id = excluded.level_id,
    target_phrases = excluded.target_phrases,
    is_published = excluded.is_published;


insert into dialogues (stable_key, title, description, context_type, mode, level_id, target_phrases, validation_json, is_published)
select 'dialogue_home_001', 'At Home', 'Simple home conversation', 'home', 'guided', l.id, '["Hello.", "How are you?", "I want water.", "Yes, please."]'::jsonb, '{}'::jsonb, true
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    context_type = excluded.context_type,
    mode = excluded.mode,
    level_id = excluded.level_id,
    target_phrases = excluded.target_phrases,
    is_published = excluded.is_published;


insert into dialogues (stable_key, title, description, context_type, mode, level_id, target_phrases, validation_json, is_published)
select 'dialogue_food_001', 'Ordering Water', 'Practice asking for a drink', 'food', 'guided', l.id, '["Hello.", "How are you?", "I want water.", "Yes, please."]'::jsonb, '{}'::jsonb, true
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    context_type = excluded.context_type,
    mode = excluded.mode,
    level_id = excluded.level_id,
    target_phrases = excluded.target_phrases,
    is_published = excluded.is_published;


insert into dialogues (stable_key, title, description, context_type, mode, level_id, target_phrases, validation_json, is_published)
select 'dialogue_food_002', 'Ordering Rice', 'Practice asking for food', 'food', 'guided', l.id, '["Hello.", "How are you?", "I want water.", "Yes, please."]'::jsonb, '{}'::jsonb, true
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    context_type = excluded.context_type,
    mode = excluded.mode,
    level_id = excluded.level_id,
    target_phrases = excluded.target_phrases,
    is_published = excluded.is_published;


insert into dialogues (stable_key, title, description, context_type, mode, level_id, target_phrases, validation_json, is_published)
select 'dialogue_help_001', 'Asking for Help', 'Practice asking for help', 'help', 'guided', l.id, '["Hello.", "How are you?", "I want water.", "Yes, please."]'::jsonb, '{}'::jsonb, true
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    context_type = excluded.context_type,
    mode = excluded.mode,
    level_id = excluded.level_id,
    target_phrases = excluded.target_phrases,
    is_published = excluded.is_published;


insert into dialogues (stable_key, title, description, context_type, mode, level_id, target_phrases, validation_json, is_published)
select 'dialogue_directions_001', 'Bathroom Directions', 'Practice asking for the bathroom', 'directions', 'guided', l.id, '["Hello.", "How are you?", "I want water.", "Yes, please."]'::jsonb, '{}'::jsonb, true
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    context_type = excluded.context_type,
    mode = excluded.mode,
    level_id = excluded.level_id,
    target_phrases = excluded.target_phrases,
    is_published = excluded.is_published;


insert into dialogues (stable_key, title, description, context_type, mode, level_id, target_phrases, validation_json, is_published)
select 'dialogue_phone_001', 'Phone Basics', 'Simple phone call conversation', 'phone', 'guided', l.id, '["Hello.", "How are you?", "I want water.", "Yes, please."]'::jsonb, '{}'::jsonb, true
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    context_type = excluded.context_type,
    mode = excluded.mode,
    level_id = excluded.level_id,
    target_phrases = excluded.target_phrases,
    is_published = excluded.is_published;


insert into dialogues (stable_key, title, description, context_type, mode, level_id, target_phrases, validation_json, is_published)
select 'dialogue_feelings_001', 'How Are You', 'Talk about feelings', 'feelings', 'guided', l.id, '["Hello.", "How are you?", "I want water.", "Yes, please."]'::jsonb, '{}'::jsonb, true
from levels l
where l.stable_key = 'level_0'
on conflict (stable_key) do update
set title = excluded.title,
    description = excluded.description,
    context_type = excluded.context_type,
    mode = excluded.mode,
    level_id = excluded.level_id,
    target_phrases = excluded.target_phrases,
    is_published = excluded.is_published;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 1, 'app', 'Hello.', 'สวัสดี', null, null, null
from dialogues d
where d.stable_key = 'dialogue_greetings_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 2, 'learner', null, null, '["Hello.", "Hi."]'::jsonb, 'exact_or_normalized', 'Say: Hello.'
from dialogues d
where d.stable_key = 'dialogue_greetings_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 3, 'app', 'How are you?', 'สบายดีไหม', null, null, null
from dialogues d
where d.stable_key = 'dialogue_greetings_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 4, 'learner', null, null, '["I am fine.", "Fine, thank you."]'::jsonb, 'exact_or_normalized', 'Say: I am fine.'
from dialogues d
where d.stable_key = 'dialogue_greetings_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 1, 'app', 'Where are you?', 'คุณอยู่ที่ไหน', null, null, null
from dialogues d
where d.stable_key = 'dialogue_home_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 2, 'learner', null, null, '["I am at home.", "I am in the room."]'::jsonb, 'exact_or_normalized', 'Say: I am at home.'
from dialogues d
where d.stable_key = 'dialogue_home_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 3, 'app', 'Come here, please.', 'มานี่หน่อย', null, null, null
from dialogues d
where d.stable_key = 'dialogue_home_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 4, 'learner', null, null, '["Okay.", "Yes."]'::jsonb, 'exact_or_normalized', 'Say: Okay.'
from dialogues d
where d.stable_key = 'dialogue_home_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 1, 'app', 'Do you want water?', 'คุณต้องการน้ำไหม', null, null, null
from dialogues d
where d.stable_key = 'dialogue_food_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 2, 'learner', null, null, '["Yes, please.", "Yes please."]'::jsonb, 'exact_or_normalized', 'Say: Yes, please.'
from dialogues d
where d.stable_key = 'dialogue_food_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 3, 'app', 'Here you are.', 'นี่ค่ะ/ครับ', null, null, null
from dialogues d
where d.stable_key = 'dialogue_food_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 4, 'learner', null, null, '["Thank you.", "Thanks."]'::jsonb, 'exact_or_normalized', 'Say: Thank you.'
from dialogues d
where d.stable_key = 'dialogue_food_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 1, 'app', 'What do you want to eat?', 'คุณอยากกินอะไร', null, null, null
from dialogues d
where d.stable_key = 'dialogue_food_002'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 2, 'learner', null, null, '["I want rice.", "Rice, please."]'::jsonb, 'exact_or_normalized', 'Say: I want rice.'
from dialogues d
where d.stable_key = 'dialogue_food_002'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 3, 'app', 'Do you want chicken?', 'คุณต้องการไก่ไหม', null, null, null
from dialogues d
where d.stable_key = 'dialogue_food_002'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 4, 'learner', null, null, '["Yes, please.", "No, thank you."]'::jsonb, 'exact_or_normalized', 'Say: Yes, please.'
from dialogues d
where d.stable_key = 'dialogue_food_002'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 1, 'app', 'Are you okay?', 'คุณโอเคไหม', null, null, null
from dialogues d
where d.stable_key = 'dialogue_help_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 2, 'learner', null, null, '["I need help.", "Can you help me?"]'::jsonb, 'exact_or_normalized', 'Say: I need help.'
from dialogues d
where d.stable_key = 'dialogue_help_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 3, 'app', 'Yes, I can help.', 'ได้ ฉันช่วยได้', null, null, null
from dialogues d
where d.stable_key = 'dialogue_help_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 4, 'learner', null, null, '["Thank you.", "Thank you very much."]'::jsonb, 'exact_or_normalized', 'Say: Thank you.'
from dialogues d
where d.stable_key = 'dialogue_help_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 1, 'app', 'Excuse me, where is the bathroom?', 'ขอโทษ ห้องน้ำอยู่ที่ไหน', null, null, null
from dialogues d
where d.stable_key = 'dialogue_directions_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 2, 'learner', null, null, '["Where is the bathroom?"]'::jsonb, 'exact_or_normalized', 'Say: Where is the bathroom?'
from dialogues d
where d.stable_key = 'dialogue_directions_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 3, 'app', 'Go straight. Turn left.', 'ตรงไป แล้วเลี้ยวซ้าย', null, null, null
from dialogues d
where d.stable_key = 'dialogue_directions_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 4, 'learner', null, null, '["Thank you.", "Okay, thank you."]'::jsonb, 'exact_or_normalized', 'Say: Thank you.'
from dialogues d
where d.stable_key = 'dialogue_directions_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 1, 'app', 'Hello?', 'ฮัลโหล', null, null, null
from dialogues d
where d.stable_key = 'dialogue_phone_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 2, 'learner', null, null, '["Hello."]'::jsonb, 'exact_or_normalized', 'Say: Hello.'
from dialogues d
where d.stable_key = 'dialogue_phone_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 3, 'app', 'Can you hear me?', 'ได้ยินฉันไหม', null, null, null
from dialogues d
where d.stable_key = 'dialogue_phone_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 4, 'learner', null, null, '["Yes, I can hear you.", "I can hear you."]'::jsonb, 'exact_or_normalized', 'Say: Yes, I can hear you.'
from dialogues d
where d.stable_key = 'dialogue_phone_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 1, 'app', 'How are you?', 'คุณสบายดีไหม', null, null, null
from dialogues d
where d.stable_key = 'dialogue_feelings_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 2, 'learner', null, null, '["I am happy.", "I am tired.", "I am fine."]'::jsonb, 'exact_or_normalized', 'Say: I am fine.'
from dialogues d
where d.stable_key = 'dialogue_feelings_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 3, 'app', 'Are you hungry?', 'คุณหิวไหม', null, null, null
from dialogues d
where d.stable_key = 'dialogue_feelings_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;


insert into dialogue_turns (dialogue_id, turn_order, speaker, text, thai_text, expected_answers, validation_type, hint_text)
select d.id, 4, 'learner', null, null, '["Yes, I am.", "No, I am not."]'::jsonb, 'exact_or_normalized', 'Say: Yes, I am.'
from dialogues d
where d.stable_key = 'dialogue_feelings_001'
on conflict (dialogue_id, turn_order) do update
set speaker = excluded.speaker,
    text = excluded.text,
    thai_text = excluded.thai_text,
    expected_answers = excluded.expected_answers,
    validation_type = excluded.validation_type,
    hint_text = excluded.hint_text;

-- =========================================================
-- ACHIEVEMENTS
-- =========================================================

insert into achievements (code, title, description)
values ('first_lesson_complete', 'First Lesson Complete', 'Completed the first lesson')
on conflict (code) do update
set title = excluded.title,
    description = excluded.description;


insert into achievements (code, title, description)
values ('seven_day_streak', '7-Day Streak', 'Practiced 7 days in a row')
on conflict (code) do update
set title = excluded.title,
    description = excluded.description;


insert into achievements (code, title, description)
values ('hundred_words', '100 Words', 'Learned 100 words')
on conflict (code) do update
set title = excluded.title,
    description = excluded.description;


insert into achievements (code, title, description)
values ('first_dialogue_complete', 'First Dialogue Complete', 'Completed the first dialogue')
on conflict (code) do update
set title = excluded.title,
    description = excluded.description;

-- =========================================================
-- DOWNLOAD PACKS
-- =========================================================

insert into download_packs (stable_key, title, size_mb, asset_count, is_published)
values ('pack_week_1', 'Week 1 Audio Pack', 42, 120, true)
on conflict (stable_key) do update
set title = excluded.title,
    size_mb = excluded.size_mb,
    asset_count = excluded.asset_count,
    is_published = excluded.is_published;


insert into download_packs (stable_key, title, size_mb, asset_count, is_published)
values ('pack_core_sounds', 'Core Sounds Pack', 30, 80, true)
on conflict (stable_key) do update
set title = excluded.title,
    size_mb = excluded.size_mb,
    asset_count = excluded.asset_count,
    is_published = excluded.is_published;

commit;