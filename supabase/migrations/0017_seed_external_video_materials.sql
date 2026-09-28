-- Talpyn: external YouTube and Google Drive videos linked to their lessons.
-- Safe to run more than once: an existing URL is not inserted again.
with video_materials (grade, track, topic_title, material_title, url) as (
  values
    (1, 'logic'::public.track, '1–10 көлеміндегі сандар', '7 саны',
      'https://drive.google.com/file/d/1uOKHefWYrBRjJCxrGD4H9jOruuZ3q0ZP/view?usp=drivesdk'),
    (1, 'logic'::public.track, '1–10 көлеміндегі сандар', '6 саны',
      'https://drive.google.com/file/d/1wgFrPznMkRxwQ6tSdaLczznTnB0t1dLB/view?usp=drivesdk'),
    (3, 'logic'::public.track, 'Мәтін есептер', 'Мәтін есептер — бейнетүсіндіру',
      'https://youtube.com/shorts/EG99aJHnb8c?si=PZbU8HJD8wCZVPFh'),
    (3, 'logic'::public.track, 'Жорамалдау тәсілі', 'Жорамалдау тәсілі — бейнетүсіндіру',
      'https://youtube.com/shorts/UiAS6EXwnis?si=jXZGfVET2IrTHF4n'),
    (4, 'logic'::public.track, 'Қозғалысқа берілген есептер', 'Қозғалысқа берілген есептер — 1-бейне',
      'https://youtube.com/shorts/yaA58Am1-Yo?feature=shared'),
    (4, 'logic'::public.track, 'Қозғалысқа берілген есептер', 'Қозғалысқа берілген есептер — 2-бейне',
      'https://youtube.com/shorts/7THDZN1E01w?si=puaEJwiPuOWzvPug')
)
insert into public.materials
  (topic_id, title, type, file_url, file_path, file_size, mime_type, uploaded_by)
select
  t.id,
  vm.material_title,
  'video'::public.material_type,
  vm.url,
  'external:' || vm.url,
  null,
  'text/uri-list',
  null
from video_materials vm
join public.topics t
  on t.grade = vm.grade
 and t.track = vm.track
 and t.title = vm.topic_title
where not exists (
  select 1 from public.materials m where m.file_url = vm.url
);
