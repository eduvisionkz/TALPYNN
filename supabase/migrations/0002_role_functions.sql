-- Talpyn — security-definer role-check helpers, used by RLS policies
-- so a policy can check role membership without a recursive RLS read
-- on profiles itself.

create or replace function public.is_teacher()
returns boolean language sql security definer set search_path = public stable as $$
  select exists (
    select 1 from public.profiles
    where id = auth.uid() and role in ('teacher', 'admin') and not is_blocked
  );
$$;

create or replace function public.is_admin()
returns boolean language sql security definer set search_path = public stable as $$
  select exists (
    select 1 from public.profiles
    where id = auth.uid() and role = 'admin' and not is_blocked
  );
$$;

create or replace function public.owns_topic(p_topic_id uuid)
returns boolean language sql security definer set search_path = public stable as $$
  select exists (
    select 1 from public.topics
    where id = p_topic_id and created_by = auth.uid()
  );
$$;
