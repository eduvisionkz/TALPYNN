-- Replace unrelated fifth matching tasks with topic-specific choices. Do not overwrite edited tasks.

begin;

update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = 'Талпын 7 см және 5 см кесіндіні өлшеді. Біріншісі неше сантиметр ұзын?', configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпын 7 см және 5 см кесіндіні өлшеді. Біріншісі неше сантиметр ұзын?', 'multiple_choice', '"2"'::jsonb, '7 − 5 = 2 см.', 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = 'Талпын 7 см және 5 см кесіндіні өлшеді. Біріншісі неше сантиметр ұзын?'
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '2', true, 0 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Талпын 7 см және 5 см кесіндіні өлшеді. Біріншісі неше сантиметр ұзын?' and qq.question_text = 'Талпын 7 см және 5 см кесіндіні өлшеді. Біріншісі неше сантиметр ұзын?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '12', false, 1 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Талпын 7 см және 5 см кесіндіні өлшеді. Біріншісі неше сантиметр ұзын?' and qq.question_text = 'Талпын 7 см және 5 см кесіндіні өлшеді. Біріншісі неше сантиметр ұзын?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '5', false, 2 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Талпын 7 см және 5 см кесіндіні өлшеді. Біріншісі неше сантиметр ұзын?' and qq.question_text = 'Талпын 7 см және 5 см кесіндіні өлшеді. Біріншісі неше сантиметр ұзын?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 2);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '7', false, 3 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Ұзындықты өлшеу және салыстыру' and tp.grade = 1 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Талпын 7 см және 5 см кесіндіні өлшеді. Біріншісі неше сантиметр ұзын?' and qq.question_text = 'Талпын 7 см және 5 см кесіндіні өлшеді. Біріншісі неше сантиметр ұзын?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 3);

update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = 'Төртбұрыштың неше төбесі бар?', configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Төртбұрыштың неше төбесі бар?', 'multiple_choice', '"4"'::jsonb, 'Төртбұрыштың 4 төбесі бар.', 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = 'Төртбұрыштың неше төбесі бар?'
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '4', true, 0 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Төртбұрыштың неше төбесі бар?' and qq.question_text = 'Төртбұрыштың неше төбесі бар?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '3', false, 1 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Төртбұрыштың неше төбесі бар?' and qq.question_text = 'Төртбұрыштың неше төбесі бар?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '5', false, 2 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Төртбұрыштың неше төбесі бар?' and qq.question_text = 'Төртбұрыштың неше төбесі бар?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 2);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '6', false, 3 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Геометриялық фигуралар және олардың қасиеттері' and tp.grade = 1 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Төртбұрыштың неше төбесі бар?' and qq.question_text = 'Төртбұрыштың неше төбесі бар?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 3);

update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = 'Талпында 9 текше, ал досында 6 текше бар. Кімде текше көбірек?', configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Талпында 9 текше, ал досында 6 текше бар. Кімде текше көбірек?', 'multiple_choice', '"Талпында"'::jsonb, '9 > 6, сондықтан Талпында көбірек.', 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = 'Талпында 9 текше, ал досында 6 текше бар. Кімде текше көбірек?'
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Талпында', true, 0 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Талпында 9 текше, ал досында 6 текше бар. Кімде текше көбірек?' and qq.question_text = 'Талпында 9 текше, ал досында 6 текше бар. Кімде текше көбірек?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'досында', false, 1 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Талпында 9 текше, ал досында 6 текше бар. Кімде текше көбірек?' and qq.question_text = 'Талпында 9 текше, ал досында 6 текше бар. Кімде текше көбірек?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'екеуінде тең', false, 2 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Талпында 9 текше, ал досында 6 текше бар. Кімде текше көбірек?' and qq.question_text = 'Талпында 9 текше, ал досында 6 текше бар. Кімде текше көбірек?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 2);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'анықтау мүмкін емес', false, 3 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Заттарды салыстыру' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Талпында 9 текше, ал досында 6 текше бар. Кімде текше көбірек?' and qq.question_text = 'Талпында 9 текше, ал досында 6 текше бар. Кімде текше көбірек?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 3);

