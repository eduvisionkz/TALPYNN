-- Scope teacher access to student results from topics the teacher authored.
-- No classroom membership model exists yet; system topics do not confer access
-- to every student's profile or progress. Administrators retain full access.
begin;

drop policy if exists "profiles_select_own_or_staff" on public.profiles;
create policy "profiles_select_own_or_staff" on public.profiles for select
  using (id = auth.uid() or public.is_admin());

drop policy if exists "progress_select_own_or_staff" on public.progress;
create policy "progress_select_own_or_staff" on public.progress for select
  using (user_id = auth.uid() or public.is_admin() or exists (
    select 1 from public.topics t where t.id = progress.topic_id
    and t.created_by = auth.uid() and public.is_teacher()
  ));

drop policy if exists "attempts_select_own_or_staff" on public.attempts;
create policy "attempts_select_own_or_staff" on public.attempts for select
  using (user_id = auth.uid() or public.is_admin() or exists (
    select 1 from public.topics t where t.id = attempts.topic_id
    and t.created_by = auth.uid() and public.is_teacher()
  ));

drop policy if exists "user_achievements_select_own_or_staff" on public.user_achievements;
create policy "user_achievements_select_own_or_staff" on public.user_achievements for select
  using (user_id = auth.uid() or public.is_admin());

drop policy if exists "materials_insert_teacher" on public.materials;
create policy "materials_insert_teacher" on public.materials for insert
  with check (public.is_teacher() and uploaded_by = auth.uid()
    and (public.owns_topic(topic_id) or public.is_admin()));

commit;
