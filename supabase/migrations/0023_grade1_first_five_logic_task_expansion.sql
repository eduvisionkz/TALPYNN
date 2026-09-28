-- Additional reviewed tasks for the first five logic topics. Run migrations in numeric order.

begin;

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Талпын 4 қызыл және 5 көк текшені санады. Барлығы неше текше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Заттарды санау' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпын 4 қызыл және 5 көк текшені санады. Барлығы неше текше?', 'short_answer', '9'::jsonb, '4 + 5 = 9.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Заттарды санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Сөреде 3 кітап, үстелде 2 кітап бар. Барлығы неше кітап?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Заттарды санау' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Сөреде 3 кітап, үстелде 2 кітап бар. Барлығы неше кітап?', 'short_answer', '5'::jsonb, '3 + 2 = 5.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Заттарды санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '5 доп пен 4 доп бар. Барлығы неше доп?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Заттарды санау' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5 доп пен 4 доп бар. Барлығы неше доп?', 'multiple_choice', '"9"'::jsonb, '5 + 4 = 9.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Заттарды санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '9', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Заттарды санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '8', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Заттарды санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '10', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Заттарды санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Талпын бір қатардағы 7, екінші қатардағы 2 гүлді санады. Барлығы неше гүл?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Заттарды санау' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпын бір қатардағы 7, екінші қатардағы 2 гүлді санады. Барлығы неше гүл?', 'short_answer', '9'::jsonb, '7 + 2 = 9.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Заттарды санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Қорапта 8 қарындаш, сыртта 2 қарындаш жатыр. Барлығы неше қарындаш?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Заттарды санау' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қорапта 8 қарындаш, сыртта 2 қарындаш жатыр. Барлығы неше қарындаш?', 'short_answer', '10'::jsonb, '8 + 2 = 10.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Заттарды санау' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Бірінші себетте 8, екіншісінде 5 алма бар. Бірінші себетте неше алма артық?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бірінші себетте 8, екіншісінде 5 алма бар. Бірінші себетте неше алма артық?', 'short_answer', '3'::jsonb, '8 − 5 = 3.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '4 жұлдызша мен 6 жұлдызшаның қай тобында зат көп?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 жұлдызша мен 6 жұлдызшаның қай тобында зат көп?', 'multiple_choice', '"6 жұлдызша"'::jsonb, '6 > 4.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '6 жұлдызша', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '4 жұлдызша', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'тең', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Талпында 9 кітап, досында 7 кітап бар. Талпында неше кітап артық?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпында 9 кітап, досында 7 кітап бар. Талпында неше кітап артық?', 'short_answer', '2'::jsonb, '9 − 7 = 2.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Екі себетте 5-тен алмадан бар. Заттар саны қалай салыстырылады?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Екі себетте 5-тен алмадан бар. Заттар саны қалай салыстырылады?', 'multiple_choice', '"тең"'::jsonb, '5 = 5.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'тең', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'біріншісінде көп', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'екіншісінде көп', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Бір топта 3, екінші топта 7 оқушы бар. Екінші топта неше оқушы артық?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бір топта 3, екінші топта 7 оқушы бар. Екінші топта неше оқушы артық?', 'short_answer', '4'::jsonb, '7 − 3 = 4.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '2 жасыл және 5 сары текшені біріктірді. Неше текше болды?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 жасыл және 5 сары текшені біріктірді. Неше текше болды?', 'short_answer', '7'::jsonb, '2 + 5 = 7.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '10 шардың 3-еуін бөліп алды. Неше шар қалды?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '10 шардың 3-еуін бөліп алды. Неше шар қалды?', 'short_answer', '7'::jsonb, '10 − 3 = 7.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '4 алмаға тағы 3 алма қосты. Барлығы неше алма?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 алмаға тағы 3 алма қосты. Барлығы неше алма?', 'multiple_choice', '"7"'::jsonb, '4 + 3 = 7.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '7', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '6', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '8', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '8 ойыншықтың 5-еуін алып қойды. Неше ойыншық қалды?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '8 ойыншықтың 5-еуін алып қойды. Неше ойыншық қалды?', 'short_answer', '3'::jsonb, '8 − 5 = 3.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Бір топтан 2 затты алып тастағанда қай амалды қолданамыз?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бір топтан 2 затты алып тастағанда қай амалды қолданамыз?', 'multiple_choice', '"азайту"'::jsonb, 'Бөліп алу — азайту.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'азайту', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'қосу', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'салыстыру', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Біріктіру және бөліп алу' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Қатарда 6 балық бар. Олардың мөлшерін білдіретін санды жаз.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қатарда 6 балық бар. Олардың мөлшерін білдіретін санды жаз.', 'short_answer', '6'::jsonb, '6 балықтың мөлшері 6 санымен беріледі.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Үстелде 4 кітап пен 2 дәптер жатыр. Заттардың жалпы санын жаз.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Үстелде 4 кітап пен 2 дәптер жатыр. Заттардың жалпы санын жаз.', 'short_answer', '6'::jsonb, '4 + 2 = 6 зат.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Жеті заттың мөлшерін қай сан білдіреді?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Жеті заттың мөлшерін қай сан білдіреді?', 'multiple_choice', '"7"'::jsonb, 'Жеті заттың саны 7 болады.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '7', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '6', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '8', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', 'Талпын 9 жаңғақтың 3-еуін берді. Қалған жаңғақтың санын жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпын 9 жаңғақтың 3-еуін берді. Қалған жаңғақтың санын жаз.', 'short_answer', '6'::jsonb, '9 − 3 = 6.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', 'Қайсысы 5 затты білдіреді?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қайсысы 5 затты білдіреді?', 'multiple_choice', '"5"'::jsonb, 'Бес заттың мөлшерін 5 саны білдіреді.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '5', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '4', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '6', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = 'Мөлшер және сан' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '4 санынан кейін қандай сан келеді?', '{}'::jsonb, 5
from public.topics tp where tp.title = '1–10 көлеміндегі сандар' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 санынан кейін қандай сан келеді?', 'short_answer', '5'::jsonb, '4-тен кейін 5 келеді.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1–10 көлеміндегі сандар' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '7 санынан бұрын қандай сан тұрады?', '{}'::jsonb, 6
from public.topics tp where tp.title = '1–10 көлеміндегі сандар' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '7 санынан бұрын қандай сан тұрады?', 'short_answer', '6'::jsonb, '7-ден бұрын 6 тұрады.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1–10 көлеміндегі сандар' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'multiple_choice', 'Дұрыс жауапты таңда', '3, 4, ?, 6 тізбегінде қай сан жасырынған?', '{}'::jsonb, 7
from public.topics tp where tp.title = '1–10 көлеміндегі сандар' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3, 4, ?, 6 тізбегінде қай сан жасырынған?', 'multiple_choice', '"5"'::jsonb, '4 пен 6 аралығында 5 орналасқан.', 'Заттарды мұқият салыстыр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1–10 көлеміндегі сандар' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '5', true, 0 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = '1–10 көлеміндегі сандар' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '4', false, 1 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = '1–10 көлеміндегі сандар' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '7', false, 2 from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where tp.title = '1–10 көлеміндегі сандар' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=2);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '1-ден 10-ға дейін барлығы неше бүтін сан бар?', '{}'::jsonb, 8
from public.topics tp where tp.title = '1–10 көлеміндегі сандар' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1-ден 10-ға дейін барлығы неше бүтін сан бар?', 'short_answer', '10'::jsonb, '1, 2, 3, 4, 5, 6, 7, 8, 9, 10 — он сан.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1–10 көлеміндегі сандар' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Санап жауап бер', '9 санынан кейін қандай сан келеді?', '{}'::jsonb, 9
from public.topics tp where tp.title = '1–10 көлеміндегі сандар' and tp.grade = 1 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '9 санынан кейін қандай сан келеді?', 'short_answer', '10'::jsonb, '9-дан кейін 10 келеді.', 'Бір-бірлеп санап көр.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = '1–10 көлеміндегі сандар' and tp.grade = 1 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

commit;