update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = 'Сапта Талпын 5-ші тұр. Оның алдында неше оқушы бар?', configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Сапта Талпын 5-ші тұр. Оның алдында неше оқушы бар?', 'multiple_choice', '"4"'::jsonb, 'Бесінші оқушының алдында төрт оқушы тұрады.', 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = 'Сапта Талпын 5-ші тұр. Оның алдында неше оқушы бар?'
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '4', true, 0 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Сапта Талпын 5-ші тұр. Оның алдында неше оқушы бар?' and qq.question_text = 'Сапта Талпын 5-ші тұр. Оның алдында неше оқушы бар?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '5', false, 1 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Сапта Талпын 5-ші тұр. Оның алдында неше оқушы бар?' and qq.question_text = 'Сапта Талпын 5-ші тұр. Оның алдында неше оқушы бар?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '6', false, 2 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Сапта Талпын 5-ші тұр. Оның алдында неше оқушы бар?' and qq.question_text = 'Сапта Талпын 5-ші тұр. Оның алдында неше оқушы бар?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 2);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '3', false, 3 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Неше? Нешінші?' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Сапта Талпын 5-ші тұр. Оның алдында неше оқушы бар?' and qq.question_text = 'Сапта Талпын 5-ші тұр. Оның алдында неше оқушы бар?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 3);

update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = 'Қай фигураның түзу қабырғасы жоқ?', configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қай фигураның түзу қабырғасы жоқ?', 'multiple_choice', '"Дөңгелек"'::jsonb, 'Дөңгелекте түзу қабырға жоқ.', 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = 'Қай фигураның түзу қабырғасы жоқ?'
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Дөңгелек', true, 0 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Қай фигураның түзу қабырғасы жоқ?' and qq.question_text = 'Қай фигураның түзу қабырғасы жоқ?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Шаршы', false, 1 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Қай фигураның түзу қабырғасы жоқ?' and qq.question_text = 'Қай фигураның түзу қабырғасы жоқ?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Үшбұрыш', false, 2 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Қай фигураның түзу қабырғасы жоқ?' and qq.question_text = 'Қай фигураның түзу қабырғасы жоқ?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 2);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Тіктөртбұрыш', false, 3 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Қарапайым фигураларды тану' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Қай фигураның түзу қабырғасы жоқ?' and qq.question_text = 'Қай фигураның түзу қабырғасы жоқ?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 3);

update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = 'Қатар: үшбұрыш, шаршы, үшбұрыш, шаршы, ... Келесі фигура қандай?', configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қатар: үшбұрыш, шаршы, үшбұрыш, шаршы, ... Келесі фигура қандай?', 'multiple_choice', '"үшбұрыш"'::jsonb, 'Екі фигура кезектесіп қайталанады.', 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = 'Қатар: үшбұрыш, шаршы, үшбұрыш, шаршы, ... Келесі фигура қандай?'
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'үшбұрыш', true, 0 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Қатар: үшбұрыш, шаршы, үшбұрыш, шаршы, ... Келесі фигура қандай?' and qq.question_text = 'Қатар: үшбұрыш, шаршы, үшбұрыш, шаршы, ... Келесі фигура қандай?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'шаршы', false, 1 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Қатар: үшбұрыш, шаршы, үшбұрыш, шаршы, ... Келесі фигура қандай?' and qq.question_text = 'Қатар: үшбұрыш, шаршы, үшбұрыш, шаршы, ... Келесі фигура қандай?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'дөңгелек', false, 2 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Қатар: үшбұрыш, шаршы, үшбұрыш, шаршы, ... Келесі фигура қандай?' and qq.question_text = 'Қатар: үшбұрыш, шаршы, үшбұрыш, шаршы, ... Келесі фигура қандай?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 2);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'тіктөртбұрыш', false, 3 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Фигуралардан заңдылықты табу' and tp.grade = 1 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Қатар: үшбұрыш, шаршы, үшбұрыш, шаршы, ... Келесі фигура қандай?' and qq.question_text = 'Қатар: үшбұрыш, шаршы, үшбұрыш, шаршы, ... Келесі фигура қандай?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 3);

update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = 'Ыдыста 8 л су бар. Оның 3 л-ін құйып алса, неше литр қалады?', configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ыдыста 8 л су бар. Оның 3 л-ін құйып алса, неше литр қалады?', 'multiple_choice', '"5"'::jsonb, '8 − 3 = 5 л.', 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = 'Ыдыста 8 л су бар. Оның 3 л-ін құйып алса, неше литр қалады?'
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '5', true, 0 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Ыдыста 8 л су бар. Оның 3 л-ін құйып алса, неше литр қалады?' and qq.question_text = 'Ыдыста 8 л су бар. Оның 3 л-ін құйып алса, неше литр қалады?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '3', false, 1 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Ыдыста 8 л су бар. Оның 3 л-ін құйып алса, неше литр қалады?' and qq.question_text = 'Ыдыста 8 л су бар. Оның 3 л-ін құйып алса, неше литр қалады?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '8', false, 2 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Ыдыста 8 л су бар. Оның 3 л-ін құйып алса, неше литр қалады?' and qq.question_text = 'Ыдыста 8 л су бар. Оның 3 л-ін құйып алса, неше литр қалады?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 2);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '11', false, 3 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Ыдыста 8 л су бар. Оның 3 л-ін құйып алса, неше литр қалады?' and qq.question_text = 'Ыдыста 8 л су бар. Оның 3 л-ін құйып алса, неше литр қалады?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 3);

