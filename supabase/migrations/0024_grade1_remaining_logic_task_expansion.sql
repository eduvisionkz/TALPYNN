-- Additional reviewed tasks for the remaining ten logic topics. Run migrations in numeric order.

begin;

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Ертегіде 3-ші бауырдан кейін қай бауыр келеді?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Сандар әлемі туралы ертегі' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ертегіде 3-ші бауырдан кейін қай бауыр келеді?', 'short_answer', '4'::jsonb, '3-тен кейін 4 келеді.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар әлемі туралы ертегі' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Ертегіде 9-шы бауырдың алдында қай бауыр тұр?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Сандар әлемі туралы ертегі' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ертегіде 9-шы бауырдың алдында қай бауыр тұр?', 'short_answer', '8'::jsonb, '9-дың алдында 8 тұр.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар әлемі туралы ертегі' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Ертегі бауырлары 2, 3, ?, 5 болып тұр. Жасырын бауыр кім?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Сандар әлемі туралы ертегі' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ертегі бауырлары 2, 3, ?, 5 болып тұр. Жасырын бауыр кім?', 'multiple_choice', '"4"'::jsonb, '3 пен 5-тің арасындағы сан — 4.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар әлемі туралы ертегі' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '4', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сандар әлемі туралы ертегі' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '3', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сандар әлемі туралы ертегі' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '6', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сандар әлемі туралы ертегі' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '10 бауырдың 2-еуі ұйықтап қалды. Ояу қалғаны неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Сандар әлемі туралы ертегі' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '10 бауырдың 2-еуі ұйықтап қалды. Ояу қалғаны неше?', 'short_answer', '8'::jsonb, '10 − 2 = 8.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар әлемі туралы ертегі' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Ертегіде 5 бауырға тағы 4 бауыр қосылды. Барлығы неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Сандар әлемі туралы ертегі' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ертегіде 5 бауырға тағы 4 бауыр қосылды. Барлығы неше?', 'short_answer', '9'::jsonb, '5 + 4 = 9.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар әлемі туралы ертегі' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Заттарды бір-бірлеп атап шығу қандай әрекет?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Заттарды бір-бірлеп атап шығу қандай әрекет?', 'multiple_choice', '"санау"'::jsonb, 'Заттарды ретімен атау — санау.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'санау', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'сан', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'түс', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Талпын 3 жапырақ пен 2 жапырақты санады. Барлығы неше жапырақ?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпын 3 жапырақ пен 2 жапырақты санады. Барлығы неше жапырақ?', 'short_answer', '5'::jsonb, '3 + 2 = 5.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '«8» таңбасы нені білдіреді?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '«8» таңбасы нені білдіреді?', 'multiple_choice', '"сан"'::jsonb, '8 — сан.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'сан', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'санау әрекеті', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'жапырақ', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '7 текшені бір-бірлеп санағанда соңғы айтылатын санды жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '7 текшені бір-бірлеп санағанда соңғы айтылатын санды жаз.', 'short_answer', '7'::jsonb, 'Соңғы айтылған сан — 7.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '4 алма мен тағы 4 алманы санағанда барлығы неше алма?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 алма мен тағы 4 алманы санағанда барлығы неше алма?', 'short_answer', '8'::jsonb, '4 + 4 = 8.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сан және санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Кезекте бірінші тұрған бала туралы қандай сұрақ қоямыз?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Кезекте бірінші тұрған бала туралы қандай сұрақ қоямыз?', 'multiple_choice', '"Нешінші?"'::jsonb, 'Реттік орынды «Нешінші?» сұрағымен білеміз.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Нешінші?', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Неше?', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Қанша?', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Кезекте 8 бала тұр. Ең соңғы бала нешінші орында?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Кезекте 8 бала тұр. Ең соңғы бала нешінші орында?', 'short_answer', '8'::jsonb, 'Сегіз баланың соңғысы — сегізінші.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Қорапта 6 текше бар. Текшелер санына қандай сұрақ қоямыз?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қорапта 6 текше бар. Текшелер санына қандай сұрақ қоямыз?', 'multiple_choice', '"Неше?"'::jsonb, 'Мөлшерді «Неше?» сұрағымен анықтаймыз.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Неше?', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Нешінші?', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Қайда?', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Кезекте 7 бала тұр. 2-ші баладан кейін неше бала тұр?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Кезекте 7 бала тұр. 2-ші баладан кейін неше бала тұр?', 'short_answer', '5'::jsonb, '7 − 2 = 5.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Талпын кезекте 4-ші, оның алдында неше бала тұр?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпын кезекте 4-ші, оның алдында неше бала тұр?', 'short_answer', '3'::jsonb, 'Төртіншінің алдында үш бала тұр.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '2, 4, 6, ?, 10 тізбегіндегі белгісіз санды тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Сандар тізбегінен заңдылықты табу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2, 4, 6, ?, 10 тізбегіндегі белгісіз санды тап.', 'short_answer', '8'::jsonb, 'Сандар 2-ге артады: 6 + 2 = 8.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар тізбегінен заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '10, 9, 8, ?, 6 тізбегіндегі белгісіз санды тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Сандар тізбегінен заңдылықты табу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '10, 9, 8, ?, 6 тізбегіндегі белгісіз санды тап.', 'short_answer', '7'::jsonb, 'Сандар 1-ге кемиді.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар тізбегінен заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '1, 3, 5, ? тізбегі қалай жалғасады?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Сандар тізбегінен заңдылықты табу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1, 3, 5, ? тізбегі қалай жалғасады?', 'multiple_choice', '"7"'::jsonb, 'Әр жолы 2 қосамыз.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар тізбегінен заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '7', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сандар тізбегінен заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '6', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сандар тізбегінен заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '8', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сандар тізбегінен заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '5, 10, 15, ? тізбегіндегі келесі санды жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Сандар тізбегінен заңдылықты табу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5, 10, 15, ? тізбегіндегі келесі санды жаз.', 'short_answer', '20'::jsonb, 'Әр жолы 5 қосамыз.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар тізбегінен заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '12, 10, 8, ? тізбегіндегі келесі санды жаз.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Сандар тізбегінен заңдылықты табу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '12, 10, 8, ? тізбегіндегі келесі санды жаз.', 'short_answer', '6'::jsonb, 'Әр жолы 2 азайтамыз.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар тізбегінен заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Қай фигураның бұрышы жоқ?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қай фигураның бұрышы жоқ?', 'multiple_choice', '"дөңгелек"'::jsonb, 'Дөңгелекте бұрыш жоқ.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'дөңгелек', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'шаршы', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'үшбұрыш', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Үшбұрыштың неше бұрышы бар?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Үшбұрыштың неше бұрышы бар?', 'short_answer', '3'::jsonb, 'Үшбұрышта 3 бұрыш бар.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Төрт қабырғасы тең фигураны таңда.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Төрт қабырғасы тең фигураны таңда.', 'multiple_choice', '"шаршы"'::jsonb, 'Шаршының төрт қабырғасы тең.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'шаршы', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'үшбұрыш', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'дөңгелек', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Тік төртбұрыштың неше қабырғасы бар?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Тік төртбұрыштың неше қабырғасы бар?', 'short_answer', '4'::jsonb, 'Тік төртбұрыштың 4 қабырғасы бар.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Қай фигураның үш қабырғасы бар?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қай фигураның үш қабырғасы бар?', 'multiple_choice', '"үшбұрыш"'::jsonb, 'Үшбұрыштың 3 қабырғасы бар.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'үшбұрыш', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'дөңгелек', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'шаршы', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '● ■ ● ■ ● ? тізбегінде келесі фигура қандай? (● немесе ■)', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '● ■ ● ■ ● ? тізбегінде келесі фигура қандай? (● немесе ■)', 'short_answer', '"■"'::jsonb, 'Фигуралар кезектесіп қайталанады.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '▲ ▲ ● ▲ ▲ ● ▲ ▲ ? тізбегінде не келеді?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '▲ ▲ ● ▲ ▲ ● ▲ ▲ ? тізбегінде не келеді?', 'multiple_choice', '"●"'::jsonb, 'Екі үшбұрыштан кейін бір дөңгелек келеді.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '●', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '▲', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '■', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '■ ● ● ■ ● ● ■ ? тізбегінде не келеді? (■ немесе ●)', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '■ ● ● ■ ● ● ■ ? тізбегінде не келеді? (■ немесе ●)', 'short_answer', '"●"'::jsonb, 'Шаршыдан кейін екі дөңгелек келеді.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '● ▲ ■ ● ▲ ■ ● ? тізбегінде не келеді?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '● ▲ ■ ● ▲ ■ ● ? тізбегінде не келеді?', 'multiple_choice', '"▲"'::jsonb, 'Үш фигура қайталанады: ● ▲ ■.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '▲', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '●', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '■', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '▲ ■ ▲ ■ ? тізбегінде не келеді? (▲ немесе ■)', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '▲ ■ ▲ ■ ? тізбегінде не келеді? (▲ немесе ■)', 'short_answer', '"▲"'::jsonb, 'Үшбұрыш пен шаршы кезектеседі.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Жолдың қосындысы 15 болуы керек: 8 + 1 + ? = 15. Жасырын санды тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Сиқырлы фигураларға сандарды толтыру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Жолдың қосындысы 15 болуы керек: 8 + 1 + ? = 15. Жасырын санды тап.', 'short_answer', '6'::jsonb, '15 − 8 − 1 = 6.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сиқырлы фигураларға сандарды толтыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Жолдың қосындысы 15 болуы керек: 4 + ? + 2 = 15. Жасырын санды тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Сиқырлы фигураларға сандарды толтыру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Жолдың қосындысы 15 болуы керек: 4 + ? + 2 = 15. Жасырын санды тап.', 'short_answer', '9'::jsonb, '15 − 4 − 2 = 9.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сиқырлы фигураларға сандарды толтыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '3 + 5 + 7 жолының қосындысы қанша?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Сиқырлы фигураларға сандарды толтыру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 + 5 + 7 жолының қосындысы қанша?', 'multiple_choice', '"15"'::jsonb, '3 + 5 + 7 = 15.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сиқырлы фигураларға сандарды толтыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '15', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сиқырлы фигураларға сандарды толтыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '14', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сиқырлы фигураларға сандарды толтыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '16', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Сиқырлы фигураларға сандарды толтыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '9 + ? + 1 = 15. Жасырын санды тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Сиқырлы фигураларға сандарды толтыру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '9 + ? + 1 = 15. Жасырын санды тап.', 'short_answer', '5'::jsonb, '15 − 9 − 1 = 5.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сиқырлы фигураларға сандарды толтыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '2 + 7 + ? = 15. Жасырын санды тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Сиқырлы фигураларға сандарды толтыру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 + 7 + ? = 15. Жасырын санды тап.', 'short_answer', '6'::jsonb, '15 − 2 − 7 = 6.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сиқырлы фигураларға сандарды толтыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '5 + 4 өрнегін тиісті санмен сәйкестендір: мәнін жаз.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5 + 4 өрнегін тиісті санмен сәйкестендір: мәнін жаз.', 'short_answer', '9'::jsonb, '5 + 4 = 9.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '12 − 7 өрнегіне сәйкес санды жаз.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '12 − 7 өрнегіне сәйкес санды жаз.', 'short_answer', '5'::jsonb, '12 − 7 = 5.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '6 + 8 өрнегіне қай сан сәйкес?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6 + 8 өрнегіне қай сан сәйкес?', 'multiple_choice', '"14"'::jsonb, '6 + 8 = 14.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '14', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '13', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '15', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '9 + 3 өрнегіне сәйкес санды жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '9 + 3 өрнегіне сәйкес санды жаз.', 'short_answer', '12'::jsonb, '9 + 3 = 12.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '15 − 6 өрнегіне қай сан сәйкес?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '15 − 6 өрнегіне қай сан сәйкес?', 'multiple_choice', '"9"'::jsonb, '15 − 6 = 9.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '9', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '8', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '10', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Есептеу және сәйкестендіру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Талпында 7 алма бар еді, досы тағы 4 алма берді. Барлығы неше алма?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Мәтін есептер' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпында 7 алма бар еді, досы тағы 4 алма берді. Барлығы неше алма?', 'short_answer', '11'::jsonb, '7 + 4 = 11.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мәтін есептер' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Қорапта 13 текше болды, 5-еуін алды. Неше текше қалды?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Мәтін есептер' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қорапта 13 текше болды, 5-еуін алды. Неше текше қалды?', 'short_answer', '8'::jsonb, '13 − 5 = 8.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мәтін есептер' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '6 балаға тағы 3 бала қосылды. Барлығы неше бала?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Мәтін есептер' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6 балаға тағы 3 бала қосылды. Барлығы неше бала?', 'multiple_choice', '"9"'::jsonb, '6 + 3 = 9.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мәтін есептер' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '9', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Мәтін есептер' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '8', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Мәтін есептер' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '10', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Мәтін есептер' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '10 шардың 4-еуі жарылды. Неше шар қалды?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Мәтін есептер' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '10 шардың 4-еуі жарылды. Неше шар қалды?', 'short_answer', '6'::jsonb, '10 − 4 = 6.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мәтін есептер' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Талпын 8 балық көрді, кейін тағы 5 балық көрді. Барлығы неше балық?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Мәтін есептер' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпын 8 балық көрді, кейін тағы 5 балық көрді. Барлығы неше балық?', 'short_answer', '13'::jsonb, '8 + 5 = 13.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мәтін есептер' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '7 + 6 нәтижесін жаз.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '7 + 6 нәтижесін жаз.', 'short_answer', '13'::jsonb, '7 + 6 = 13.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '16 − 8 нәтижесін жаз.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '16 − 8 нәтижесін жаз.', 'short_answer', '8'::jsonb, '16 − 8 = 8.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '9 + 8 нешеге тең?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '9 + 8 нешеге тең?', 'multiple_choice', '"17"'::jsonb, '9 + 8 = 17.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '17', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '16', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '18', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '14 − 5 нәтижесін жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '14 − 5 нәтижесін жаз.', 'short_answer', '9'::jsonb, '14 − 5 = 9.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '8 + 7 нешеге тең?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '8 + 7 нешеге тең?', 'multiple_choice', '"15"'::jsonb, '8 + 7 = 15.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '15', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '14', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '16', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Жылдам есептеу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

commit;

