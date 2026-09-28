-- Talpyn — Row Level Security policies

alter table public.profiles enable row level security;

create policy "profiles_select_own_or_staff" on public.profiles for select
  using (id = auth.uid() or public.is_teacher());

create policy "profiles_update_own" on public.profiles for update
  using (id = auth.uid()) with check (id = auth.uid());

create policy "profiles_admin_manage_all" on public.profiles for all
  using (public.is_admin()) with check (public.is_admin());

create or replace function public.prevent_role_self_escalation()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  if (new.role is distinct from old.role or new.is_blocked is distinct from old.is_blocked)
     and not public.is_admin() then
    raise exception 'Only an administrator can change a user role or block status.';
  end if;
  return new;
end;
$$;
create trigger trg_profiles_prevent_role_escalation before update on public.profiles
  for each row execute function public.prevent_role_self_escalation();

alter table public.sections enable row level security;
create policy "sections_select_published" on public.sections for select using (published = true);
create policy "sections_select_own_draft_or_staff" on public.sections for select
  using (created_by = auth.uid() or public.is_teacher());
create policy "sections_insert_teacher" on public.sections for insert
  with check (public.is_teacher() and created_by = auth.uid());
create policy "sections_update_owner_or_admin" on public.sections for update
  using (created_by = auth.uid() or public.is_admin())
  with check (created_by = auth.uid() or public.is_admin());
create policy "sections_delete_owner_or_admin" on public.sections for delete
  using (created_by = auth.uid() or public.is_admin());

alter table public.topics enable row level security;
create policy "topics_select_published" on public.topics for select using (status = 'published');
create policy "topics_select_own_draft_or_staff" on public.topics for select
  using (created_by = auth.uid() or public.is_teacher());
create policy "topics_insert_teacher" on public.topics for insert
  with check (public.is_teacher() and created_by = auth.uid());
create policy "topics_update_owner_or_admin" on public.topics for update
  using (created_by = auth.uid() or public.is_admin())
  with check (created_by = auth.uid() or public.is_admin());
create policy "topics_delete_owner_or_admin" on public.topics for delete
  using (created_by = auth.uid() or public.is_admin());

alter table public.lesson_blocks enable row level security;
create policy "lesson_blocks_select_visible_topic" on public.lesson_blocks for select
  using (exists (
    select 1 from public.topics t where t.id = lesson_blocks.topic_id
    and (t.status = 'published' or t.created_by = auth.uid() or public.is_teacher())
  ));
create policy "lesson_blocks_write_owner_or_admin" on public.lesson_blocks for all
  using (public.owns_topic(topic_id) or public.is_admin())
  with check (public.owns_topic(topic_id) or public.is_admin());

alter table public.questions enable row level security;
create policy "questions_select_visible_topic" on public.questions for select
  using (exists (
    select 1 from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
    where lb.id = questions.lesson_block_id
    and (t.status = 'published' or t.created_by = auth.uid() or public.is_teacher())
  ));
create policy "questions_write_owner_or_admin" on public.questions for all
  using (public.is_admin() or exists (
    select 1 from public.lesson_blocks lb where lb.id = questions.lesson_block_id and public.owns_topic(lb.topic_id)
  ))
  with check (public.is_admin() or exists (
    select 1 from public.lesson_blocks lb where lb.id = questions.lesson_block_id and public.owns_topic(lb.topic_id)
  ));

alter table public.question_options enable row level security;
create policy "question_options_select_visible_topic" on public.question_options for select
  using (exists (
    select 1 from public.questions q join public.lesson_blocks lb on lb.id = q.lesson_block_id
    join public.topics t on t.id = lb.topic_id
    where q.id = question_options.question_id
    and (t.status = 'published' or t.created_by = auth.uid() or public.is_teacher())
  ));
create policy "question_options_write_owner_or_admin" on public.question_options for all
  using (public.is_admin() or exists (
    select 1 from public.questions q join public.lesson_blocks lb on lb.id = q.lesson_block_id
    where q.id = question_options.question_id and public.owns_topic(lb.topic_id)
  ))
  with check (public.is_admin() or exists (
    select 1 from public.questions q join public.lesson_blocks lb on lb.id = q.lesson_block_id
    where q.id = question_options.question_id and public.owns_topic(lb.topic_id)
  ));

alter table public.progress enable row level security;
create policy "progress_select_own_or_staff" on public.progress for select
  using (user_id = auth.uid() or public.is_teacher());
create policy "progress_insert_own" on public.progress for insert with check (user_id = auth.uid());
create policy "progress_update_own" on public.progress for update
  using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy "progress_admin_manage_all" on public.progress for all
  using (public.is_admin()) with check (public.is_admin());

alter table public.attempts enable row level security;
create policy "attempts_select_own_or_staff" on public.attempts for select
  using (user_id = auth.uid() or public.is_teacher());
create policy "attempts_insert_own" on public.attempts for insert with check (user_id = auth.uid());

alter table public.materials enable row level security;
create policy "materials_select_visible_topic" on public.materials for select
  using (exists (
    select 1 from public.topics t where t.id = materials.topic_id
    and (t.status = 'published' or t.created_by = auth.uid() or public.is_teacher())
  ));
create policy "materials_insert_teacher" on public.materials for insert
  with check (public.is_teacher() and uploaded_by = auth.uid());
create policy "materials_delete_owner_or_admin" on public.materials for delete
  using (uploaded_by = auth.uid() or public.is_admin());

alter table public.achievements enable row level security;
create policy "achievements_select_all" on public.achievements for select using (true);
create policy "achievements_admin_manage" on public.achievements for all
  using (public.is_admin()) with check (public.is_admin());

alter table public.user_achievements enable row level security;
create policy "user_achievements_select_own_or_staff" on public.user_achievements for select
  using (user_id = auth.uid() or public.is_teacher());
create policy "user_achievements_insert_own" on public.user_achievements for insert with check (user_id = auth.uid());
create policy "user_achievements_admin_manage" on public.user_achievements for all
  using (public.is_admin()) with check (public.is_admin());

alter table public.favorites enable row level security;
create policy "favorites_manage_own" on public.favorites for all
  using (user_id = auth.uid()) with check (user_id = auth.uid());

alter table public.author_profile enable row level security;
create policy "author_profile_select_all" on public.author_profile for select using (true);
create policy "author_profile_admin_update" on public.author_profile for update
  using (public.is_admin()) with check (public.is_admin());
