-- Talpyn — 1-сынып, негізгі математика
-- «10 көлеміндегі сандардың құрамы» толық интерактив сабағы.
-- Бұл миграция тек осы бір тақырыптың бұрынғы сабақ блоктарын ауыстырады.

begin;

do $$
begin
  if not exists (
    select 1 from public.topics
    where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base'
  ) then
    raise exception 'Тақырып табылмады: 10 көлеміндегі сандардың құрамы';
  end if;
end $$;

delete from public.lesson_blocks
where topic_id = (
  select id from public.topics
  where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base'
  limit 1
);

update public.topics
set
  status = 'published',
  description = '10 көлеміндегі сандарды екі бөлікке жіктеу және сан құрамын әртүрлі тәсілмен көрсету.',
  learning_objective = '10 көлеміндегі сандардың құрамын анықтау, санды екі қосылғыштың қосындысы түрінде құрастыру және білімін қарапайым жағдаятта қолдану.'
where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

-- 1. КӨР: Талпынның қысқа теориясы мен үлгілері.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'kor', 'text', 'Талпынмен бірге үйренейік', null,
  jsonb_build_object(
    'kind', 'story',
    'slides', jsonb_build_array(
      'Сәлем! Мен — Талпын. Бүгін сандардың қандай бөліктерден құралатынын зерттейміз.',
      'Сан құрамы — бір санды құрайтын екі бөлікті көрсету. Мысалы: 5 саны 2 мен 3-тен құралады.',
      '5 = 2 + 3. Бөліктердің орнын ауыстырсақ та, жалпы саны өзгермейді: 5 = 3 + 2.',
      '10 санын да әртүрлі жұппен құрауға болады: 1 мен 9, 2 мен 8, 3 пен 7, 4 пен 6, 5 пен 5.',
      'Мысал: 7 алманың 4-еуі қызыл, 3-еуі жасыл. Сондықтан 7 = 4 + 3.',
      'Талпынның ережесі: екі бөлікті қосқанда жалпы сан шығуы керек. Енді өзің құрастырып көр!'
    )
  ), 0
from public.topics
where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

-- 2. ҚҰРАСТЫР: 10 санын екі топқа өздігінен бөлу.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'qurastyr', 'number_builder', '10 санын құрастыр',
  'Бірінші топтағы заттар санын өзгертіп көр. Екі топтың қосындысы әрқашан 10 болсын.',
  jsonb_build_object('kind', 'combine-split', 'total', 10, 'startLeft', 4), 0
from public.topics
where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

-- 3. ТҮСІНДІР: оқушы өз ойын айтады.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'tusindir', 'short_answer', 'Талпынға түсіндір',
  '10 санын қандай екі саннан құрауға болады? Бір мысал жазып, неліктен дұрыс екенін түсіндір.',
  jsonb_build_object('placeholder', 'Мысалы: 10 = ... + ...'), 0
from public.topics
where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

-- 4. ҚОЛДАН: бағытталған өмірлік есеп.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'qoldan', 'question', 'Талпынмен бірге шығар',
  'Себетте барлығы 10 алма бар. Оның 6-еуі қызыл. Нешеуі жасыл?',
  jsonb_build_object('total', 10, 'known', 6, 'knownLabel', 'қызыл алма', 'unknownLabel', 'жасыл алма'), 0
from public.topics
where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select lb.id, lb.content, 'short_answer', to_jsonb(4),
  '6 + 4 = 10. Демек, 4 жасыл алма бар.',
  'Талпынның кеңесі: 6-дан кейін 10-ға дейін санап көр.', 1
from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base'
  and lb.stage = 'qoldan' and lb.sort_order = 0;

-- 5. БЕКІТ: 10 түрлі интерактив тапсырма.

-- 1) Бос орынды толтыру.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'bekit', 'fill_blank', 'Бос орынды толтыр', 'Жетпейтін санды жаз.',
  jsonb_build_object('template', '7 + ___ = 10', 'answers', jsonb_build_array('3')), 0
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select lb.id, '7 + ___ = 10', 'fill_blank', jsonb_build_array('3'),
  '7 + 3 = 10.', '7-ден кейін 10-ға дейін сана.', 1
from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base' and lb.stage = 'bekit' and lb.sort_order = 0;

-- 2) Дұрыс жауапты таңдау.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, sort_order)
select id, 'bekit', 'multiple_choice', 'Дұрыс жұпты таңда', 'Қай жұп 10 санын құрайды?', 1
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select lb.id, lb.content, 'multiple_choice', to_jsonb('4 + 6'::text),
  '4 + 6 = 10.', 'Әр жұптағы сандарды қос.', 1
from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base' and lb.stage = 'bekit' and lb.sort_order = 1;

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select q.id, v.answer, v.correct, v.ord
from public.questions q
join public.lesson_blocks lb on lb.id = q.lesson_block_id
join public.topics t on t.id = lb.topic_id
cross join (values ('4 + 6', true, 0), ('3 + 6', false, 1), ('5 + 6', false, 2), ('2 + 7', false, 3)) v(answer, correct, ord)
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base' and lb.stage = 'bekit' and lb.sort_order = 1;

