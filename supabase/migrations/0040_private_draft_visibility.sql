-- Drafts authored by another teacher/author are private. Shared system drafts
-- remain editable by staff; published content remains readable by everyone.
begin;

drop policy if exists "sections_select_own_draft_or_staff" on public.sections;
create policy "sections_select_own_draft_or_staff" on public.sections for select
  using (created_by = auth.uid() or (created_by is null and public.is_teacher()) or public.is_admin());

drop policy if exists "topics_select_own_draft_or_staff" on public.topics;
create policy "topics_select_own_draft_or_staff" on public.topics for select
  using (created_by = auth.uid() or (created_by is null and public.is_teacher()) or public.is_admin());

drop policy if exists "lesson_blocks_select_visible_topic" on public.lesson_blocks;
create policy "lesson_blocks_select_visible_topic" on public.lesson_blocks for select
  using (exists (
    select 1 from public.topics t where t.id = lesson_blocks.topic_id
    and (t.status = 'published' or t.created_by = auth.uid()
      or (t.created_by is null and public.is_teacher()) or public.is_admin())
  ));

drop policy if exists "questions_select_visible_topic" on public.questions;
create policy "questions_select_visible_topic" on public.questions for select
  using (exists (
    select 1 from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
    where lb.id = questions.lesson_block_id
    and (t.status = 'published' or t.created_by = auth.uid()
      or (t.created_by is null and public.is_teacher()) or public.is_admin())
  ));

drop policy if exists "question_options_select_visible_topic" on public.question_options;
create policy "question_options_select_visible_topic" on public.question_options for select
  using (exists (
    select 1 from public.questions q join public.lesson_blocks lb on lb.id = q.lesson_block_id
    join public.topics t on t.id = lb.topic_id
    where q.id = question_options.question_id
    and (t.status = 'published' or t.created_by = auth.uid()
      or (t.created_by is null and public.is_teacher()) or public.is_admin())
  ));

drop policy if exists "materials_select_visible_topic" on public.materials;
create policy "materials_select_visible_topic" on public.materials for select
  using (exists (
    select 1 from public.topics t where t.id = materials.topic_id
    and (t.status = 'published' or t.created_by = auth.uid()
      or (t.created_by is null and public.is_teacher()) or public.is_admin())
  ));

commit;