update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = 'A = {2, 4, 6}, B = {4, 6, 8}. Екі жиынға да ортақ неше сан бар?', configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'A = {2, 4, 6}, B = {4, 6, 8}. Екі жиынға да ортақ неше сан бар?', 'multiple_choice', '"2"'::jsonb, 'Ортақ элементтер — 4 пен 6, барлығы екеу.', 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = 'A = {2, 4, 6}, B = {4, 6, 8}. Екі жиынға да ортақ неше сан бар?'
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '2', true, 0 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'A = {2, 4, 6}, B = {4, 6, 8}. Екі жиынға да ортақ неше сан бар?' and qq.question_text = 'A = {2, 4, 6}, B = {4, 6, 8}. Екі жиынға да ортақ неше сан бар?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '1', false, 1 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'A = {2, 4, 6}, B = {4, 6, 8}. Екі жиынға да ортақ неше сан бар?' and qq.question_text = 'A = {2, 4, 6}, B = {4, 6, 8}. Екі жиынға да ортақ неше сан бар?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '3', false, 2 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'A = {2, 4, 6}, B = {4, 6, 8}. Екі жиынға да ортақ неше сан бар?' and qq.question_text = 'A = {2, 4, 6}, B = {4, 6, 8}. Екі жиынға да ортақ неше сан бар?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 2);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '4', false, 3 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'A = {2, 4, 6}, B = {4, 6, 8}. Екі жиынға да ортақ неше сан бар?' and qq.question_text = 'A = {2, 4, 6}, B = {4, 6, 8}. Екі жиынға да ортақ неше сан бар?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 3);

update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = 'Ағасы 12 жаста. 3 жылдан кейін ол неше жаста болады?', configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ағасы 12 жаста. 3 жылдан кейін ол неше жаста болады?', 'multiple_choice', '"15"'::jsonb, '12 + 3 = 15 жас.', 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = 'Ағасы 12 жаста. 3 жылдан кейін ол неше жаста болады?'
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '15', true, 0 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Ағасы 12 жаста. 3 жылдан кейін ол неше жаста болады?' and qq.question_text = 'Ағасы 12 жаста. 3 жылдан кейін ол неше жаста болады?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '9', false, 1 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Ағасы 12 жаста. 3 жылдан кейін ол неше жаста болады?' and qq.question_text = 'Ағасы 12 жаста. 3 жылдан кейін ол неше жаста болады?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '12', false, 2 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Ағасы 12 жаста. 3 жылдан кейін ол неше жаста болады?' and qq.question_text = 'Ағасы 12 жаста. 3 жылдан кейін ол неше жаста болады?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 2);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '18', false, 3 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Ағасы 12 жаста. 3 жылдан кейін ол неше жаста болады?' and qq.question_text = 'Ағасы 12 жаста. 3 жылдан кейін ол неше жаста болады?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 3);

update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = '«7 жұп сан ЖӘНЕ 7 саны 5-тен үлкен» пайымы дұрыс па?', configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '«7 жұп сан ЖӘНЕ 7 саны 5-тен үлкен» пайымы дұрыс па?', 'multiple_choice', '"Жоқ"'::jsonb, 'Бірінші тұжырым жалған, сондықтан «ЖӘНЕ» арқылы құрылған бүкіл пайым жалған.', 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = '«7 жұп сан ЖӘНЕ 7 саны 5-тен үлкен» пайымы дұрыс па?'
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Жоқ', true, 0 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = '«7 жұп сан ЖӘНЕ 7 саны 5-тен үлкен» пайымы дұрыс па?' and qq.question_text = '«7 жұп сан ЖӘНЕ 7 саны 5-тен үлкен» пайымы дұрыс па?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Иә', false, 1 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = '«7 жұп сан ЖӘНЕ 7 саны 5-тен үлкен» пайымы дұрыс па?' and qq.question_text = '«7 жұп сан ЖӘНЕ 7 саны 5-тен үлкен» пайымы дұрыс па?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Кейде', false, 2 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = '«7 жұп сан ЖӘНЕ 7 саны 5-тен үлкен» пайымы дұрыс па?' and qq.question_text = '«7 жұп сан ЖӘНЕ 7 саны 5-тен үлкен» пайымы дұрыс па?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 2);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, 'Белгісіз', false, 3 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = '«7 жұп сан ЖӘНЕ 7 саны 5-тен үлкен» пайымы дұрыс па?' and qq.question_text = '«7 жұп сан ЖӘНЕ 7 саны 5-тен үлкен» пайымы дұрыс па?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 3);

