-- Duplicate remainder 1 made the old matching task impossible to finish.
begin;
update public.lesson_blocks b set configuration = jsonb_set(b.configuration, '{pairs}', '[[7,1],[8,2],[9,0]]'::jsonb)
from public.topics t where t.id = b.topic_id and t.title = 'Қарапайым периодтық есептер' and t.grade = 4 and t.track = 'logic'
and b.stage = 'bekit' and b.sort_order = 4 and b.block_type = 'matching'
and b.configuration->'pairs' = '[[7,1],[8,2],[9,0],[10,1]]'::jsonb;
commit;
