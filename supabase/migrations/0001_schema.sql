-- Talpyn — core schema
create extension if not exists "pgcrypto";

create type public.user_role as enum ('student', 'teacher', 'admin');
create type public.track as enum ('base', 'logic');
create type public.topic_status as enum ('draft', 'published', 'archived');
create type public.lesson_stage as enum ('kor', 'qurastyr', 'tusindir', 'qoldan', 'bekit');

create type public.block_type as enum (
  'text', 'image', 'infographic', 'video', 'audio', 'pdf',
  'question', 'multiple_choice', 'matching', 'ordering', 'drag_drop',
  'number_builder', 'short_answer', 'explanation', 'hint'
);

create type public.question_type as enum (
  'multiple_choice', 'matching', 'ordering', 'drag_drop',
  'number_builder', 'short_answer', 'number_line', 'balance_scale',
  'clock', 'money', 'measurement', 'expression_builder', 'find_error'
);

create type public.material_type as enum ('image', 'video', 'audio', 'pdf', 'other');

create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null default '',
  role public.user_role not null default 'student',
  grade smallint check (grade between 1 and 4),
  avatar_url text,
  school text,
  is_blocked boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create trigger trg_profiles_updated_at before update on public.profiles
  for each row execute function public.set_updated_at();

create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, full_name, role)
  values (new.id, coalesce(new.raw_user_meta_data ->> 'full_name', ''), 'student');
  return new;
end;
$$;
create trigger trg_on_auth_user_created after insert on auth.users
  for each row execute function public.handle_new_user();

create table public.sections (
  id uuid primary key default gen_random_uuid(),
  grade smallint not null check (grade between 1 and 4),
  track public.track not null,
  title text not null,
  description text,
  sort_order integer not null default 0,
  published boolean not null default false,
  created_by uuid references public.profiles(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create trigger trg_sections_updated_at before update on public.sections
  for each row execute function public.set_updated_at();
create index idx_sections_grade_track on public.sections (grade, track);

create table public.topics (
  id uuid primary key default gen_random_uuid(),
  section_id uuid references public.sections(id) on delete set null,
  grade smallint not null check (grade between 1 and 4),
  track public.track not null,
  title text not null,
  description text,
  learning_objective text,
  cover_url text,
  status public.topic_status not null default 'draft',
  sort_order integer not null default 0,
  created_by uuid references public.profiles(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create trigger trg_topics_updated_at before update on public.topics
  for each row execute function public.set_updated_at();
create index idx_topics_grade_track_status on public.topics (grade, track, status);
create index idx_topics_section on public.topics (section_id);

create table public.lesson_blocks (
  id uuid primary key default gen_random_uuid(),
  topic_id uuid not null references public.topics(id) on delete cascade,
  stage public.lesson_stage not null,
  block_type public.block_type not null,
  title text,
  content text,
  media_url text,
  configuration jsonb not null default '{}'::jsonb,
  sort_order integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create trigger trg_lesson_blocks_updated_at before update on public.lesson_blocks
  for each row execute function public.set_updated_at();
create index idx_lesson_blocks_topic_stage on public.lesson_blocks (topic_id, stage, sort_order);

create table public.questions (
  id uuid primary key default gen_random_uuid(),
  lesson_block_id uuid not null references public.lesson_blocks(id) on delete cascade,
  question_text text not null,
  question_type public.question_type not null,
  correct_answer jsonb not null,
  explanation text,
  hint text,
  points integer not null default 1 check (points >= 0),
  created_at timestamptz not null default now()
);
create index idx_questions_block on public.questions (lesson_block_id);

create table public.question_options (
  id uuid primary key default gen_random_uuid(),
  question_id uuid not null references public.questions(id) on delete cascade,
  option_text text,
  option_media_url text,
  is_correct boolean not null default false,
  sort_order integer not null default 0
);
create index idx_question_options_question on public.question_options (question_id);

create table public.progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  topic_id uuid not null references public.topics(id) on delete cascade,
  current_stage public.lesson_stage not null default 'kor',
  percent smallint not null default 0 check (percent between 0 and 100),
  score integer not null default 0,
  completed boolean not null default false,
  started_at timestamptz not null default now(),
  completed_at timestamptz,
  updated_at timestamptz not null default now(),
  unique (user_id, topic_id)
);
create trigger trg_progress_updated_at before update on public.progress
  for each row execute function public.set_updated_at();
create index idx_progress_user on public.progress (user_id);
create index idx_progress_topic on public.progress (topic_id);

create table public.attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  topic_id uuid not null references public.topics(id) on delete cascade,
  question_id uuid not null references public.questions(id) on delete cascade,
  answer jsonb not null,
  is_correct boolean not null,
  points integer not null default 0,
  created_at timestamptz not null default now()
);
create index idx_attempts_user_topic on public.attempts (user_id, topic_id);
create index idx_attempts_question on public.attempts (question_id);

create table public.materials (
  id uuid primary key default gen_random_uuid(),
  topic_id uuid not null references public.topics(id) on delete cascade,
  title text not null,
  type public.material_type not null,
  file_url text not null,
  file_path text not null,
  file_size bigint,
  mime_type text,
  uploaded_by uuid references public.profiles(id) on delete set null,
  created_at timestamptz not null default now()
);
create index idx_materials_topic on public.materials (topic_id);

create table public.achievements (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  title text not null,
  description text,
  icon_url text,
  condition jsonb not null default '{}'::jsonb
);

create table public.user_achievements (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  achievement_id uuid not null references public.achievements(id) on delete cascade,
  awarded_at timestamptz not null default now(),
  unique (user_id, achievement_id)
);
create index idx_user_achievements_user on public.user_achievements (user_id);

create table public.favorites (
  user_id uuid not null references public.profiles(id) on delete cascade,
  topic_id uuid not null references public.topics(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (user_id, topic_id)
);

create table public.author_profile (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  bio text,
  workplace text,
  position text,
  category text,
  experience_years smallint,
  education text,
  photo_url text,
  updated_at timestamptz not null default now()
);
create trigger trg_author_profile_updated_at before update on public.author_profile
  for each row execute function public.set_updated_at();

insert into public.author_profile (full_name, workplace, position, category, experience_years, education)
values (
  'Байбатырова Назым Серикболатовна',
  'Шығыс Қазақстан облысы білім басқармасы Катонқарағай ауданы бойынша білім бөлімінің «Қалихан Ысқақов атындағы орта мектебі» КММ',
  'Бастауыш сынып мұғалімі, педагог-зерттеуші',
  null,
  19,
  'Жоғары'
);
