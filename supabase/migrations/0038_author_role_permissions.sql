-- Author can create and edit own lessons and shared system topics like a teacher.
create or replace function public.is_teacher()
returns boolean language sql security definer set search_path = public stable as $$
  select exists (
    select 1 from public.profiles
    where id = auth.uid() and role in ('teacher', 'author', 'admin') and not is_blocked
  );
$$;
