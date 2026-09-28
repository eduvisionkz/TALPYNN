-- A teacher can edit a system topic, but must not claim ownership of it and
-- then delete it through the owner delete policy.
create or replace function public.prevent_topic_owner_change()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  if new.created_by is distinct from old.created_by and not public.is_admin() then
    raise exception 'Only an administrator can change topic ownership.';
  end if;
  return new;
end;
$$;

drop trigger if exists trg_topics_preserve_owner on public.topics;
create trigger trg_topics_preserve_owner before update on public.topics
  for each row execute function public.prevent_topic_owner_change();
