-- Additional reviewed tasks for the Grade 3 base topics. Run migrations in numeric order.

begin;

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '582 санында неше жүздік бар (жүздіктер цифрын жаз)?', '{}'::jsonb, 5
from public.topics tp where tp.title = '1000 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '582 санында неше жүздік бар (жүздіктер цифрын жаз)?', 'short_answer', '5'::jsonb, '582 = 500 + 80 + 2.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1000 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '704 санындағы ондықтар цифрын жаз.', '{}'::jsonb, 6
from public.topics tp where tp.title = '1000 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '704 санындағы ондықтар цифрын жаз.', 'short_answer', '0'::jsonb, '704 = 700 + 0 + 4.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1000 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '3 жүздік, 8 ондық, 6 бірліктен қандай сан құралады?', '{}'::jsonb, 7
from public.topics tp where tp.title = '1000 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 жүздік, 8 ондық, 6 бірліктен қандай сан құралады?', 'short_answer', '386'::jsonb, '300 + 80 + 6 = 386.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1000 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '921 санындағы бірліктер цифрын жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = '1000 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '921 санындағы бірліктер цифрын жаз.', 'short_answer', '1'::jsonb, '921 = 900 + 20 + 1.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1000 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '600 + 40 + 7 қосындысы қандай сан?', '{}'::jsonb, 9
from public.topics tp where tp.title = '1000 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '600 + 40 + 7 қосындысы қандай сан?', 'short_answer', '647'::jsonb, '6 жүздік, 4 ондық, 7 бірлік — 647.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1000 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '324 + 215 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Үш таңбалы сандарды қосу және азайту' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '324 + 215 неше?', 'short_answer', '539'::jsonb, '324 + 215 = 539.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үш таңбалы сандарды қосу және азайту' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '768 − 245 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Үш таңбалы сандарды қосу және азайту' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '768 − 245 неше?', 'short_answer', '523'::jsonb, '768 − 245 = 523.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үш таңбалы сандарды қосу және азайту' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '406 + 173 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Үш таңбалы сандарды қосу және азайту' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '406 + 173 неше?', 'short_answer', '579'::jsonb, '406 + 173 = 579.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үш таңбалы сандарды қосу және азайту' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '952 − 318 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Үш таңбалы сандарды қосу және азайту' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '952 − 318 неше?', 'short_answer', '634'::jsonb, '952 − 318 = 634.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үш таңбалы сандарды қосу және азайту' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '587 + 206 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Үш таңбалы сандарды қосу және азайту' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '587 + 206 неше?', 'short_answer', '793'::jsonb, '587 + 206 = 793.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үш таңбалы сандарды қосу және азайту' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Бағанмен есепте: 278 + 145.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қосу мен азайтудың жазбаша тәсілдері' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен есепте: 278 + 145.', 'short_answer', '423'::jsonb, 'Бірліктер: 8 + 5 = 13, ондыққа 1 ауысады; нәтиже 423.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың жазбаша тәсілдері' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Бағанмен есепте: 604 − 278.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қосу мен азайтудың жазбаша тәсілдері' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен есепте: 604 − 278.', 'short_answer', '326'::jsonb, '604 − 278 = 326, разрядтардан қайта топтаймыз.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың жазбаша тәсілдері' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Бағанмен есепте: 459 + 368.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қосу мен азайтудың жазбаша тәсілдері' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен есепте: 459 + 368.', 'short_answer', '827'::jsonb, '459 + 368 = 827.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың жазбаша тәсілдері' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Бағанмен есепте: 803 − 457.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қосу мен азайтудың жазбаша тәсілдері' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен есепте: 803 − 457.', 'short_answer', '346'::jsonb, '803 − 457 = 346.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың жазбаша тәсілдері' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Бағанмен есепте: 376 + 247.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қосу мен азайтудың жазбаша тәсілдері' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен есепте: 376 + 247.', 'short_answer', '623'::jsonb, '376 + 247 = 623.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың жазбаша тәсілдері' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '124 × 3 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Бір таңбалы санға көбейту және бөлу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '124 × 3 неше?', 'short_answer', '372'::jsonb, '124 × 3 = 372.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бір таңбалы санға көбейту және бөлу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '468 ÷ 3 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Бір таңбалы санға көбейту және бөлу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '468 ÷ 3 неше?', 'short_answer', '156'::jsonb, '156 × 3 = 468.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бір таңбалы санға көбейту және бөлу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '205 × 4 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Бір таңбалы санға көбейту және бөлу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '205 × 4 неше?', 'short_answer', '820'::jsonb, '205 × 4 = 820.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бір таңбалы санға көбейту және бөлу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '672 ÷ 4 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Бір таңбалы санға көбейту және бөлу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '672 ÷ 4 неше?', 'short_answer', '168'::jsonb, '168 × 4 = 672.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бір таңбалы санға көбейту және бөлу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '111 × 6 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Бір таңбалы санға көбейту және бөлу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '111 × 6 неше?', 'short_answer', '666'::jsonb, '111 × 6 = 666.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бір таңбалы санға көбейту және бөлу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '24 × 3 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Екі таңбалы санды бір таңбалы санға көбейту' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '24 × 3 неше?', 'short_answer', '72'::jsonb, '20 × 3 + 4 × 3 = 72.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі таңбалы санды бір таңбалы санға көбейту' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '37 × 2 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Екі таңбалы санды бір таңбалы санға көбейту' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '37 × 2 неше?', 'short_answer', '74'::jsonb, '30 × 2 + 7 × 2 = 74.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі таңбалы санды бір таңбалы санға көбейту' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '46 × 4 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Екі таңбалы санды бір таңбалы санға көбейту' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '46 × 4 неше?', 'short_answer', '184'::jsonb, '40 × 4 + 6 × 4 = 184.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі таңбалы санды бір таңбалы санға көбейту' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '58 × 3 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Екі таңбалы санды бір таңбалы санға көбейту' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '58 × 3 неше?', 'short_answer', '174'::jsonb, '50 × 3 + 8 × 3 = 174.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі таңбалы санды бір таңбалы санға көбейту' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '19 × 5 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Екі таңбалы санды бір таңбалы санға көбейту' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '19 × 5 неше?', 'short_answer', '95'::jsonb, '10 × 5 + 9 × 5 = 95.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі таңбалы санды бір таңбалы санға көбейту' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '84 ÷ 4 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Екі таңбалы санды бір таңбалы санға бөлу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '84 ÷ 4 неше?', 'short_answer', '21'::jsonb, '21 × 4 = 84.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі таңбалы санды бір таңбалы санға бөлу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '75 ÷ 3 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Екі таңбалы санды бір таңбалы санға бөлу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '75 ÷ 3 неше?', 'short_answer', '25'::jsonb, '25 × 3 = 75.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі таңбалы санды бір таңбалы санға бөлу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '96 ÷ 6 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Екі таңбалы санды бір таңбалы санға бөлу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '96 ÷ 6 неше?', 'short_answer', '16'::jsonb, '16 × 6 = 96.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі таңбалы санды бір таңбалы санға бөлу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '62-ні 5-ке бөлгендегі қалдықты жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Екі таңбалы санды бір таңбалы санға бөлу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '62-ні 5-ке бөлгендегі қалдықты жаз.', 'short_answer', '2'::jsonb, '62 = 5 × 12 + 2.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі таңбалы санды бір таңбалы санға бөлу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '79-ды 4-ке бөлгендегі қалдықты жаз.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Екі таңбалы санды бір таңбалы санға бөлу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '79-ды 4-ке бөлгендегі қалдықты жаз.', 'short_answer', '3'::jsonb, '79 = 4 × 19 + 3.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі таңбалы санды бір таңбалы санға бөлу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '7 × 9 неше? Көбейткіштердің орнын ауыстырып тексер.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Көбейту мен бөлудің қасиеттері' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '7 × 9 неше? Көбейткіштердің орнын ауыстырып тексер.', 'short_answer', '63'::jsonb, '7 × 9 = 9 × 7 = 63.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту мен бөлудің қасиеттері' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '(20 + 3) × 4 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Көбейту мен бөлудің қасиеттері' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '(20 + 3) × 4 неше?', 'short_answer', '92'::jsonb, '20 × 4 + 3 × 4 = 80 + 12 = 92.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту мен бөлудің қасиеттері' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '6 × (10 + 5) неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Көбейту мен бөлудің қасиеттері' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6 × (10 + 5) неше?', 'short_answer', '90'::jsonb, '6 × 10 + 6 × 5 = 90.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту мен бөлудің қасиеттері' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '48 ÷ 6 неше? Көбейтумен тексер.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Көбейту мен бөлудің қасиеттері' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '48 ÷ 6 неше? Көбейтумен тексер.', 'short_answer', '8'::jsonb, '8 × 6 = 48.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту мен бөлудің қасиеттері' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '3 × (7 + 2) неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Көбейту мен бөлудің қасиеттері' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 × (7 + 2) неше?', 'short_answer', '27'::jsonb, '3 × 7 + 3 × 2 = 27.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту мен бөлудің қасиеттері' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '(8 + 5) × 3 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Амалдардың орындалу реті' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '(8 + 5) × 3 неше?', 'short_answer', '39'::jsonb, 'Алдымен жақшаның іші: 13 × 3 = 39.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Амалдардың орындалу реті' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '40 − (12 + 9) неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Амалдардың орындалу реті' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '40 − (12 + 9) неше?', 'short_answer', '19'::jsonb, '12 + 9 = 21; 40 − 21 = 19.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Амалдардың орындалу реті' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '(24 ÷ 6) + 17 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Амалдардың орындалу реті' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '(24 ÷ 6) + 17 неше?', 'short_answer', '21'::jsonb, '24 ÷ 6 = 4; 4 + 17 = 21.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Амалдардың орындалу реті' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '6 × (15 − 8) неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Амалдардың орындалу реті' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6 × (15 − 8) неше?', 'short_answer', '42'::jsonb, '15 − 8 = 7; 6 × 7 = 42.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Амалдардың орындалу реті' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '(18 + 6) ÷ 4 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Амалдардың орындалу реті' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '(18 + 6) ÷ 4 неше?', 'short_answer', '6'::jsonb, '18 + 6 = 24; 24 ÷ 4 = 6.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Амалдардың орындалу реті' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '27 + 35 + 13 неше? 27 мен 13-ті топтастыр.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Өрнектерді тиімді тәсілмен есептеу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '27 + 35 + 13 неше? 27 мен 13-ті топтастыр.', 'short_answer', '75'::jsonb, '27 + 13 = 40; 40 + 35 = 75.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектерді тиімді тәсілмен есептеу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '48 + 19 + 2 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Өрнектерді тиімді тәсілмен есептеу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '48 + 19 + 2 неше?', 'short_answer', '69'::jsonb, '48 + 2 = 50; 50 + 19 = 69.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектерді тиімді тәсілмен есептеу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '125 + 37 + 75 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Өрнектерді тиімді тәсілмен есептеу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '125 + 37 + 75 неше?', 'short_answer', '237'::jsonb, '125 + 75 = 200; 200 + 37 = 237.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектерді тиімді тәсілмен есептеу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '64 + 28 + 36 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Өрнектерді тиімді тәсілмен есептеу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '64 + 28 + 36 неше?', 'short_answer', '128'::jsonb, '64 + 36 = 100; 100 + 28 = 128.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектерді тиімді тәсілмен есептеу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '99 + 46 + 1 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Өрнектерді тиімді тәсілмен есептеу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '99 + 46 + 1 неше?', 'short_answer', '146'::jsonb, '99 + 1 = 100; 100 + 46 = 146.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектерді тиімді тәсілмен есептеу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'x + 38 = 92. x-ті тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Белгісіз компоненттерді табу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x + 38 = 92. x-ті тап.', 'short_answer', '54'::jsonb, '92 − 38 = 54.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз компоненттерді табу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'x − 47 = 25. x-ті тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Белгісіз компоненттерді табу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x − 47 = 25. x-ті тап.', 'short_answer', '72'::jsonb, '25 + 47 = 72.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз компоненттерді табу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '8 × x = 96. x-ті тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Белгісіз компоненттерді табу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '8 × x = 96. x-ті тап.', 'short_answer', '12'::jsonb, '96 ÷ 8 = 12.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз компоненттерді табу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'x ÷ 6 = 14. x-ті тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Белгісіз компоненттерді табу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x ÷ 6 = 14. x-ті тап.', 'short_answer', '84'::jsonb, '14 × 6 = 84.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз компоненттерді табу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '91 − x = 58. x-ті тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Белгісіз компоненттерді табу' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '91 − x = 58. x-ті тап.', 'short_answer', '33'::jsonb, '91 − 58 = 33.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз компоненттерді табу' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '3 қорапта 8 кітаптан бар. 5 кітапты берді. Неше кітап қалды?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Екі-үш амалмен шығарылатын мәтінді есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 қорапта 8 кітаптан бар. 5 кітапты берді. Неше кітап қалды?', 'short_answer', '19'::jsonb, '3 × 8 − 5 = 19.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі-үш амалмен шығарылатын мәтінді есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Дүкенге 40 алма әкелді, 12-сін сатты, кейін 9 алма әкелді. Қазір неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Екі-үш амалмен шығарылатын мәтінді есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Дүкенге 40 алма әкелді, 12-сін сатты, кейін 9 алма әкелді. Қазір неше?', 'short_answer', '37'::jsonb, '40 − 12 + 9 = 37.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі-үш амалмен шығарылатын мәтінді есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Әр қатарда 7 гүлден, 4 қатар бар. Тағы 6 гүл егілді. Барлығы неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Екі-үш амалмен шығарылатын мәтінді есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Әр қатарда 7 гүлден, 4 қатар бар. Тағы 6 гүл егілді. Барлығы неше?', 'short_answer', '34'::jsonb, '4 × 7 + 6 = 34.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі-үш амалмен шығарылатын мәтінді есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '30 оқушының 6-уы кетті, қалғандары 3 топқа тең бөлінді. Әр топта неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Екі-үш амалмен шығарылатын мәтінді есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '30 оқушының 6-уы кетті, қалғандары 3 топқа тең бөлінді. Әр топта неше?', 'short_answer', '8'::jsonb, '(30 − 6) ÷ 3 = 8.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі-үш амалмен шығарылатын мәтінді есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '5 қорапта 9 қарындаштан бар, 8 қарындаш берілді. Неше қалды?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Екі-үш амалмен шығарылатын мәтінді есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5 қорапта 9 қарындаштан бар, 8 қарындаш берілді. Неше қалды?', 'short_answer', '37'::jsonb, '5 × 9 − 8 = 37.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі-үш амалмен шығарылатын мәтінді есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Велосипедші сағатына 12 км жүрді. 3 сағатта неше км жүреді?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қозғалысқа байланысты қарапайым есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Велосипедші сағатына 12 км жүрді. 3 сағатта неше км жүреді?', 'short_answer', '36'::jsonb, '12 × 3 = 36 км.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа байланысты қарапайым есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Жаяу жүргінші 20 км жолды 4 сағатта жүрді. Жылдамдығы неше км/сағ?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қозғалысқа байланысты қарапайым есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Жаяу жүргінші 20 км жолды 4 сағатта жүрді. Жылдамдығы неше км/сағ?', 'short_answer', '5'::jsonb, '20 ÷ 4 = 5 км/сағ.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа байланысты қарапайым есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Автобус 40 км/сағ жылдамдықпен 2 сағат жүрді. Қанша км өтті?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қозғалысқа байланысты қарапайым есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Автобус 40 км/сағ жылдамдықпен 2 сағат жүрді. Қанша км өтті?', 'short_answer', '80'::jsonb, '40 × 2 = 80 км.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа байланысты қарапайым есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '30 км жолды 10 км/сағ жылдамдықпен неше сағатта өтеді?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қозғалысқа байланысты қарапайым есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '30 км жолды 10 км/сағ жылдамдықпен неше сағатта өтеді?', 'short_answer', '3'::jsonb, '30 ÷ 10 = 3 сағат.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа байланысты қарапайым есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Екі сағат бойы 8 км/сағ жылдамдықпен жүрген бала қанша км өтеді?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қозғалысқа байланысты қарапайым есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Екі сағат бойы 8 км/сағ жылдамдықпен жүрген бала қанша км өтеді?', 'short_answer', '16'::jsonb, '8 × 2 = 16 км.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа байланысты қарапайым есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '3 м неше см?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Бірлік шамалар және шамалардың арасындағы байланыс' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 м неше см?', 'short_answer', '300'::jsonb, '3 × 100 = 300 см.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бірлік шамалар және шамалардың арасындағы байланыс' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '2 кг неше грамм?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Бірлік шамалар және шамалардың арасындағы байланыс' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 кг неше грамм?', 'short_answer', '2000'::jsonb, '2 × 1000 = 2000 г.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бірлік шамалар және шамалардың арасындағы байланыс' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '2 сағат 15 минут барлығы неше минут?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Бірлік шамалар және шамалардың арасындағы байланыс' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 сағат 15 минут барлығы неше минут?', 'short_answer', '135'::jsonb, '120 + 15 = 135 минут.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бірлік шамалар және шамалардың арасындағы байланыс' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '4 м 20 см барлығы неше см?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Бірлік шамалар және шамалардың арасындағы байланыс' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 м 20 см барлығы неше см?', 'short_answer', '420'::jsonb, '400 + 20 = 420 см.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бірлік шамалар және шамалардың арасындағы байланыс' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '1 сағат пен 45 минут барлығы неше минут?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Бірлік шамалар және шамалардың арасындағы байланыс' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1 сағат пен 45 минут барлығы неше минут?', 'short_answer', '105'::jsonb, '60 + 45 = 105 минут.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бірлік шамалар және шамалардың арасындағы байланыс' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Ұзындығы 5 см, ені 3 см тіктөртбұрыштың периметрі неше см?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Периметр және фигураның ауданын түсіну' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ұзындығы 5 см, ені 3 см тіктөртбұрыштың периметрі неше см?', 'short_answer', '16'::jsonb, '5 + 3 + 5 + 3 = 16 см.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Периметр және фигураның ауданын түсіну' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Ұзындығы 5 см, ені 3 см тіктөртбұрыштың ауданы неше см²?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Периметр және фигураның ауданын түсіну' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ұзындығы 5 см, ені 3 см тіктөртбұрыштың ауданы неше см²?', 'short_answer', '15'::jsonb, '5 × 3 = 15 см².', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Периметр және фигураның ауданын түсіну' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Қабырғасы 4 см шаршының периметрі неше см?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Периметр және фигураның ауданын түсіну' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қабырғасы 4 см шаршының периметрі неше см?', 'short_answer', '16'::jsonb, '4 × 4 = 16 см.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Периметр және фигураның ауданын түсіну' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Қабырғасы 4 см шаршының ауданы неше см²?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Периметр және фигураның ауданын түсіну' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қабырғасы 4 см шаршының ауданы неше см²?', 'short_answer', '16'::jsonb, '4 × 4 = 16 см².', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Периметр және фигураның ауданын түсіну' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Ұзындығы 8 см, ені 2 см тіктөртбұрыштың ауданы неше см²?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Периметр және фигураның ауданын түсіну' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ұзындығы 8 см, ені 2 см тіктөртбұрыштың ауданы неше см²?', 'short_answer', '16'::jsonb, '8 × 2 = 16 см².', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Периметр және фигураның ауданын түсіну' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Екі санның қосындысы 10. Біріншісі 4 болса, екіншісі неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Логикалық және бірнеше шешімі бар есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Екі санның қосындысы 10. Біріншісі 4 болса, екіншісі неше?', 'short_answer', '6'::jsonb, '10 − 4 = 6.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Логикалық және бірнеше шешімі бар есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '2, 4, 6 сандарының бірін таңдап, оған 4 қосқанда 10 шығады. Қай сан?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Логикалық және бірнеше шешімі бар есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2, 4, 6 сандарының бірін таңдап, оған 4 қосқанда 10 шығады. Қай сан?', 'short_answer', '6'::jsonb, '6 + 4 = 10.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Логикалық және бірнеше шешімі бар есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '3, 5, 7 сандарының қайсысына 5 қоссаң, 12 шығады?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Логикалық және бірнеше шешімі бар есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3, 5, 7 сандарының қайсысына 5 қоссаң, 12 шығады?', 'short_answer', '7'::jsonb, '7 + 5 = 12.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Логикалық және бірнеше шешімі бар есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', 'Екі санның көбейтіндісі 24. Бір сан 6 болса, екіншісі неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Логикалық және бірнеше шешімі бар есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Екі санның көбейтіндісі 24. Бір сан 6 болса, екіншісі неше?', 'short_answer', '4'::jsonb, '24 ÷ 6 = 4.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Логикалық және бірнеше шешімі бар есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Шешімін тап', '10 алу үшін 2, 3, 4, 5, 6 сандарының ішінен әр түрлі қай екі санды қосуға болады? Кішісін жаз.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Логикалық және бірнеше шешімі бар есептер' and tp.grade = 3 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '10 алу үшін 2, 3, 4, 5, 6 сандарының ішінен әр түрлі қай екі санды қосуға болады? Кішісін жаз.', 'short_answer', '4'::jsonb, '4 + 6 = 10; таңдалған екі сан әр түрлі.', 'Тиісті амалды анықтап, шешуіңді тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Логикалық және бірнеше шешімі бар есептер' and tp.grade = 3 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

commit;