-- 3) Жұптарды сәйкестендіру.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'bekit', 'matching', 'Жұбын тап', 'Қосындысы 10 болатын сандарды сәйкестендір.',
  jsonb_build_object('pairs', jsonb_build_array(
    jsonb_build_array(1,9), jsonb_build_array(2,8), jsonb_build_array(3,7), jsonb_build_array(4,6)
  )), 2
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

-- 4) Сүйреп дұрыс ретке орналастыру.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'bekit', 'ordering', 'Ретке орналастыр',
  'Теңдіктерді бірінші қосылғышы кішіден үлкенге қарай ретте.',
  jsonb_build_object('items', jsonb_build_array('1 + 9', '3 + 7', '5 + 5', '7 + 3', '9 + 1')), 3
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

-- 5) Сүйреп екі топқа бөлу.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'bekit', 'drag_drop', 'Топтарға бөл', 'Өрнектерді дұрыс топқа сүйреп орналастыр.',
  jsonb_build_object(
    'groupALabel', 'Қосындысы 10', 'groupBLabel', 'Қосындысы 10 емес',
    'items', jsonb_build_array(
      jsonb_build_object('label','2 + 8','group','a'),
      jsonb_build_object('label','4 + 5','group','b'),
      jsonb_build_object('label','6 + 4','group','a'),
      jsonb_build_object('label','7 + 2','group','b'),
      jsonb_build_object('label','9 + 1','group','a'),
      jsonb_build_object('label','3 + 6','group','b')
    )
  ), 4
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

-- 6) Өрнекті текшелерден құрастыру.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'bekit', 'question', 'Өрнек құрастыр', '6 мен 4 сандары 10-ды құрайтын теңдікті жина.',
  jsonb_build_object(
    'kind','expression_builder',
    'tiles',jsonb_build_array('6','4','10','+','−','='),
    'target',jsonb_build_array('6','+','4','=','10')
  ), 5
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select lb.id, lb.content, 'expression_builder', to_jsonb('6 + 4 = 10'::text),
  '6 + 4 = 10.', 'Алдымен 6, содан кейін қосу таңбасы мен 4 санын таңда.', 1
from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base' and lb.stage = 'bekit' and lb.sort_order = 5;

-- 7) Қате қадамды табу.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'bekit', 'question', 'Қатені тап', 'Талпынның шешіміндегі қате жолды таңда.',
  jsonb_build_object(
    'kind','find_error',
    'steps',jsonb_build_array('8-ге 2-ні қосамыз.', '8 + 2 = 11.', 'Дұрыс қосынды 10 болуы керек.'),
    'errorIndex',1
  ), 6
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select lb.id, lb.content, 'find_error', to_jsonb(1),
  'Екінші жол қате: 8 + 2 = 10.', '8-ден кейін екі қадам сана: 9, 10.', 1
from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base' and lb.stage = 'bekit' and lb.sort_order = 6;

-- 8) Қысқа жауап.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, sort_order)
select id, 'bekit', 'short_answer', 'Жасырын сан', '10 = 9 + ?. Жасырын санды жаз.', 7
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select lb.id, lb.content, 'short_answer', to_jsonb(1),
  '9 + 1 = 10.', '9-дан кейін қандай сан келеді?', 1
from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base' and lb.stage = 'bekit' and lb.sort_order = 7;

-- 9) Басқа санның құрамын қолдану.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, sort_order)
select id, 'bekit', 'multiple_choice', '8 санын құрастыр', 'Қай жұп 8 санын құрайды?', 8
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select lb.id, lb.content, 'multiple_choice', to_jsonb('5 + 3'::text),
  '5 + 3 = 8.', 'Жауабы 8 болатын жұпты тап.', 1
from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base' and lb.stage = 'bekit' and lb.sort_order = 8;

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select q.id, v.answer, v.correct, v.ord
from public.questions q
join public.lesson_blocks lb on lb.id = q.lesson_block_id
join public.topics t on t.id = lb.topic_id
cross join (values ('5 + 3', true, 0), ('5 + 2', false, 1), ('4 + 3', false, 2), ('6 + 3', false, 3)) v(answer, correct, ord)
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base' and lb.stage = 'bekit' and lb.sort_order = 8;

-- 10) Өмірлік жағдаят.
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'bekit', 'fill_blank', 'Өмірлік есеп', 'Сурет салу сабағында 10 қарындаштың 8-і қолданылды.',
  jsonb_build_object(
    'template','Қорапта ___ қарындаш қалды.',
    'answers',jsonb_build_array('2')
  ), 9
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select lb.id, '10 қарындаштың 8-і қолданылды. Қорапта ___ қарындаш қалды.', 'fill_blank', jsonb_build_array('2'),
  '10 саны 8 бен 2-ден құралады: 10 − 8 = 2.', '8-ден 10-ға дейін санап көр.', 1
from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base' and lb.stage = 'bekit' and lb.sort_order = 9;

commit;
