-- Teachers may edit shared, built-in lessons (created_by is null) in the
-- visual constructor. Teacher-owned lessons stay private to their author;
-- admins keep full access. Deleting a built-in topic is still not allowed.

create or replace function public.owns_topic(p_topic_id uuid)
returns boolean language sql security definer set search_path = public stable as $$
  select exists (
    select 1
    from public.topics
    where id = p_topic_id
      and (
        created_by = auth.uid()
        or (created_by is null and public.is_teacher())
      )
  );
$$;

drop policy if exists "topics_update_owner_or_admin" on public.topics;
create policy "topics_update_owner_or_admin" on public.topics for update
  using (
    created_by = auth.uid()
    or (created_by is null and public.is_teacher())
    or public.is_admin()
  )
  with check (
    created_by = auth.uid()
    or (created_by is null and public.is_teacher())
    or public.is_admin()
  );