update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = 'x + y = 12 және x + 2y = 17. Екі теңдікті азайтып, y мәнін тап.', configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x + y = 12 және x + 2y = 17. Екі теңдікті азайтып, y мәнін тап.', 'multiple_choice', '"5"'::jsonb, '(x + 2y) − (x + y) = 17 − 12, демек y = 5.', 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = 'x + y = 12 және x + 2y = 17. Екі теңдікті азайтып, y мәнін тап.'
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '5', true, 0 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'x + y = 12 және x + 2y = 17. Екі теңдікті азайтып, y мәнін тап.' and qq.question_text = 'x + y = 12 және x + 2y = 17. Екі теңдікті азайтып, y мәнін тап.'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '4', false, 1 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'x + y = 12 және x + 2y = 17. Екі теңдікті азайтып, y мәнін тап.' and qq.question_text = 'x + y = 12 және x + 2y = 17. Екі теңдікті азайтып, y мәнін тап.'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '12', false, 2 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'x + y = 12 және x + 2y = 17. Екі теңдікті азайтып, y мәнін тап.' and qq.question_text = 'x + y = 12 және x + 2y = 17. Екі теңдікті азайтып, y мәнін тап.'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 2);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '17', false, 3 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'x + y = 12 және x + 2y = 17. Екі теңдікті азайтып, y мәнін тап.' and qq.question_text = 'x + y = 12 және x + 2y = 17. Екі теңдікті азайтып, y мәнін тап.'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 3);

update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = 'Таразы тең: 3 бірдей текше 18 г тартады. Бір текше неше грамм?', configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Таразы тең: 3 бірдей текше 18 г тартады. Бір текше неше грамм?', 'multiple_choice', '"6"'::jsonb, '18 ÷ 3 = 6 г.', 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = 'Таразы тең: 3 бірдей текше 18 г тартады. Бір текше неше грамм?'
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '6', true, 0 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Таразы тең: 3 бірдей текше 18 г тартады. Бір текше неше грамм?' and qq.question_text = 'Таразы тең: 3 бірдей текше 18 г тартады. Бір текше неше грамм?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '3', false, 1 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Таразы тең: 3 бірдей текше 18 г тартады. Бір текше неше грамм?' and qq.question_text = 'Таразы тең: 3 бірдей текше 18 г тартады. Бір текше неше грамм?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '9', false, 2 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Таразы тең: 3 бірдей текше 18 г тартады. Бір текше неше грамм?' and qq.question_text = 'Таразы тең: 3 бірдей текше 18 г тартады. Бір текше неше грамм?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 2);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '18', false, 3 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = 'Таразы тең: 3 бірдей текше 18 г тартады. Бір текше неше грамм?' and qq.question_text = 'Таразы тең: 3 бірдей текше 18 г тартады. Бір текше неше грамм?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 3);

update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = '10 дәптерді 3 оқушыға бірдей бөліп берсе, неше дәптер артық қалады?', configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '10 дәптерді 3 оқушыға бірдей бөліп берсе, неше дәптер артық қалады?', 'multiple_choice', '"1"'::jsonb, '10 = 3 × 3 + 1, бір дәптер артық қалады.', 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = '10 дәптерді 3 оқушыға бірдей бөліп берсе, неше дәптер артық қалады?'
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '1', true, 0 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = '10 дәптерді 3 оқушыға бірдей бөліп берсе, неше дәптер артық қалады?' and qq.question_text = '10 дәптерді 3 оқушыға бірдей бөліп берсе, неше дәптер артық қалады?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 0);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '0', false, 1 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = '10 дәптерді 3 оқушыға бірдей бөліп берсе, неше дәптер артық қалады?' and qq.question_text = '10 дәптерді 3 оқушыға бірдей бөліп берсе, неше дәптер артық қалады?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 1);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '2', false, 2 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = '10 дәптерді 3 оқушыға бірдей бөліп берсе, неше дәптер артық қалады?' and qq.question_text = '10 дәптерді 3 оқушыға бірдей бөліп берсе, неше дәптер артық қалады?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 2);

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, '3', false, 3 from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic' and b.stage = 'bekit' and b.sort_order = 4 and b.content = '10 дәптерді 3 оқушыға бірдей бөліп берсе, неше дәптер артық қалады?' and qq.question_text = '10 дәптерді 3 оқушыға бірдей бөліп берсе, неше дәптер артық қалады?'
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = 3);

commit;

