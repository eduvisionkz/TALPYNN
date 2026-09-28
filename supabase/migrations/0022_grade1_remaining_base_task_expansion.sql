-- Additional reviewed tasks for the remaining nine topics. Run migrations in numeric order.

begin;

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '8 + 7 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = '20 көлемінде ондықтан аттап қосу және азайту' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '8 + 7 неше?', 'short_answer', '15'::jsonb, '8 + 2 + 5 = 15.', '8-ді 10-ға жеткіз.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '20 көлемінде ондықтан аттап қосу және азайту' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '12 − 5 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = '20 көлемінде ондықтан аттап қосу және азайту' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '12 − 5 неше?', 'short_answer', '7'::jsonb, '12 − 2 − 3 = 7.', 'Алдымен 12-ден 2-ні азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '20 көлемінде ондықтан аттап қосу және азайту' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '7 + 8 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = '20 көлемінде ондықтан аттап қосу және азайту' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '7 + 8 неше?', 'short_answer', '15'::jsonb, '7 + 3 + 5 = 15.', '7-ні 10-ға жеткіз.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '20 көлемінде ондықтан аттап қосу және азайту' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '14 − 6 нешеге тең?', '{}'::jsonb, 8
from public.topics tp where tp.title = '20 көлемінде ондықтан аттап қосу және азайту' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '14 − 6 нешеге тең?', 'multiple_choice', '"8"'::jsonb, '14 − 4 − 2 = 8.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '20 көлемінде ондықтан аттап қосу және азайту' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '8', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = '20 көлемінде ондықтан аттап қосу және азайту' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '7', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = '20 көлемінде ондықтан аттап қосу және азайту' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '9', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = '20 көлемінде ондықтан аттап қосу және азайту' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '9 + 8 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = '20 көлемінде ондықтан аттап қосу және азайту' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '9 + 8 неше?', 'short_answer', '17'::jsonb, '9 + 1 + 7 = 17.', '9-ды 10-ға жеткіз.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '20 көлемінде ондықтан аттап қосу және азайту' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '«11 мен 4-тің айырмасы» өрнегінің мәнін тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '«11 мен 4-тің айырмасы» өрнегінің мәнін тап.', 'short_answer', '7'::jsonb, '11 − 4 = 7.', 'Айырма — азайтудың нәтижесі.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '«6 мен 9-дың қосындысы» өрнегінің мәнін тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '«6 мен 9-дың қосындысы» өрнегінің мәнін тап.', 'short_answer', '15'::jsonb, '6 + 9 = 15.', 'Қосу амалын орында.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '«13-тен 5-ті азайту» қандай өрнек?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '«13-тен 5-ті азайту» қандай өрнек?', 'multiple_choice', '"13 − 5"'::jsonb, '13-тен 5-ті азайтамыз: 13 − 5.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '13 − 5', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '13 + 5', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '5 − 13', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '10 + 8 − 3 өрнегінің мәнін тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '10 + 8 − 3 өрнегінің мәнін тап.', 'short_answer', '15'::jsonb, '10 + 8 − 3 = 15.', 'Амалдарды ретімен орында.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '«7 мен 8-дің қосындысы» қандай өрнек?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '«7 мен 8-дің қосындысы» қандай өрнек?', 'multiple_choice', '"7 + 8"'::jsonb, 'Қосынды табу үшін сандарды қосамыз.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '7 + 8', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '7 − 8', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '8 − 7', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Өрнектерді оқу, жазу және мәнін табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '8 − 3 жазуы қандай?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '8 − 3 жазуы қандай?', 'multiple_choice', '"санды өрнек"'::jsonb, 'Теңдік белгісі жоқ: бұл санды өрнек.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'санды өрнек', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'теңдік', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'теңсіздік', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '4 + 5 = 9 жазуы қандай?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 + 5 = 9 жазуы қандай?', 'multiple_choice', '"теңдік"'::jsonb, 'Екі жағы тең және = белгісі бар.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'теңдік', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'санды өрнек', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'сан', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '6 + 6 өрнегінің мәнін жаз.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6 + 6 өрнегінің мәнін жаз.', 'short_answer', '12'::jsonb, '6 + 6 = 12.', 'Екі 6-ны қос.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Қай жазу дұрыс теңдік?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қай жазу дұрыс теңдік?', 'multiple_choice', '"7 + 2 = 9"'::jsonb, '7 + 2 = 9.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '7 + 2 = 9', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '7 + 2 = 8', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '7 + 2 = 10', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '17 − 8 өрнегінің мәнін жаз.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '17 − 8 өрнегінің мәнін жаз.', 'short_answer', '9'::jsonb, '17 − 8 = 9.', 'Азайту амалын орында.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Санды өрнек пен теңдікті ажырату' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', 'x + 5 = 12. x-ті тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Белгісіз компонентті табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x + 5 = 12. x-ті тап.', 'short_answer', '7'::jsonb, '12 − 5 = 7.', 'Қосындыдан белгілі қосылғышты азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз компонентті табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', 'x − 6 = 8. x-ті тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Белгісіз компонентті табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x − 6 = 8. x-ті тап.', 'short_answer', '14'::jsonb, '8 + 6 = 14.', 'Айырмаға азайтқышты қос.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз компонентті табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '17 − x = 9. x-ті тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Белгісіз компонентті табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '17 − x = 9. x-ті тап.', 'short_answer', '8'::jsonb, '17 − 9 = 8.', 'Азайғыштан айырманы азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз компонентті табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '4 + x = 13 теңдеуінде x нешеге тең?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Белгісіз компонентті табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 + x = 13 теңдеуінде x нешеге тең?', 'multiple_choice', '"9"'::jsonb, '13 − 4 = 9.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз компонентті табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '9', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Белгісіз компонентті табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '8', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Белгісіз компонентті табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '10', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Белгісіз компонентті табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '19 − x = 12. x-ті тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Белгісіз компонентті табу' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '19 − x = 12. x-ті тап.', 'short_answer', '7'::jsonb, '19 − 12 = 7.', 'Азайғыштан айырманы азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Белгісіз компонентті табу' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', 'Талпында 6 қарындаш бар еді, оған тағы 5 қарындаш берді. Барлығы неше қарындаш?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қарапайым мәтінді есептерді шығару' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпында 6 қарындаш бар еді, оған тағы 5 қарындаш берді. Барлығы неше қарындаш?', 'short_answer', '11'::jsonb, '6 + 5 = 11.', 'Заттар көбейді: қос.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым мәтінді есептерді шығару' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', 'Себетте 15 алма болды, 7 алманы алды. Неше алма қалды?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қарапайым мәтінді есептерді шығару' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Себетте 15 алма болды, 7 алманы алды. Неше алма қалды?', 'short_answer', '8'::jsonb, '15 − 7 = 8.', 'Алынған бөлікті азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым мәтінді есептерді шығару' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Дәулет 9 сурет салды, Әділет 4 сурет салды. Екеуі барлығы неше сурет салды?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қарапайым мәтінді есептерді шығару' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Дәулет 9 сурет салды, Әділет 4 сурет салды. Екеуі барлығы неше сурет салды?', 'multiple_choice', '"13"'::jsonb, '9 + 4 = 13.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым мәтінді есептерді шығару' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '13', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қарапайым мәтінді есептерді шығару' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '12', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қарапайым мәтінді есептерді шығару' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '14', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қарапайым мәтінді есептерді шығару' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', 'Сыныпта 18 оқушы болды, 6 оқушы сыртқа шықты. Неше оқушы қалды?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қарапайым мәтінді есептерді шығару' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Сыныпта 18 оқушы болды, 6 оқушы сыртқа шықты. Неше оқушы қалды?', 'short_answer', '12'::jsonb, '18 − 6 = 12.', 'Шыққан оқушыларды азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым мәтінді есептерді шығару' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', 'Талпын 8 кітап оқыды, тағы 7 кітап оқыды. Барлығы неше кітап?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қарапайым мәтінді есептерді шығару' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпын 8 кітап оқыды, тағы 7 кітап оқыды. Барлығы неше кітап?', 'short_answer', '15'::jsonb, '8 + 7 = 15.', 'Екі санды қос.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым мәтінді есептерді шығару' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '«Сөреде 5 кітап бар еді, тағы 3 кітап қойды» — бұл есептің қай бөлігі?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '«Сөреде 5 кітап бар еді, тағы 3 кітап қойды» — бұл есептің қай бөлігі?', 'multiple_choice', '"шарты"'::jsonb, 'Берілген мәліметтер есептің шарты болады.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'шарты', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'сұрағы', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'жауабы', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '«Барлығы неше кітап болды?» — бұл есептің қай бөлігі?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '«Барлығы неше кітап болды?» — бұл есептің қай бөлігі?', 'multiple_choice', '"сұрағы"'::jsonb, 'Нені табу керегі есептің сұрағында айтылады.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'сұрағы', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'шарты', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'шешуі', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', 'Шарт: 7 алма болды, 2 алма алынды. Сұрақ: неше алма қалды? Жауапты жаз.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Шарт: 7 алма болды, 2 алма алынды. Сұрақ: неше алма қалды? Жауапты жаз.', 'short_answer', '5'::jsonb, '7 − 2 = 5.', 'Қалғанын табу үшін азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '«6 + 4 = 10» жазуы есептің қай бөлігі?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '«6 + 4 = 10» жазуы есептің қай бөлігі?', 'multiple_choice', '"шешуі"'::jsonb, 'Амалды орындау — есептің шешуі.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'шешуі', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'шарты', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'сұрағы', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', 'Шарт: 9 доп болды, тағы 5 доп әкелді. Сұрақ: барлығы неше доп? Жауапты жаз.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Шарт: 9 доп болды, тағы 5 доп әкелді. Сұрақ: барлығы неше доп? Жауапты жаз.', 'short_answer', '14'::jsonb, '9 + 5 = 14.', 'Доптар көбейді: қос.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептің шартын, сұрағын және шешуін анықтау' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '12 см және 7 см жолақтардың ұзындығының айырмасы неше сантиметр?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '12 см және 7 см жолақтардың ұзындығының айырмасы неше сантиметр?', 'short_answer', '5'::jsonb, '12 − 7 = 5 см.', 'Үлкенінен кішісін азайт.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '1 м неше сантиметрге тең?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1 м неше сантиметрге тең?', 'short_answer', '100'::jsonb, '1 м = 100 см.', 'Метр мен сантиметр арасындағы байланысты еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Қайсысы ұзынырақ: 80 см әлде 1 м?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қайсысы ұзынырақ: 80 см әлде 1 м?', 'multiple_choice', '"1 м"'::jsonb, '1 м = 100 см, ол 80 см-ден ұзын.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '1 м', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '80 см', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'тең', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '30 см таспаға 20 см таспа қосылды. Жалпы ұзындығы неше сантиметр?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '30 см таспаға 20 см таспа қосылды. Жалпы ұзындығы неше сантиметр?', 'short_answer', '50'::jsonb, '30 + 20 = 50 см.', 'Ұзындықтарды қос.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Қаламның ұзындығын өлшеуге қай бірлік ыңғайлы?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қаламның ұзындығын өлшеуге қай бірлік ыңғайлы?', 'multiple_choice', '"сантиметр"'::jsonb, 'Кішкентай заттың ұзындығын сантиметрмен өлшейміз.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'сантиметр', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'метр', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'сағат', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '1 сағатта неше минут бар?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1 сағатта неше минут бар?', 'short_answer', '60'::jsonb, '1 сағат = 60 минут.', 'Сағат пен минут арасындағы байланысты еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '2 сағат неше минутқа тең?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 сағат неше минутқа тең?', 'short_answer', '120'::jsonb, '60 + 60 = 120 минут.', 'Екі сағатта екі рет 60 минут болады.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Қай уақыт ұзағырақ: 1 сағат әлде 45 минут?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қай уақыт ұзағырақ: 1 сағат әлде 45 минут?', 'multiple_choice', '"1 сағат"'::jsonb, '1 сағат = 60 минут, 60 > 45.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '1 сағат', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '45 минут', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'тең', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', '1 тәулік пен тағы 1 тәулік барлығы неше сағат?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1 тәулік пен тағы 1 тәулік барлығы неше сағат?', 'short_answer', '48'::jsonb, '24 + 24 = 48 сағат.', 'Әр тәулікте 24 сағат бар.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Тәулікте неше сағат бар?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Тәулікте неше сағат бар?', 'multiple_choice', '"24"'::jsonb, '1 тәулік = 24 сағат.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '24', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '12', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '60', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Уақыт: сағат, минут, тәулік' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', 'Шаршының неше бұрышы бар?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Шаршының неше бұрышы бар?', 'short_answer', '4'::jsonb, 'Шаршыда 4 бұрыш бар.', 'Төрт бұрышты сана.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', 'Тік төртбұрыштың неше қабырғасы бар?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Тік төртбұрыштың неше қабырғасы бар?', 'short_answer', '4'::jsonb, 'Тік төртбұрышта 4 қабырға бар.', 'Әр шетін сана.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Қай фигурада 3 қабырға бар?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қай фигурада 3 қабырға бар?', 'multiple_choice', '"үшбұрыш"'::jsonb, 'Үшбұрыштың 3 қабырғасы бар.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'үшбұрыш', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'шаршы', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'дөңгелек', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Қай фигураның бұрышы жоқ?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қай фигураның бұрышы жоқ?', 'multiple_choice', '"дөңгелек"'::jsonb, 'Дөңгелектің бұрышы болмайды.', 'Шартты қайта оқы.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'дөңгелек', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'үшбұрыш', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'шаршы', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан да жауап бер', 'Бір шаршы мен бір үшбұрыштың барлығы неше қабырғасы бар?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бір шаршы мен бір үшбұрыштың барлығы неше қабырғасы бар?', 'short_answer', '7'::jsonb, '4 + 3 = 7 қабырға.', 'Шаршының 4, үшбұрыштың 3 қабырғасы бар.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

commit;

