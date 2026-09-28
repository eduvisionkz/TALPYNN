-- Additional reviewed tasks for the first five topics. Run migrations in numeric order.

begin;

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Жасырын бөлікті тап', '13 = 10 + ?. Жасырын санды тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = '20 көлеміндегі сандардың құрамы' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '13 = 10 + ?. Жасырын санды тап.', 'short_answer', '3'::jsonb, '13 = 10 + 3.', '13-тен 10-ды азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '20 көлеміндегі сандардың құрамы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санды құрастыр', 'Бір ондық пен 8 бірліктен қандай сан құралады?', '{}'::jsonb, 6
from public.topics tp where tp.title = '20 көлеміндегі сандардың құрамы' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бір ондық пен 8 бірліктен қандай сан құралады?', 'short_answer', '18'::jsonb, 'Бір ондық — 10, сондықтан 10 + 8 = 18.', '10 мен 8-ді қос.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '20 көлеміндегі сандардың құрамы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Теңдікті таңда', '16 санының құрамын дұрыс көрсететін теңдікті таңда.', '{}'::jsonb, 7
from public.topics tp where tp.title = '20 көлеміндегі сандардың құрамы' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '16 санының құрамын дұрыс көрсететін теңдікті таңда.', 'multiple_choice', '"10 + 6 = 16"'::jsonb, '16 = 10 + 6.', 'Бірліктер саны 6.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '20 көлеміндегі сандардың құрамы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '10 + 6 = 16', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = '20 көлеміндегі сандардың құрамы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '10 + 5 = 16', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = '20 көлеміндегі сандардың құрамы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '10 + 7 = 16', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = '20 көлеміндегі сандардың құрамы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ондыққа дейін толықтыр', '10 + ? = 12. Жетіспейтін санды жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = '20 көлеміндегі сандардың құрамы' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '10 + ? = 12. Жетіспейтін санды жаз.', 'short_answer', '2'::jsonb, '10 + 2 = 12.', '12-ден 10-ды азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '20 көлеміндегі сандардың құрамы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'ordering', 'Сандарды ретте', 'Сандарды кішіден үлкенге қарай орналастыр.', '{"items":["12","13","15","18","19"]}'::jsonb, 9
from public.topics tp where tp.title = '20 көлеміндегі сандардың құрамы' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Кішісін тап', '47 мен 74 сандарының кішісін жаз.', '{}'::jsonb, 5
from public.topics tp where tp.title = '100-ге дейінгі сандарды оқу, жазу және салыстыру' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '47 мен 74 сандарының кішісін жаз.', 'short_answer', '47'::jsonb, '47-де 4 ондық, 74-те 7 ондық бар: 47 < 74.', 'Алдымен ондықтарды салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100-ге дейінгі сандарды оқу, жазу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Үлкенін тап', '63 пен 68 сандарының үлкенін жаз.', '{}'::jsonb, 6
from public.topics tp where tp.title = '100-ге дейінгі сандарды оқу, жазу және салыстыру' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '63 пен 68 сандарының үлкенін жаз.', 'short_answer', '68'::jsonb, 'Ондықтары тең, 8 бірлік 3 бірліктен үлкен.', 'Ондықтары тең болса, бірліктерді салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100-ге дейінгі сандарды оқу, жазу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Таңбаны таңда', '55 пен 55 сандарының арасына қандай таңба қойылады?', '{}'::jsonb, 7
from public.topics tp where tp.title = '100-ге дейінгі сандарды оқу, жазу және салыстыру' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '55 пен 55 сандарының арасына қандай таңба қойылады?', 'multiple_choice', '"="'::jsonb, '55 = 55, екі сан тең.', 'Сандар бірдей ме?', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100-ге дейінгі сандарды оқу, жазу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '=', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = '100-ге дейінгі сандарды оқу, жазу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '>', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = '100-ге дейінгі сандарды оқу, жазу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '<', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = '100-ге дейінгі сандарды оқу, жазу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'ordering', 'Кему реті', 'Сандарды үлкеннен кішіге қарай орналастыр.', '{"items":["99","78","61","45","20"]}'::jsonb, 8
from public.topics tp where tp.title = '100-ге дейінгі сандарды оқу, жазу және салыстыру' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ең кіші сан', '29, 92, 39 сандарының ең кішісін жаз.', '{}'::jsonb, 9
from public.topics tp where tp.title = '100-ге дейінгі сандарды оқу, жазу және салыстыру' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '29, 92, 39 сандарының ең кішісін жаз.', 'short_answer', '29'::jsonb, '29-да бар болғаны 2 ондық бар.', 'Ондықтарды салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '100-ге дейінгі сандарды оқу, жазу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Қосындыны есепте', '6 мен 8-дің қосындысын тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қосындыны және айырманы табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6 мен 8-дің қосындысын тап.', 'short_answer', '14'::jsonb, '6 + 8 = 14.', 'Сандарды қос.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосындыны және айырманы табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Айырманы есепте', '17 мен 8-дің айырмасын тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қосындыны және айырманы табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '17 мен 8-дің айырмасын тап.', 'short_answer', '9'::jsonb, '17 − 8 = 9.', '17-ден 8-ді азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосындыны және айырманы табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Өрнекті таңда', '15 саны 9 бен нешенің қосындысы?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қосындыны және айырманы табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '15 саны 9 бен нешенің қосындысы?', 'multiple_choice', '"6"'::jsonb, '9 + 6 = 15.', '15-тен 9-ды азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосындыны және айырманы табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '6', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қосындыны және айырманы табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '5', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қосындыны және айырманы табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '7', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қосындыны және айырманы табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Мәтіндік есеп', 'Талпын 12 дәптердің 4-еуін берді. Қанша дәптер қалды?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қосындыны және айырманы табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпын 12 дәптердің 4-еуін берді. Қанша дәптер қалды?', 'short_answer', '8'::jsonb, '12 − 4 = 8 дәптер.', 'Берген дәптерді барлығынан азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосындыны және айырманы табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'ordering', 'Өсу ретімен орналастыр', 'Өрнектерді мәні кіші мәннен үлкен мәнге қарай орналастыр.', '{"items":["8 − 6","3 + 4","12 − 3","6 + 5"]}'::jsonb, 9
from public.topics tp where tp.title = 'Қосындыны және айырманы табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Қосуды тексер', '4 + 8 = 12 болса, 12 − 8 нешеге тең?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қосу мен азайтудың өзара байланысы' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 + 8 = 12 болса, 12 − 8 нешеге тең?', 'short_answer', '4'::jsonb, '12 − 8 = 4.', 'Қосындыдан екінші қосылғышты азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың өзара байланысы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Азайтуды тексер', '16 − 7 = 9 болса, 9 + 7 нешеге тең?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қосу мен азайтудың өзара байланысы' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '16 − 7 = 9 болса, 9 + 7 нешеге тең?', 'short_answer', '16'::jsonb, '9 + 7 = 16.', 'Айырмаға азайтқышты қос.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың өзара байланысы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Кері теңдікті таңда', '5 + 6 = 11 теңдігіне сәйкес азайту теңдігін таңда.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қосу мен азайтудың өзара байланысы' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5 + 6 = 11 теңдігіне сәйкес азайту теңдігін таңда.', 'multiple_choice', '"11 − 6 = 5"'::jsonb, '11 − 6 = 5.', 'Қосындыдан қосылғышты азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың өзара байланысы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '11 − 6 = 5', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қосу мен азайтудың өзара байланысы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '11 − 6 = 6', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қосу мен азайтудың өзара байланысы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '11 − 5 = 5', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қосу мен азайтудың өзара байланысы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Белгісіз қосылғыш', '? + 7 = 18. Белгісіз санды тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қосу мен азайтудың өзара байланысы' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '? + 7 = 18. Белгісіз санды тап.', 'short_answer', '11'::jsonb, '18 − 7 = 11.', 'Қосуды кері амалмен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың өзара байланысы' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'ordering', 'Теңдіктерді ретте', 'Теңдіктерді нәтижесі өсу ретімен орналастыр.', '{"items":["9 − 7 = 2","12 − 7 = 5","7 + 1 = 8","6 + 6 = 12"]}'::jsonb, 9
from public.topics tp where tp.title = 'Қосу мен азайтудың өзара байланысы' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Бірінші қосылғыш', '? + 6 = 14. Белгісіз қосылғышты тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қосу мен азайтудың компоненттері' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '? + 6 = 14. Белгісіз қосылғышты тап.', 'short_answer', '8'::jsonb, '14 − 6 = 8.', 'Қосындыдан белгілі қосылғышты азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың компоненттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Айырма', '18 − 9 = ?. Айырманы тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қосу мен азайтудың компоненттері' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '18 − 9 = ?. Айырманы тап.', 'short_answer', '9'::jsonb, '18 − 9 = 9.', 'Азайтуды орында.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың компоненттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Азайғыш', '? − 8 = 7. Азайғышты тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қосу мен азайтудың компоненттері' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '? − 8 = 7. Азайғышты тап.', 'short_answer', '15'::jsonb, '7 + 8 = 15.', 'Айырма мен азайтқышты қос.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың компоненттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Компонент атауы', '12 − 5 = 7 өрнегіндегі 5 саны қалай аталады?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қосу мен азайтудың компоненттері' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '12 − 5 = 7 өрнегіндегі 5 саны қалай аталады?', 'multiple_choice', '"азайтқыш"'::jsonb, '12 — азайғыш, 5 — азайтқыш, 7 — айырма.', 'Азайғыштан қандай санды алып тастадық?', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың компоненттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'азайтқыш', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қосу мен азайтудың компоненттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'азайғыш', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қосу мен азайтудың компоненттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'айырма', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қосу мен азайтудың компоненттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Азайтқыш', '19 − ? = 13. Белгісіз азайтқышты тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қосу мен азайтудың компоненттері' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '19 − ? = 13. Белгісіз азайтқышты тап.', 'short_answer', '6'::jsonb, '19 − 13 = 6.', 'Азайғыштан айырманы азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосу мен азайтудың компоненттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

commit;

