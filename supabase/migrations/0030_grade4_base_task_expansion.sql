-- Additional reviewed tasks for the Grade 4 base topics. Run migrations in numeric order.

begin;

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '«Жиырма үш мың төрт жүз бес» санын цифрмен жаз.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Көптаңбалы сандарды оқу, жазу және салыстыру' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '«Жиырма үш мың төрт жүз бес» санын цифрмен жаз.', 'short_answer', '23405'::jsonb, '23 мың + 405 = 23405.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды оқу, жазу және салыстыру' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '47021 мен 47201 сандарының үлкенін жаз.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Көптаңбалы сандарды оқу, жазу және салыстыру' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '47021 мен 47201 сандарының үлкенін жаз.', 'short_answer', '47201'::jsonb, 'Жүздіктер разрядында 2 > 0.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды оқу, жазу және салыстыру' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '«Алты жүз бес мың он» санын цифрмен жаз.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Көптаңбалы сандарды оқу, жазу және салыстыру' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '«Алты жүз бес мың он» санын цифрмен жаз.', 'short_answer', '605010'::jsonb, '605 мың + 10 = 605010.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды оқу, жазу және салыстыру' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '899999 бен 900001 сандарының кішісін жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Көптаңбалы сандарды оқу, жазу және салыстыру' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '899999 бен 900001 сандарының кішісін жаз.', 'short_answer', '899999'::jsonb, '899999 < 900001.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды оқу, жазу және салыстыру' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '350400 мен 350040 сандарының үлкенін жаз.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Көптаңбалы сандарды оқу, жазу және салыстыру' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '350400 мен 350040 сандарының үлкенін жаз.', 'short_answer', '350400'::jsonb, '350400 > 350040.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды оқу, жазу және салыстыру' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '48256 санындағы мыңдықтар цифрын жаз.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Көптаңбалы сандардың разрядтық құрамы' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '48256 санындағы мыңдықтар цифрын жаз.', 'short_answer', '8'::jsonb, '48256 = 40000 + 8000 + 200 + 50 + 6.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандардың разрядтық құрамы' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '607309 санындағы ондықтар цифрын жаз.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Көптаңбалы сандардың разрядтық құрамы' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '607309 санындағы ондықтар цифрын жаз.', 'short_answer', '0'::jsonb, '607309 санының ондықтар разрядында 0 тұр.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандардың разрядтық құрамы' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '5 он мыңдық, 3 мыңдық, 2 жүздік және 7 бірліктен қандай сан құралады?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Көптаңбалы сандардың разрядтық құрамы' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5 он мыңдық, 3 мыңдық, 2 жүздік және 7 бірліктен қандай сан құралады?', 'short_answer', '53207'::jsonb, '50000 + 3000 + 200 + 7 = 53207.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандардың разрядтық құрамы' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '98041 санындағы жүздіктер цифрын жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Көптаңбалы сандардың разрядтық құрамы' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '98041 санындағы жүздіктер цифрын жаз.', 'short_answer', '0'::jsonb, '98041 санында жүздіктер разрядында 0 тұр.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандардың разрядтық құрамы' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '70000 + 4000 + 300 + 20 + 8 қосындысын жаз.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Көптаңбалы сандардың разрядтық құрамы' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '70000 + 4000 + 300 + 20 + 8 қосындысын жаз.', 'short_answer', '74328'::jsonb, 'Разрядтардан 74328 құралады.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандардың разрядтық құрамы' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бағанмен қос: 12435 + 23064.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Көптаңбалы сандарды жазбаша қосу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен қос: 12435 + 23064.', 'short_answer', '35499'::jsonb, '12435 + 23064 = 35499.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды жазбаша қосу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бағанмен қос: 48726 + 15238.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Көптаңбалы сандарды жазбаша қосу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен қос: 48726 + 15238.', 'short_answer', '63964'::jsonb, '48726 + 15238 = 63964.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды жазбаша қосу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бағанмен қос: 30507 + 6948.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Көптаңбалы сандарды жазбаша қосу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен қос: 30507 + 6948.', 'short_answer', '37455'::jsonb, '30507 + 6948 = 37455.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды жазбаша қосу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бағанмен қос: 76549 + 12876.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Көптаңбалы сандарды жазбаша қосу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен қос: 76549 + 12876.', 'short_answer', '89425'::jsonb, '76549 + 12876 = 89425.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды жазбаша қосу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бағанмен қос: 58430 + 17625.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Көптаңбалы сандарды жазбаша қосу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен қос: 58430 + 17625.', 'short_answer', '76055'::jsonb, '58430 + 17625 = 76055.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды жазбаша қосу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бағанмен азайт: 54032 − 21817.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Көптаңбалы сандарды жазбаша азайту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен азайт: 54032 − 21817.', 'short_answer', '32215'::jsonb, '54032 − 21817 = 32215.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды жазбаша азайту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бағанмен азайт: 80004 − 36579.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Көптаңбалы сандарды жазбаша азайту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен азайт: 80004 − 36579.', 'short_answer', '43425'::jsonb, '80004 − 36579 = 43425.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды жазбаша азайту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бағанмен азайт: 97563 − 42816.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Көптаңбалы сандарды жазбаша азайту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен азайт: 97563 − 42816.', 'short_answer', '54747'::jsonb, '97563 − 42816 = 54747.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды жазбаша азайту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бағанмен азайт: 60320 − 19458.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Көптаңбалы сандарды жазбаша азайту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен азайт: 60320 − 19458.', 'short_answer', '40862'::jsonb, '60320 − 19458 = 40862.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды жазбаша азайту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бағанмен азайт: 72105 − 38764.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Көптаңбалы сандарды жазбаша азайту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бағанмен азайт: 72105 − 38764.', 'short_answer', '33341'::jsonb, '72105 − 38764 = 33341.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы сандарды жазбаша азайту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '1234 × 3 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Көптаңбалы санды бір таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1234 × 3 неше?', 'short_answer', '3702'::jsonb, '1234 × 3 = 3702.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды бір таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '2405 × 4 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Көптаңбалы санды бір таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2405 × 4 неше?', 'short_answer', '9620'::jsonb, '2405 × 4 = 9620.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды бір таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '3562 × 2 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Көптаңбалы санды бір таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3562 × 2 неше?', 'short_answer', '7124'::jsonb, '3562 × 2 = 7124.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды бір таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '4073 × 5 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Көптаңбалы санды бір таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4073 × 5 неше?', 'short_answer', '20365'::jsonb, '4073 × 5 = 20365.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды бір таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '6128 × 3 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Көптаңбалы санды бір таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6128 × 3 неше?', 'short_answer', '18384'::jsonb, '6128 × 3 = 18384.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды бір таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '123 × 12 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Көптаңбалы санды екі таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '123 × 12 неше?', 'short_answer', '1476'::jsonb, '123 × (10 + 2) = 1230 + 246 = 1476.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды екі таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '245 × 14 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Көптаңбалы санды екі таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '245 × 14 неше?', 'short_answer', '3430'::jsonb, '245 × (10 + 4) = 2450 + 980 = 3430.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды екі таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '316 × 21 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Көптаңбалы санды екі таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '316 × 21 неше?', 'short_answer', '6636'::jsonb, '316 × (20 + 1) = 6320 + 316 = 6636.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды екі таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '408 × 15 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Көптаңбалы санды екі таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '408 × 15 неше?', 'short_answer', '6120'::jsonb, '408 × (10 + 5) = 4080 + 2040 = 6120.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды екі таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '512 × 11 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Көптаңбалы санды екі таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '512 × 11 неше?', 'short_answer', '5632'::jsonb, '512 × (10 + 1) = 5120 + 512 = 5632.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды екі таңбалы санға көбейту' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '864 ÷ 4 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Көптаңбалы санды бір және екі таңбалы санға бөлу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '864 ÷ 4 неше?', 'short_answer', '216'::jsonb, '216 × 4 = 864.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды бір және екі таңбалы санға бөлу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '1248 ÷ 6 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Көптаңбалы санды бір және екі таңбалы санға бөлу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1248 ÷ 6 неше?', 'short_answer', '208'::jsonb, '208 × 6 = 1248.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды бір және екі таңбалы санға бөлу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '1440 ÷ 12 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Көптаңбалы санды бір және екі таңбалы санға бөлу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1440 ÷ 12 неше?', 'short_answer', '120'::jsonb, '120 × 12 = 1440.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды бір және екі таңбалы санға бөлу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '1575 ÷ 15 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Көптаңбалы санды бір және екі таңбалы санға бөлу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1575 ÷ 15 неше?', 'short_answer', '105'::jsonb, '105 × 15 = 1575.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды бір және екі таңбалы санға бөлу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '2016 ÷ 24 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Көптаңбалы санды бір және екі таңбалы санға бөлу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2016 ÷ 24 неше?', 'short_answer', '84'::jsonb, '84 × 24 = 2016.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көптаңбалы санды бір және екі таңбалы санға бөлу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '37-ні 5-ке бөлгендегі қалдықты жаз.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қалдықпен бөлу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '37-ні 5-ке бөлгендегі қалдықты жаз.', 'short_answer', '2'::jsonb, '37 = 5 × 7 + 2.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қалдықпен бөлу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '58-ді 9-ға бөлгендегі қалдықты жаз.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қалдықпен бөлу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '58-ді 9-ға бөлгендегі қалдықты жаз.', 'short_answer', '4'::jsonb, '58 = 9 × 6 + 4.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қалдықпен бөлу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '73-ті 8-ге бөлгендегі қалдықты жаз.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қалдықпен бөлу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '73-ті 8-ге бөлгендегі қалдықты жаз.', 'short_answer', '1'::jsonb, '73 = 8 × 9 + 1.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қалдықпен бөлу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '95-ті 6-ға бөлгендегі қалдықты жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қалдықпен бөлу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '95-ті 6-ға бөлгендегі қалдықты жаз.', 'short_answer', '5'::jsonb, '95 = 6 × 15 + 5.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қалдықпен бөлу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '104-ті 7-ге бөлгендегі қалдықты жаз.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қалдықпен бөлу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '104-ті 7-ге бөлгендегі қалдықты жаз.', 'short_answer', '6'::jsonb, '104 = 7 × 14 + 6.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қалдықпен бөлу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '(18 + 12) ÷ (7 − 2) неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Амалдардың орындалу реті және жақшалы өрнектер' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '(18 + 12) ÷ (7 − 2) неше?', 'short_answer', '6'::jsonb, '30 ÷ 5 = 6.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Амалдардың орындалу реті және жақшалы өрнектер' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '5 × (16 − 9) + 8 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Амалдардың орындалу реті және жақшалы өрнектер' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5 × (16 − 9) + 8 неше?', 'short_answer', '43'::jsonb, '5 × 7 + 8 = 43.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Амалдардың орындалу реті және жақшалы өрнектер' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '72 ÷ (3 + 5) + 4 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Амалдардың орындалу реті және жақшалы өрнектер' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '72 ÷ (3 + 5) + 4 неше?', 'short_answer', '13'::jsonb, '72 ÷ 8 + 4 = 13.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Амалдардың орындалу реті және жақшалы өрнектер' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '(40 − 16) ÷ 6 × 3 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Амалдардың орындалу реті және жақшалы өрнектер' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '(40 − 16) ÷ 6 × 3 неше?', 'short_answer', '12'::jsonb, '24 ÷ 6 × 3 = 12.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Амалдардың орындалу реті және жақшалы өрнектер' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '100 − (6 × 8 + 12) неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Амалдардың орындалу реті және жақшалы өрнектер' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '100 − (6 × 8 + 12) неше?', 'short_answer', '40'::jsonb, '100 − (48 + 12) = 40.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Амалдардың орындалу реті және жақшалы өрнектер' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '3 × x + 7 = 31. x-ті тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Теңдеу және күрделі теңдеулерді шешу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 × x + 7 = 31. x-ті тап.', 'short_answer', '8'::jsonb, '(31 − 7) ÷ 3 = 8.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Теңдеу және күрделі теңдеулерді шешу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '(x − 9) × 4 = 28. x-ті тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Теңдеу және күрделі теңдеулерді шешу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '(x − 9) × 4 = 28. x-ті тап.', 'short_answer', '16'::jsonb, '28 ÷ 4 + 9 = 16.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Теңдеу және күрделі теңдеулерді шешу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'x ÷ 5 + 11 = 20. x-ті тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Теңдеу және күрделі теңдеулерді шешу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x ÷ 5 + 11 = 20. x-ті тап.', 'short_answer', '45'::jsonb, '(20 − 11) × 5 = 45.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Теңдеу және күрделі теңдеулерді шешу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '72 − 2 × x = 30. x-ті тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Теңдеу және күрделі теңдеулерді шешу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '72 − 2 × x = 30. x-ті тап.', 'short_answer', '21'::jsonb, '(72 − 30) ÷ 2 = 21.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Теңдеу және күрделі теңдеулерді шешу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '(x + 6) ÷ 3 = 12. x-ті тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Теңдеу және күрделі теңдеулерді шешу' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '(x + 6) ÷ 3 = 12. x-ті тап.', 'short_answer', '30'::jsonb, '12 × 3 − 6 = 30.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Теңдеу және күрделі теңдеулерді шешу' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '60 км/сағ жылдамдықпен 3 сағатта неше км жүреді?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қозғалысқа байланысты есептер: жылдамдық, уақыт, қашықтық' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '60 км/сағ жылдамдықпен 3 сағатта неше км жүреді?', 'short_answer', '180'::jsonb, '60 × 3 = 180 км.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа байланысты есептер: жылдамдық, уақыт, қашықтық' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '150 км-ді 3 сағатта жүрген көліктің жылдамдығы неше км/сағ?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қозғалысқа байланысты есептер: жылдамдық, уақыт, қашықтық' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '150 км-ді 3 сағатта жүрген көліктің жылдамдығы неше км/сағ?', 'short_answer', '50'::jsonb, '150 ÷ 3 = 50 км/сағ.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа байланысты есептер: жылдамдық, уақыт, қашықтық' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '240 км-ді 80 км/сағ жылдамдықпен неше сағатта өтеді?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қозғалысқа байланысты есептер: жылдамдық, уақыт, қашықтық' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '240 км-ді 80 км/сағ жылдамдықпен неше сағатта өтеді?', 'short_answer', '3'::jsonb, '240 ÷ 80 = 3 сағат.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа байланысты есептер: жылдамдық, уақыт, қашықтық' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Жаяу жүргінші 5 км/сағ жылдамдықпен 4 сағат жүрді. Неше км өтті?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қозғалысқа байланысты есептер: жылдамдық, уақыт, қашықтық' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Жаяу жүргінші 5 км/сағ жылдамдықпен 4 сағат жүрді. Неше км өтті?', 'short_answer', '20'::jsonb, '5 × 4 = 20 км.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа байланысты есептер: жылдамдық, уақыт, қашықтық' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Автобус 90 км/сағ жылдамдықпен 2 сағат жүрді. Неше км өтті?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қозғалысқа байланысты есептер: жылдамдық, уақыт, қашықтық' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Автобус 90 км/сағ жылдамдықпен 2 сағат жүрді. Неше км өтті?', 'short_answer', '180'::jsonb, '90 × 2 = 180 км.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа байланысты есептер: жылдамдық, уақыт, қашықтық' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бір дәптер 80 теңге тұрады. 5 дәптердің құны неше теңге?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Бірнеше шаманың арасындағы тәуелділік' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бір дәптер 80 теңге тұрады. 5 дәптердің құны неше теңге?', 'short_answer', '400'::jsonb, '80 × 5 = 400 теңге.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бірнеше шаманың арасындағы тәуелділік' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '4 кітаптың құны 1200 теңге. Бір кітаптың бағасы неше теңге?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Бірнеше шаманың арасындағы тәуелділік' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 кітаптың құны 1200 теңге. Бір кітаптың бағасы неше теңге?', 'short_answer', '300'::jsonb, '1200 ÷ 4 = 300 теңге.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бірнеше шаманың арасындағы тәуелділік' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бір қалам 150 теңге. 900 теңгеге неше қалам алуға болады?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Бірнеше шаманың арасындағы тәуелділік' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бір қалам 150 теңге. 900 теңгеге неше қалам алуға болады?', 'short_answer', '6'::jsonb, '900 ÷ 150 = 6 қалам.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бірнеше шаманың арасындағы тәуелділік' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '3 қарындаштың әрқайсысы 70 теңге. Жалпы құны неше теңге?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Бірнеше шаманың арасындағы тәуелділік' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 қарындаштың әрқайсысы 70 теңге. Жалпы құны неше теңге?', 'short_answer', '210'::jsonb, '3 × 70 = 210 теңге.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бірнеше шаманың арасындағы тәуелділік' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '6 дәптерге 540 теңге төленді. Бір дәптер неше теңге?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Бірнеше шаманың арасындағы тәуелділік' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6 дәптерге 540 теңге төленді. Бір дәптер неше теңге?', 'short_answer', '90'::jsonb, '540 ÷ 6 = 90 теңге.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бірнеше шаманың арасындағы тәуелділік' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бірдей бөлімді 3/8 және 5/8 бөлшектерінің үлкенінің алымын жаз.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Бөлшек ұғымы және бөлшектерді салыстыру' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бірдей бөлімді 3/8 және 5/8 бөлшектерінің үлкенінің алымын жаз.', 'short_answer', '5'::jsonb, 'Бөлімдері тең: 5 > 3.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бөлшек ұғымы және бөлшектерді салыстыру' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '1/4 бөлшегінің бөлімін жаз.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Бөлшек ұғымы және бөлшектерді салыстыру' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1/4 бөлшегінің бөлімін жаз.', 'short_answer', '4'::jsonb, 'Бөлшек сызығының астындағы сан — бөлім.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бөлшек ұғымы және бөлшектерді салыстыру' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '7/10 бөлшегінің алымын жаз.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Бөлшек ұғымы және бөлшектерді салыстыру' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '7/10 бөлшегінің алымын жаз.', 'short_answer', '7'::jsonb, 'Сызықтың үстіндегі сан — алым.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бөлшек ұғымы және бөлшектерді салыстыру' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бірдей бөлімді 2/6 және 4/6 бөлшектерінің кішісінің алымын жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Бөлшек ұғымы және бөлшектерді салыстыру' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бірдей бөлімді 2/6 және 4/6 бөлшектерінің кішісінің алымын жаз.', 'short_answer', '2'::jsonb, '2 < 4, сондықтан 2/6 кіші.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бөлшек ұғымы және бөлшектерді салыстыру' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Торт 8 тең бөлікке бөлінді. Оның жартысы неше бөлік?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Бөлшек ұғымы және бөлшектерді салыстыру' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Торт 8 тең бөлікке бөлінді. Оның жартысы неше бөлік?', 'short_answer', '4'::jsonb, '8 ÷ 2 = 4 бөлік.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Бөлшек ұғымы және бөлшектерді салыстыру' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Ұзындығы 8 см, ені 3 см тіктөртбұрыштың периметрі неше см?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Тік төртбұрыш пен шаршының ауданы және периметрі' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ұзындығы 8 см, ені 3 см тіктөртбұрыштың периметрі неше см?', 'short_answer', '22'::jsonb, '2 × (8 + 3) = 22 см.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тік төртбұрыш пен шаршының ауданы және периметрі' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Ұзындығы 8 см, ені 3 см тіктөртбұрыштың ауданы неше см²?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Тік төртбұрыш пен шаршының ауданы және периметрі' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ұзындығы 8 см, ені 3 см тіктөртбұрыштың ауданы неше см²?', 'short_answer', '24'::jsonb, '8 × 3 = 24 см².', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тік төртбұрыш пен шаршының ауданы және периметрі' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Қабырғасы 6 см шаршының периметрі неше см?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Тік төртбұрыш пен шаршының ауданы және периметрі' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қабырғасы 6 см шаршының периметрі неше см?', 'short_answer', '24'::jsonb, '4 × 6 = 24 см.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тік төртбұрыш пен шаршының ауданы және периметрі' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Қабырғасы 6 см шаршының ауданы неше см²?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Тік төртбұрыш пен шаршының ауданы және периметрі' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қабырғасы 6 см шаршының ауданы неше см²?', 'short_answer', '36'::jsonb, '6 × 6 = 36 см².', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тік төртбұрыш пен шаршының ауданы және периметрі' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Периметрі 28 см шаршының бір қабырғасы неше см?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Тік төртбұрыш пен шаршының ауданы және периметрі' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Периметрі 28 см шаршының бір қабырғасы неше см?', 'short_answer', '7'::jsonb, '28 ÷ 4 = 7 см.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тік төртбұрыш пен шаршының ауданы және периметрі' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Үш балада 30 алма бар. Біріншісінде 8, екіншісінде 11. Үшіншісінде неше алма?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Күрделі, логикалық және стандартты емес мәтінді есептер' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Үш балада 30 алма бар. Біріншісінде 8, екіншісінде 11. Үшіншісінде неше алма?', 'short_answer', '11'::jsonb, '30 − 8 − 11 = 11.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Күрделі, логикалық және стандартты емес мәтінді есептер' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Үш санның қосындысы 40. Біріншісі 12, екіншісі одан 5 артық. Үшіншісін тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Күрделі, логикалық және стандартты емес мәтінді есептер' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Үш санның қосындысы 40. Біріншісі 12, екіншісі одан 5 артық. Үшіншісін тап.', 'short_answer', '11'::jsonb, 'Екіншісі 17; 40 − 12 − 17 = 11.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Күрделі, логикалық және стандартты емес мәтінді есептер' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '2 қорапта 7 доптан бар. 4 доп алынды, қалғанын 2 балаға тең бөлді. Әр балаға неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Күрделі, логикалық және стандартты емес мәтінді есептер' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 қорапта 7 доптан бар. 4 доп алынды, қалғанын 2 балаға тең бөлді. Әр балаға неше?', 'short_answer', '5'::jsonb, '(2 × 7 − 4) ÷ 2 = 5.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Күрделі, логикалық және стандартты емес мәтінді есептер' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', 'Бір сан екіншісінен 4 есе үлкен. Екеуінің қосындысы 35. Кіші санды тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Күрделі, логикалық және стандартты емес мәтінді есептер' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бір сан екіншісінен 4 есе үлкен. Екеуінің қосындысы 35. Кіші санды тап.', 'short_answer', '7'::jsonb, 'Барлығы 5 үлес: 35 ÷ 5 = 7.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Күрделі, логикалық және стандартты емес мәтінді есептер' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Есептеп жауап бер', '10 метр арқаннан 2 м және 3 м кесіп алды. Қалғаны неше метр?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Күрделі, логикалық және стандартты емес мәтінді есептер' and tp.grade = 4 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '10 метр арқаннан 2 м және 3 м кесіп алды. Қалғаны неше метр?', 'short_answer', '5'::jsonb, '10 − 2 − 3 = 5.', 'Амалдарды және разрядтарды мұқият тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Күрделі, логикалық және стандартты емес мәтінді есептер' and tp.grade = 4 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

commit;

