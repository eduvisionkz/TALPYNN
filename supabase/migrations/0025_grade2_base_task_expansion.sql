-- Additional reviewed tasks for the Grade 2 base topics. Run migrations in numeric order.

begin;

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '72 санында неше ондық бар?', '{}'::jsonb, 5
from public.topics tp where tp.title = '100 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '72 санында неше ондық бар?', 'short_answer', '7'::jsonb, '72 = 70 + 2, сондықтан 7 ондық.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '63 санының бірліктер разрядында қай цифр тұр?', '{}'::jsonb, 6
from public.topics tp where tp.title = '100 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '63 санының бірліктер разрядында қай цифр тұр?', 'short_answer', '3'::jsonb, '63 = 60 + 3, бірліктер разрядындағы цифр — 3.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '90 + 6 қосындысы қандай сан?', '{}'::jsonb, 7
from public.topics tp where tp.title = '100 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '90 + 6 қосындысы қандай сан?', 'short_answer', '96'::jsonb, '9 ондық пен 6 бірлік — 96.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '4 ондық пен 7 бірліктен қандай сан құралады?', '{}'::jsonb, 8
from public.topics tp where tp.title = '100 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 ондық пен 7 бірліктен қандай сан құралады?', 'short_answer', '47'::jsonb, '40 + 7 = 47.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '85 санындағы ондықтар мен бірліктердің цифрларының қосындысы неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = '100 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '85 санындағы ондықтар мен бірліктердің цифрларының қосындысы неше?', 'short_answer', '13'::jsonb, '8 + 5 = 13.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '4 жүздік, 2 ондық, 6 бірліктен қандай сан құралады?', '{}'::jsonb, 5
from public.topics tp where tp.title = '1000 көлеміндегі сандарды оқу және жазу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 жүздік, 2 ондық, 6 бірліктен қандай сан құралады?', 'short_answer', '426'::jsonb, '400 + 20 + 6 = 426.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1000 көлеміндегі сандарды оқу және жазу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '705 санында неше ондық бар (ондықтар разрядындағы цифрды жаз)?', '{}'::jsonb, 6
from public.topics tp where tp.title = '1000 көлеміндегі сандарды оқу және жазу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '705 санында неше ондық бар (ондықтар разрядындағы цифрды жаз)?', 'short_answer', '0'::jsonb, '705 санының ондықтар разрядында 0 тұр.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1000 көлеміндегі сандарды оқу және жазу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '«Үш жүз он бес» санын цифрмен жаз.', '{}'::jsonb, 7
from public.topics tp where tp.title = '1000 көлеміндегі сандарды оқу және жазу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '«Үш жүз он бес» санын цифрмен жаз.', 'short_answer', '315'::jsonb, 'Үш жүз он бес — 315.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1000 көлеміндегі сандарды оқу және жазу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '860 санында жүздіктер разрядындағы цифрды жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = '1000 көлеміндегі сандарды оқу және жазу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '860 санында жүздіктер разрядындағы цифрды жаз.', 'short_answer', '8'::jsonb, '860 санында 8 жүздік бар.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1000 көлеміндегі сандарды оқу және жазу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '«Тоғыз жүз екі» санын цифрмен жаз.', '{}'::jsonb, 9
from public.topics tp where tp.title = '1000 көлеміндегі сандарды оқу және жазу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '«Тоғыз жүз екі» санын цифрмен жаз.', 'short_answer', '902'::jsonb, '900 + 2 = 902.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1000 көлеміндегі сандарды оқу және жазу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '406 мен 460 сандарының үлкенін жаз.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Үш таңбалы сандарды салыстыру' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '406 мен 460 сандарының үлкенін жаз.', 'short_answer', '460'::jsonb, 'Жүздіктері тең, 6 ондық 0 ондықтан үлкен.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үш таңбалы сандарды салыстыру' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '512 мен 521 сандарының кішісін жаз.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Үш таңбалы сандарды салыстыру' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '512 мен 521 сандарының кішісін жаз.', 'short_answer', '512'::jsonb, 'Ондықтар разрядында 1 < 2.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үш таңбалы сандарды салыстыру' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '899 мен 901 сандарының үлкенін жаз.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Үш таңбалы сандарды салыстыру' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '899 мен 901 сандарының үлкенін жаз.', 'short_answer', '901'::jsonb, '9 жүздік 8 жүздіктен үлкен.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үш таңбалы сандарды салыстыру' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '703 пен 730 сандарының кішісін жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Үш таңбалы сандарды салыстыру' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '703 пен 730 сандарының кішісін жаз.', 'short_answer', '703'::jsonb, 'Ондықтар разрядында 0 < 3.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үш таңбалы сандарды салыстыру' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '678 бен 687 сандарының үлкенін жаз.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Үш таңбалы сандарды салыстыру' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '678 бен 687 сандарының үлкенін жаз.', 'short_answer', '687'::jsonb, 'Жүздіктері тең, 8 ондық 7 ондықтан үлкен.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үш таңбалы сандарды салыстыру' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '47 + 26 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = '100 көлемінде қосу және азайту' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '47 + 26 неше?', 'short_answer', '73'::jsonb, '47 + 20 + 6 = 73.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100 көлемінде қосу және азайту' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '85 − 37 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = '100 көлемінде қосу және азайту' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '85 − 37 неше?', 'short_answer', '48'::jsonb, '85 − 30 − 7 = 48.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100 көлемінде қосу және азайту' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '36 + 45 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = '100 көлемінде қосу және азайту' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '36 + 45 неше?', 'short_answer', '81'::jsonb, '36 + 40 + 5 = 81.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100 көлемінде қосу және азайту' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '92 − 58 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = '100 көлемінде қосу және азайту' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '92 − 58 неше?', 'short_answer', '34'::jsonb, '92 − 50 − 8 = 34.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100 көлемінде қосу және азайту' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '24 + 39 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = '100 көлемінде қосу және азайту' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '24 + 39 неше?', 'short_answer', '63'::jsonb, '24 + 40 − 1 = 63.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100 көлемінде қосу және азайту' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '97 + 8 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Жүздіктен аттап қосу және азайту' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '97 + 8 неше?', 'short_answer', '105'::jsonb, '97 + 3 + 5 = 105.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жүздіктен аттап қосу және азайту' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '104 − 7 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Жүздіктен аттап қосу және азайту' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '104 − 7 неше?', 'short_answer', '97'::jsonb, '104 − 4 − 3 = 97.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жүздіктен аттап қосу және азайту' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '88 + 16 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Жүздіктен аттап қосу және азайту' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '88 + 16 неше?', 'short_answer', '104'::jsonb, '88 + 12 + 4 = 104.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жүздіктен аттап қосу және азайту' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '103 − 9 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Жүздіктен аттап қосу және азайту' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '103 − 9 неше?', 'short_answer', '94'::jsonb, '103 − 3 − 6 = 94.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жүздіктен аттап қосу және азайту' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '99 + 12 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Жүздіктен аттап қосу және азайту' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '99 + 12 неше?', 'short_answer', '111'::jsonb, '99 + 1 + 11 = 111.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жүздіктен аттап қосу және азайту' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '3 + 3 + 3 + 3 қосындысын тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Көбейту ұғымы және көбейту кестесі' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 + 3 + 3 + 3 қосындысын тап.', 'short_answer', '12'::jsonb, '3 саны төрт рет қосылады: 3 × 4 = 12.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту ұғымы және көбейту кестесі' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '5 бірдей топтың әрқайсысында 2 зат бар. Барлығы неше зат?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Көбейту ұғымы және көбейту кестесі' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5 бірдей топтың әрқайсысында 2 зат бар. Барлығы неше зат?', 'short_answer', '10'::jsonb, '5 × 2 = 10.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту ұғымы және көбейту кестесі' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '4 + 4 + 4 қосындысын тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Көбейту ұғымы және көбейту кестесі' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 + 4 + 4 қосындысын тап.', 'short_answer', '12'::jsonb, '4 × 3 = 12.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту ұғымы және көбейту кестесі' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Әр қатарда 3 орыннан, барлығы 6 қатар. Неше орын?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Көбейту ұғымы және көбейту кестесі' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Әр қатарда 3 орыннан, барлығы 6 қатар. Неше орын?', 'short_answer', '18'::jsonb, '6 × 3 = 18.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту ұғымы және көбейту кестесі' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '7 + 7 қосындысын көбейту арқылы есепте.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Көбейту ұғымы және көбейту кестесі' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '7 + 7 қосындысын көбейту арқылы есепте.', 'short_answer', '14'::jsonb, '7 × 2 = 14.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту ұғымы және көбейту кестесі' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '4 × 6 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = '2, 3, 4, 5-ке көбейту және бөлу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 × 6 неше?', 'short_answer', '24'::jsonb, '4 × 6 = 24.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '2, 3, 4, 5-ке көбейту және бөлу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '18 ÷ 3 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = '2, 3, 4, 5-ке көбейту және бөлу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '18 ÷ 3 неше?', 'short_answer', '6'::jsonb, '3 × 6 = 18.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '2, 3, 4, 5-ке көбейту және бөлу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '5 × 7 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = '2, 3, 4, 5-ке көбейту және бөлу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5 × 7 неше?', 'short_answer', '35'::jsonb, '5 × 7 = 35.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '2, 3, 4, 5-ке көбейту және бөлу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '32 ÷ 4 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = '2, 3, 4, 5-ке көбейту және бөлу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '32 ÷ 4 неше?', 'short_answer', '8'::jsonb, '4 × 8 = 32.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '2, 3, 4, 5-ке көбейту және бөлу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '16 ÷ 2 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = '2, 3, 4, 5-ке көбейту және бөлу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '16 ÷ 2 неше?', 'short_answer', '8'::jsonb, '2 × 8 = 16.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '2, 3, 4, 5-ке көбейту және бөлу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '6 × 7 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = '6, 7, 8, 9-ға көбейту және бөлу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6 × 7 неше?', 'short_answer', '42'::jsonb, '6 × 7 = 42.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '6, 7, 8, 9-ға көбейту және бөлу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '56 ÷ 8 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = '6, 7, 8, 9-ға көбейту және бөлу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '56 ÷ 8 неше?', 'short_answer', '7'::jsonb, '8 × 7 = 56.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '6, 7, 8, 9-ға көбейту және бөлу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '9 × 5 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = '6, 7, 8, 9-ға көбейту және бөлу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '9 × 5 неше?', 'short_answer', '45'::jsonb, '9 × 5 = 45.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '6, 7, 8, 9-ға көбейту және бөлу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '63 ÷ 7 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = '6, 7, 8, 9-ға көбейту және бөлу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '63 ÷ 7 неше?', 'short_answer', '9'::jsonb, '7 × 9 = 63.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '6, 7, 8, 9-ға көбейту және бөлу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '8 × 8 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = '6, 7, 8, 9-ға көбейту және бөлу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '8 × 8 неше?', 'short_answer', '64'::jsonb, '8 × 8 = 64.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '6, 7, 8, 9-ға көбейту және бөлу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '7 × 5 = 35 болса, 35 ÷ 5 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Көбейту мен бөлудің өзара байланысы' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '7 × 5 = 35 болса, 35 ÷ 5 неше?', 'short_answer', '7'::jsonb, 'Көбейтуге кері амал: 35 ÷ 5 = 7.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту мен бөлудің өзара байланысы' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '8 × 6 = 48 болса, 48 ÷ 8 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Көбейту мен бөлудің өзара байланысы' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '8 × 6 = 48 болса, 48 ÷ 8 неше?', 'short_answer', '6'::jsonb, '48 ÷ 8 = 6.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту мен бөлудің өзара байланысы' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '54 ÷ 9 = 6 болса, 6 × 9 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Көбейту мен бөлудің өзара байланысы' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '54 ÷ 9 = 6 болса, 6 × 9 неше?', 'short_answer', '54'::jsonb, '6 × 9 = 54.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту мен бөлудің өзара байланысы' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '4 × 9 = 36 болса, 36 ÷ 4 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Көбейту мен бөлудің өзара байланысы' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 × 9 = 36 болса, 36 ÷ 4 неше?', 'short_answer', '9'::jsonb, '36 ÷ 4 = 9.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту мен бөлудің өзара байланысы' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '42 ÷ 7 = 6 болса, 6 × 7 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Көбейту мен бөлудің өзара байланысы' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '42 ÷ 7 = 6 болса, 6 × 7 неше?', 'short_answer', '42'::jsonb, '6 × 7 = 42.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Көбейту мен бөлудің өзара байланысы' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'x × 4 = 28. x-ті тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Белгісіз көбейткішті, бөлінгішті, бөлгішті табу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x × 4 = 28. x-ті тап.', 'short_answer', '7'::jsonb, '28 ÷ 4 = 7.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз көбейткішті, бөлінгішті, бөлгішті табу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'x ÷ 6 = 8. x-ті тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Белгісіз көбейткішті, бөлінгішті, бөлгішті табу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x ÷ 6 = 8. x-ті тап.', 'short_answer', '48'::jsonb, '8 × 6 = 48.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз көбейткішті, бөлінгішті, бөлгішті табу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '45 ÷ x = 5. x-ті тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Белгісіз көбейткішті, бөлінгішті, бөлгішті табу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '45 ÷ x = 5. x-ті тап.', 'short_answer', '9'::jsonb, '45 ÷ 5 = 9.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз көбейткішті, бөлінгішті, бөлгішті табу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '9 × x = 54. x-ті тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Белгісіз көбейткішті, бөлінгішті, бөлгішті табу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '9 × x = 54. x-ті тап.', 'short_answer', '6'::jsonb, '54 ÷ 9 = 6.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз көбейткішті, бөлінгішті, бөлгішті табу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'x ÷ 7 = 3. x-ті тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Белгісіз көбейткішті, бөлінгішті, бөлгішті табу' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x ÷ 7 = 3. x-ті тап.', 'short_answer', '21'::jsonb, '3 × 7 = 21.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз көбейткішті, бөлінгішті, бөлгішті табу' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Талпында 12 кітап бар, 5-еуін берді, тағы 8 кітап алды. Қазір неше кітап?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Екі амалмен шығарылатын мәтінді есептер' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпында 12 кітап бар, 5-еуін берді, тағы 8 кітап алды. Қазір неше кітап?', 'short_answer', '15'::jsonb, '12 − 5 + 8 = 15.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі амалмен шығарылатын мәтінді есептер' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Себетте 6 қызыл және 4 жасыл алма бар. 3 алманы жеді. Неше алма қалды?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Екі амалмен шығарылатын мәтінді есептер' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Себетте 6 қызыл және 4 жасыл алма бар. 3 алманы жеді. Неше алма қалды?', 'short_answer', '7'::jsonb, '6 + 4 − 3 = 7.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі амалмен шығарылатын мәтінді есептер' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Әр қорапта 5 қарындаштан, 3 қорап бар. 4 қарындашты берді. Неше қалды?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Екі амалмен шығарылатын мәтінді есептер' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Әр қорапта 5 қарындаштан, 3 қорап бар. 4 қарындашты берді. Неше қалды?', 'short_answer', '11'::jsonb, '3 × 5 − 4 = 11.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі амалмен шығарылатын мәтінді есептер' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '18 баланың 6-уы кетті, кейін тағы 3 бала келді. Қазір неше бала?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Екі амалмен шығарылатын мәтінді есептер' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '18 баланың 6-уы кетті, кейін тағы 3 бала келді. Қазір неше бала?', 'short_answer', '15'::jsonb, '18 − 6 + 3 = 15.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі амалмен шығарылатын мәтінді есептер' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '2 қатарда 7 гүлден бар. Тағы 5 гүл егілді. Барлығы неше гүл?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Екі амалмен шығарылатын мәтінді есептер' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 қатарда 7 гүлден бар. Тағы 5 гүл егілді. Барлығы неше гүл?', 'short_answer', '19'::jsonb, '2 × 7 + 5 = 19.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Екі амалмен шығарылатын мәтінді есептер' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Қысқаша шарт: болды 25, алды 8, берді 6. Қалды неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Есептерді сызба, қысқаша шарт арқылы шығару' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қысқаша шарт: болды 25, алды 8, берді 6. Қалды неше?', 'short_answer', '27'::jsonb, '25 + 8 − 6 = 27.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептерді сызба, қысқаша шарт арқылы шығару' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Кесте: 3 қорап, әрқайсысында 4 доп. Барлығы неше доп?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Есептерді сызба, қысқаша шарт арқылы шығару' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Кесте: 3 қорап, әрқайсысында 4 доп. Барлығы неше доп?', 'short_answer', '12'::jsonb, '3 × 4 = 12.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептерді сызба, қысқаша шарт арқылы шығару' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Сызба: бірінші кесінді 18 см, екіншісі одан 5 см ұзын. Екінші кесінді неше см?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Есептерді сызба, қысқаша шарт арқылы шығару' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Сызба: бірінші кесінді 18 см, екіншісі одан 5 см ұзын. Екінші кесінді неше см?', 'short_answer', '23'::jsonb, '18 + 5 = 23 см.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептерді сызба, қысқаша шарт арқылы шығару' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Кесте: 20 алма, 4 балаға тең бөлінді. Әр балаға неше алма?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Есептерді сызба, қысқаша шарт арқылы шығару' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Кесте: 20 алма, 4 балаға тең бөлінді. Әр балаға неше алма?', 'short_answer', '5'::jsonb, '20 ÷ 4 = 5.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептерді сызба, қысқаша шарт арқылы шығару' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Қысқаша шарт: болды 30, 7-еуін берді, тағы 9-ын әкелді. Қазір неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Есептерді сызба, қысқаша шарт арқылы шығару' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қысқаша шарт: болды 30, 7-еуін берді, тағы 9-ын әкелді. Қазір неше?', 'short_answer', '32'::jsonb, '30 − 7 + 9 = 32.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептерді сызба, қысқаша шарт арқылы шығару' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '6 + 3 × 4 өрнегінің мәнін тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Өрнектердегі амалдардың орындалу реті' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6 + 3 × 4 өрнегінің мәнін тап.', 'short_answer', '18'::jsonb, 'Алдымен 3 × 4 = 12, сонан соң 6 + 12 = 18.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектердегі амалдардың орындалу реті' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '20 − 12 ÷ 3 өрнегінің мәнін тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Өрнектердегі амалдардың орындалу реті' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '20 − 12 ÷ 3 өрнегінің мәнін тап.', 'short_answer', '16'::jsonb, 'Алдымен 12 ÷ 3 = 4, кейін 20 − 4 = 16.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектердегі амалдардың орындалу реті' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '5 × 4 + 7 өрнегінің мәнін тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Өрнектердегі амалдардың орындалу реті' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5 × 4 + 7 өрнегінің мәнін тап.', 'short_answer', '27'::jsonb, '5 × 4 = 20; 20 + 7 = 27.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектердегі амалдардың орындалу реті' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '18 ÷ 3 + 9 өрнегінің мәнін тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Өрнектердегі амалдардың орындалу реті' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '18 ÷ 3 + 9 өрнегінің мәнін тап.', 'short_answer', '15'::jsonb, '18 ÷ 3 = 6; 6 + 9 = 15.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектердегі амалдардың орындалу реті' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '30 − 2 × 8 өрнегінің мәнін тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Өрнектердегі амалдардың орындалу реті' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '30 − 2 × 8 өрнегінің мәнін тап.', 'short_answer', '14'::jsonb, '2 × 8 = 16; 30 − 16 = 14.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектердегі амалдардың орындалу реті' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '2 метр неше сантиметр?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Шамалар: ұзындық, масса, уақыт, көлем' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 метр неше сантиметр?', 'short_answer', '200'::jsonb, '2 × 100 = 200 см.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Шамалар: ұзындық, масса, уақыт, көлем' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '1 килограмм неше грамм?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Шамалар: ұзындық, масса, уақыт, көлем' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1 килограмм неше грамм?', 'short_answer', '1000'::jsonb, '1 кг = 1000 г.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Шамалар: ұзындық, масса, уақыт, көлем' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '2 сағат неше минут?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Шамалар: ұзындық, масса, уақыт, көлем' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 сағат неше минут?', 'short_answer', '120'::jsonb, '2 × 60 = 120 мин.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Шамалар: ұзындық, масса, уақыт, көлем' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '3 литр және 2 литр бар. Барлығы неше литр?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Шамалар: ұзындық, масса, уақыт, көлем' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 литр және 2 литр бар. Барлығы неше литр?', 'short_answer', '5'::jsonb, '3 + 2 = 5 л.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Шамалар: ұзындық, масса, уақыт, көлем' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', '1 метр мен 40 сантиметр барлығы неше сантиметр?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Шамалар: ұзындық, масса, уақыт, көлем' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1 метр мен 40 сантиметр барлығы неше сантиметр?', 'short_answer', '140'::jsonb, '100 + 40 = 140 см.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Шамалар: ұзындық, масса, уақыт, көлем' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Қабырғасы 5 см шаршының периметрі неше см?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Геометриялық фигуралардың периметрі' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қабырғасы 5 см шаршының периметрі неше см?', 'short_answer', '20'::jsonb, '5 + 5 + 5 + 5 = 20 см.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Геометриялық фигуралардың периметрі' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Ұзындығы 8 см, ені 3 см тіктөртбұрыштың периметрі неше см?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Геометриялық фигуралардың периметрі' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ұзындығы 8 см, ені 3 см тіктөртбұрыштың периметрі неше см?', 'short_answer', '22'::jsonb, '8 + 3 + 8 + 3 = 22 см.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Геометриялық фигуралардың периметрі' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Қабырғалары 3, 4, 5 см үшбұрыштың периметрі неше см?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Геометриялық фигуралардың периметрі' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қабырғалары 3, 4, 5 см үшбұрыштың периметрі неше см?', 'short_answer', '12'::jsonb, '3 + 4 + 5 = 12 см.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Геометриялық фигуралардың периметрі' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Қабырғасы 7 см шаршының периметрі неше см?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Геометриялық фигуралардың периметрі' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қабырғасы 7 см шаршының периметрі неше см?', 'short_answer', '28'::jsonb, '7 × 4 = 28 см.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Геометриялық фигуралардың периметрі' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жауабын тап', 'Ұзындығы 6 см, ені 4 см тіктөртбұрыштың периметрі неше см?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Геометриялық фигуралардың периметрі' and tp.grade = 2 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ұзындығы 6 см, ені 4 см тіктөртбұрыштың периметрі неше см?', 'short_answer', '20'::jsonb, '6 + 4 + 6 + 4 = 20 см.', 'Шарттағы сандарды және амалды анықта.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Геометриялық фигуралардың периметрі' and tp.grade = 2 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

commit;

