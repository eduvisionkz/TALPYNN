-- Talpyn — publishes and fully populates the one lesson the brief asks
-- to be completely interactive: "10 көлеміндегі сандардың құрамы"
-- (1-сынып, Негізгі математика). Every other topic stays a draft with
-- no lesson_blocks, to be filled in by a teacher through the
-- constructor — per the brief, we do not fabricate content for the
-- other 112 topics.

update public.topics
set
  status = 'published',
  learning_objective = '10 санын екі қосылғыштың қосындысы түрінде әр түрлі жолмен көрсете білу.',
  cover_url = '/infographics/ten-composition.png'
where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

-- ---------------------------------------------------------------------
-- Көр
-- ---------------------------------------------------------------------
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, media_url, configuration, sort_order)
select id, 'kor', 'infographic',
  '10 санының құрамы',
  '10 санын әртүрлі екі қосылғыштың қосындысы ретінде көрсетуге болады. Талпын әр жұпты кезек-кезек көрсетеді.',
  '/infographics/ten-composition.png',
  jsonb_build_object(
    'pairs', jsonb_build_array(
      jsonb_build_array(1,9), jsonb_build_array(2,8), jsonb_build_array(3,7),
      jsonb_build_array(4,6), jsonb_build_array(5,5), jsonb_build_array(6,4),
      jsonb_build_array(7,3), jsonb_build_array(8,2), jsonb_build_array(9,1)
    )
  ),
  0
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

-- ---------------------------------------------------------------------
-- Құрастыр — the number-builder block. Configuration is read directly
-- by <NumberBuilder /> (src/features/lesson/NumberBuilder.tsx).
-- ---------------------------------------------------------------------
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'qurastyr', 'number_builder',
  'Топтарды құрастыр',
  'Бірінші топтағы заттар санын өзгертіп көр. Екінші топ автоматты түрде өзгереді — қосындысы әрқашан 10.',
  jsonb_build_object('total', 10, 'startLeft', 5),
  0
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

-- ---------------------------------------------------------------------
-- Түсіндір
-- ---------------------------------------------------------------------
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'tusindir', 'short_answer',
  'Өз сөзіңмен түсіндір',
  'Неліктен бірінші топтағы заттар көбейгенде, екінші топтағы заттар азаяды?',
  jsonb_build_object(
    'placeholder', 'Өз жауабыңды осында жаз...',
    'sampleAnswer', 'Себебі жалпы саны әрқашан 10-мен тең болады, бір топқа қосылған зат екінші топтан кемиді.'
  ),
  0
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

-- ---------------------------------------------------------------------
-- Қолдан
-- ---------------------------------------------------------------------
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'qoldan', 'question',
  'Өмірлік жағдаят',
  'Қорапта барлығы 10 қарындаш болуы керек. Оның 3-еуі көк. Нешеуі сары?',
  jsonb_build_object('total', 10, 'known', 3, 'knownLabel', 'көк', 'unknownLabel', 'сары'),
  0
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select lb.id,
  'Қорапта барлығы 10 қарындаш болуы керек. Оның 3-еуі көк. Нешеуі сары?',
  'short_answer',
  '"7"'::jsonb,
  '10 − 3 = 7. Себебі көк пен сары қарындаштардың қосындысы әрқашан 10-ға тең.',
  '10 санынан көк қарындаштар санын азайтып көр.',
  1
from public.lesson_blocks lb
join public.topics t on t.id = lb.topic_id
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base' and lb.stage = 'qoldan';

-- ---------------------------------------------------------------------
-- Бекіт — 5 short tasks of different formats, as required.
-- ---------------------------------------------------------------------

-- Block 1: fill-in-the-gap
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, sort_order)
select id, 'bekit', 'short_answer', 'Бос орынды толтыр', '6 + ... = 10', 0
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select lb.id, '6 + ... = 10', 'short_answer', '"4"'::jsonb,
  '6 + 4 = 10.', '10-нан 6-ны азайтып көр.', 1
from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base'
  and lb.stage = 'bekit' and lb.title = 'Бос орынды толтыр';

-- Block 2: choose the matching pair
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, sort_order)
select id, 'bekit', 'multiple_choice', 'Дұрыс жұпты тап', '10 санын құрайтын жұпты таңда', 1
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select lb.id, '10 санын құрайтын жұпты таңда', 'multiple_choice', '"4+6"'::jsonb,
  '4 + 6 = 10.', 'Әр жұптың қосындысын есепте.', 1
from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base'
  and lb.stage = 'bekit' and lb.title = 'Дұрыс жұпты тап';

insert into public.question_options (question_id, option_text, is_correct, sort_order)
select q.id, opt.text, opt.is_correct, opt.ord
from public.questions q
join public.lesson_blocks lb on lb.id = q.lesson_block_id
join public.topics t on t.id = lb.topic_id
cross join (values ('4+6', true, 0), ('3+8', false, 1), ('5+6', false, 2), ('2+7', false, 3)) as opt(text, is_correct, ord)
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base'
  and lb.stage = 'bekit' and lb.title = 'Дұрыс жұпты тап';

-- Block 3: matching
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'bekit', 'matching', 'Сәйкестендір', 'Әр санды жұбымен сәйкестендір (қосындысы 10)',
  jsonb_build_object('pairs', jsonb_build_array(
    jsonb_build_array(1,9), jsonb_build_array(3,7), jsonb_build_array(4,6), jsonb_build_array(5,5)
  )),
  2
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

-- Block 4: find the error
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, sort_order)
select id, 'bekit', 'short_answer', 'Қатені тап', 'Талпын мына теңдікті жазды: 8 + 3 = 10. Мұнда қате бар. Дұрыс жауапты жаз.', 3
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select lb.id, '8 + 3 = 10 теңдігіндегі қатені түзет: 8 + ... = 10', 'short_answer', '"2"'::jsonb,
  '8 + 2 = 10, ал 8 + 3 = 11.', '10-нан 8-ді азайт.', 1
from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base'
  and lb.stage = 'bekit' and lb.title = 'Қатені тап';

-- Block 5: practical task
insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select id, 'bekit', 'question', 'Практикалық тапсырма',
  'Себетте 10 алма болуы керек. Ішінде 6 қызыл алма жатыр. Нешеуі жасыл болуы керек?',
  jsonb_build_object('total', 10, 'known', 6, 'knownLabel', 'қызыл', 'unknownLabel', 'жасыл'),
  4
from public.topics where title = '10 көлеміндегі сандардың құрамы' and grade = 1 and track = 'base';

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select lb.id, 'Себетте 10 алма болуы керек. Ішінде 6 қызыл алма жатыр. Нешеуі жасыл болуы керек?', 'short_answer', '"4"'::jsonb,
  '10 − 6 = 4.', '10-нан 6-ны азайт.', 1
from public.lesson_blocks lb join public.topics t on t.id = lb.topic_id
where t.title = '10 көлеміндегі сандардың құрамы' and t.grade = 1 and t.track = 'base'
  and lb.stage = 'bekit' and lb.title = 'Практикалық тапсырма';
