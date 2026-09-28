-- Record the selected grade even when email confirmation delays the session.
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, full_name, role, grade)
  values (
    new.id,
    coalesce(new.raw_user_meta_data ->> 'full_name', ''),
    'student',
    case when new.raw_user_meta_data ->> 'grade' ~ '^[1-4]$'
      then (new.raw_user_meta_data ->> 'grade')::smallint
      else null end
  );
  return new;
end;
$$;
