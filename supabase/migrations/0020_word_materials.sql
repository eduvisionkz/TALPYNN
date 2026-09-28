-- Allow teachers to attach Word files as downloadable lesson materials.
-- Run after 0019. Word content is not automatically converted to exercises.
update storage.buckets
set allowed_mime_types = array[
  'image/jpeg', 'image/png', 'image/webp', 'image/svg+xml',
  'video/mp4', 'video/webm', 'audio/mpeg', 'application/pdf',
  'application/msword',
  'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
]
where id = 'materials';
