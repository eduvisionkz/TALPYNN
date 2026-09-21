-- Talpyn — Storage bucket `materials` and its policies.
-- Folders used by the app: authors/ topics/ infographics/ videos/ documents/ mascot/

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'materials', 'materials', true, 26214400,
  array['image/jpeg','image/png','image/webp','image/svg+xml','video/mp4','video/webm','audio/mpeg','application/pdf']
)
on conflict (id) do nothing;

create policy "materials_bucket_public_read" on storage.objects for select
  using (bucket_id = 'materials');

create policy "materials_bucket_teacher_insert" on storage.objects for insert
  with check (bucket_id = 'materials' and public.is_teacher());

create policy "materials_bucket_teacher_update" on storage.objects for update
  using (bucket_id = 'materials' and public.is_teacher())
  with check (bucket_id = 'materials' and public.is_teacher());

create policy "materials_bucket_owner_or_admin_delete" on storage.objects for delete
  using (bucket_id = 'materials' and (owner = auth.uid() or public.is_admin()));
