-- Additional reviewed tasks for the Grade 4 logic topics. Run migrations in numeric order.

begin;

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '5874 санындағы цифрлар саны нешеу?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Сан және цифр' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5874 санындағы цифрлар саны нешеу?', 'short_answer', '4'::jsonb, '5874 төрт цифрдан тұрады.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сан және цифр' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '6305 санындағы жүздіктер цифрын жаз.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Сан және цифр' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6305 санындағы жүздіктер цифрын жаз.', 'short_answer', '3'::jsonb, '6305 = 6000 + 300 + 5.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сан және цифр' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '2, 0, 5 цифрларын бір реттен қолданып, 2-ден басталатын ең үлкен үш таңбалы санды жаз.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Сан және цифр' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2, 0, 5 цифрларын бір реттен қолданып, 2-ден басталатын ең үлкен үш таңбалы санды жаз.', 'short_answer', '250'::jsonb, '2-ден кейін үлкен 5, соңында 0: 250.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сан және цифр' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '9008 санындағы ондықтар цифрын жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Сан және цифр' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '9008 санындағы ондықтар цифрын жаз.', 'short_answer', '0'::jsonb, 'Ондықтар разрядында 0 тұр.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сан және цифр' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '4, 7, 1 цифрларын бір реттен қолданып, ең кіші үш таңбалы санды жаз.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Сан және цифр' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4, 7, 1 цифрларын бір реттен қолданып, ең кіші үш таңбалы санды жаз.', 'short_answer', '147'::jsonb, 'Ең кіші жүздік — 1, одан кейін 4 және 7.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сан және цифр' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '18 + 7 = 20 + ? . Жасырын санды тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Арифметикалық тепе-теңдіктер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '18 + 7 = 20 + ? . Жасырын санды тап.', 'short_answer', '5'::jsonb, '25 = 20 + 5.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Арифметикалық тепе-теңдіктер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '6 × 4 = 30 − ? . Жасырын санды тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Арифметикалық тепе-теңдіктер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6 × 4 = 30 − ? . Жасырын санды тап.', 'short_answer', '6'::jsonb, '24 = 30 − 6.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Арифметикалық тепе-теңдіктер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '48 ÷ 6 = ? + 3. Жасырын санды тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Арифметикалық тепе-теңдіктер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '48 ÷ 6 = ? + 3. Жасырын санды тап.', 'short_answer', '5'::jsonb, '8 = 5 + 3.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Арифметикалық тепе-теңдіктер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '? × 5 = 100 ÷ 4. Жасырын санды тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Арифметикалық тепе-теңдіктер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '? × 5 = 100 ÷ 4. Жасырын санды тап.', 'short_answer', '5'::jsonb, '100 ÷ 4 = 25; 5 × 5 = 25.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Арифметикалық тепе-теңдіктер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '35 − 9 = 20 + ? . Жасырын санды тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Арифметикалық тепе-теңдіктер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '35 − 9 = 20 + ? . Жасырын санды тап.', 'short_answer', '6'::jsonb, '26 = 20 + 6.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Арифметикалық тепе-теңдіктер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '{2, 4, 6, 8} жиынында 4-тен үлкен неше сан бар?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '{2, 4, 6, 8} жиынында 4-тен үлкен неше сан бар?', 'short_answer', '2'::jsonb, '6 және 8.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '1-ден 10-ға дейінгі жұп сандардың саны неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1-ден 10-ға дейінгі жұп сандардың саны неше?', 'short_answer', '5'::jsonb, '2, 4, 6, 8, 10.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '{3, 6, 9, 12} жиынында 3-ке бөлінетін неше сан бар?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '{3, 6, 9, 12} жиынында 3-ке бөлінетін неше сан бар?', 'short_answer', '4'::jsonb, 'Барлық төртеуі 3-ке бөлінеді.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '{5, 10, 15, 20} жиынында 10-нан кіші неше сан бар?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '{5, 10, 15, 20} жиынында 10-нан кіші неше сан бар?', 'short_answer', '1'::jsonb, 'Тек 5 саны кіші.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '1-ден 12-ге дейін әрі жұп, әрі 3-ке бөлінетін неше сан бар?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1-ден 12-ге дейін әрі жұп, әрі 3-ке бөлінетін неше сан бар?', 'short_answer', '2'::jsonb, '6 және 12.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Логикалық амалдар' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Қызыл, көк, қызыл, көк... тізбегіндегі 9-шы түс қандай?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қарапайым периодтық есептер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қызыл, көк, қызыл, көк... тізбегіндегі 9-шы түс қандай?', 'short_answer', '"қызыл"'::jsonb, 'Тақ орындарда қызыл түс тұр.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым периодтық есептер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'А, Ә, Б, А, Ә, Б... тізбегіндегі 11-ші әріп қандай?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қарапайым периодтық есептер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'А, Ә, Б, А, Ә, Б... тізбегіндегі 11-ші әріп қандай?', 'short_answer', '"Ә"'::jsonb, '11-ді 3-ке бөлгенде қалдық 2, екінші әріп — Ә.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым периодтық есептер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '1, 2, 3, 1, 2, 3... тізбегіндегі 12-ші сан неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қарапайым периодтық есептер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1, 2, 3, 1, 2, 3... тізбегіндегі 12-ші сан неше?', 'short_answer', '3'::jsonb, '12 саны 3-ке бөлінеді, сондықтан үшінші элемент.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым периодтық есептер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '●, ■, ●, ■... тізбегіндегі 14-ші фигура қандай? (● немесе ■)', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қарапайым периодтық есептер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '●, ■, ●, ■... тізбегіндегі 14-ші фигура қандай? (● немесе ■)', 'short_answer', '"■"'::jsonb, 'Жұп орында ■ тұр.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым периодтық есептер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Күн, ай, жұлдыз қайталанады. 7-ші белгі қандай?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қарапайым периодтық есептер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Күн, ай, жұлдыз қайталанады. 7-ші белгі қандай?', 'short_answer', '"күн"'::jsonb, '7 = 3 × 2 + 1, бірінші белгі.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым периодтық есептер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '2 алма + 3 алмұрт = 18, 2 алма + 1 алмұрт = 10. Бір алмұрттың бағасы неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 алма + 3 алмұрт = 18, 2 алма + 1 алмұрт = 10. Бір алмұрттың бағасы неше?', 'short_answer', '4'::jsonb, '(18 − 10) ÷ 2 = 4.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '3 қалам + 2 дәптер = 21, 3 қалам + 1 дәптер = 15. Бір дәптердің бағасы неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 қалам + 2 дәптер = 21, 3 қалам + 1 дәптер = 15. Бір дәптердің бағасы неше?', 'short_answer', '6'::jsonb, '21 − 15 = 6.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '4 кітап + 3 дәптер = 33, 4 кітап + 1 дәптер = 19. Бір дәптердің бағасы неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 кітап + 3 дәптер = 33, 4 кітап + 1 дәптер = 19. Бір дәптердің бағасы неше?', 'short_answer', '7'::jsonb, '(33 − 19) ÷ 2 = 7.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '5 алма + 2 алмұрт = 31, 5 алма + 1 алмұрт = 23. Бір алмұрттың бағасы неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5 алма + 2 алмұрт = 31, 5 алма + 1 алмұрт = 23. Бір алмұрттың бағасы неше?', 'short_answer', '8'::jsonb, '31 − 23 = 8.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '2 қарындаш + 4 қалам = 30, 2 қарындаш + 2 қалам = 18. Бір қаламның бағасы неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 қарындаш + 4 қалам = 30, 2 қарындаш + 2 қалам = 18. Бір қаламның бағасы неше?', 'short_answer', '6'::jsonb, '(30 − 18) ÷ 2 = 6.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жою тәсілі' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Ұзындығы 12 см, ені 4 см тіктөртбұрыштың ауданы неше см²?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Аудан' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ұзындығы 12 см, ені 4 см тіктөртбұрыштың ауданы неше см²?', 'short_answer', '48'::jsonb, '12 × 4 = 48 см².', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аудан' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Ауданы 54 см², ені 6 см тіктөртбұрыштың ұзындығы неше см?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Аудан' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ауданы 54 см², ені 6 см тіктөртбұрыштың ұзындығы неше см?', 'short_answer', '9'::jsonb, '54 ÷ 6 = 9 см.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аудан' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Қабырғасы 7 см шаршының ауданы неше см²?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Аудан' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қабырғасы 7 см шаршының ауданы неше см²?', 'short_answer', '49'::jsonb, '7 × 7 = 49 см².', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аудан' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Ауданы 36 см² шаршының қабырғасы неше см?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Аудан' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ауданы 36 см² шаршының қабырғасы неше см?', 'short_answer', '6'::jsonb, '6 × 6 = 36 см².', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аудан' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Ұзындығы 15 см, ені 3 см тіктөртбұрыштың ауданы неше см²?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Аудан' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ұзындығы 15 см, ені 3 см тіктөртбұрыштың ауданы неше см²?', 'short_answer', '45'::jsonb, '15 × 3 = 45 см².', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аудан' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '45 км/сағ жылдамдықпен 4 сағатта неше км жүріледі?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қозғалысқа берілген есептер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '45 км/сағ жылдамдықпен 4 сағатта неше км жүріледі?', 'short_answer', '180'::jsonb, '45 × 4 = 180 км.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа берілген есептер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '240 км жолды 4 сағатта жүрген көліктің жылдамдығы неше км/сағ?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қозғалысқа берілген есептер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '240 км жолды 4 сағатта жүрген көліктің жылдамдығы неше км/сағ?', 'short_answer', '60'::jsonb, '240 ÷ 4 = 60 км/сағ.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа берілген есептер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '210 км жолды 70 км/сағ жылдамдықпен неше сағатта жүреді?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қозғалысқа берілген есептер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '210 км жолды 70 км/сағ жылдамдықпен неше сағатта жүреді?', 'short_answer', '3'::jsonb, '210 ÷ 70 = 3 сағат.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа берілген есептер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Жаяу жүргінші 6 км/сағ жылдамдықпен 3 сағат жүрді. Неше км өтті?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қозғалысқа берілген есептер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Жаяу жүргінші 6 км/сағ жылдамдықпен 3 сағат жүрді. Неше км өтті?', 'short_answer', '18'::jsonb, '6 × 3 = 18 км.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа берілген есептер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Жолаушы 120 км жолды 2 сағатта жүрді. Жылдамдығы неше км/сағ?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қозғалысқа берілген есептер' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Жолаушы 120 км жолды 2 сағатта жүрді. Жылдамдығы неше км/сағ?', 'short_answer', '60'::jsonb, '120 ÷ 2 = 60 км/сағ.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қозғалысқа берілген есептер' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Таразыда сол жақта 3 кг және 5 кг бар. Оң жаққа неше кг қою керек?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Таразыда сол жақта 3 кг және 5 кг бар. Оң жаққа неше кг қою керек?', 'short_answer', '8'::jsonb, '3 + 5 = 8 кг.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Сол жақта 12 кг, оң жақта 7 кг және белгісіз салмақ. Белгісізі неше кг?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Сол жақта 12 кг, оң жақта 7 кг және белгісіз салмақ. Белгісізі неше кг?', 'short_answer', '5'::jsonb, '12 − 7 = 5 кг.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '2 бірдей қорап 18 кг тартса, бір қорап неше кг?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 бірдей қорап 18 кг тартса, бір қорап неше кг?', 'short_answer', '9'::jsonb, '18 ÷ 2 = 9 кг.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Сол жақта 3 бірдей тас, оң жақта 15 кг. Бір тас неше кг?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Сол жақта 3 бірдей тас, оң жақта 15 кг. Бір тас неше кг?', 'short_answer', '5'::jsonb, '15 ÷ 3 = 5 кг.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Сол жақта 4 кг және 6 кг. Оң жақта 3 кг және белгісіз жүк. Белгісіз жүк неше кг?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Сол жақта 4 кг және 6 кг. Оң жақта 3 кг және белгісіз жүк. Белгісіз жүк неше кг?', 'short_answer', '7'::jsonb, '4 + 6 − 3 = 7 кг.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тепе-теңдік есептері' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '2 жейде, 3 шалбар, 2 аяқкиімнен неше түрлі киім жиынтығы?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Комбинаторика' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 жейде, 3 шалбар, 2 аяқкиімнен неше түрлі киім жиынтығы?', 'short_answer', '12'::jsonb, '2 × 3 × 2 = 12.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Комбинаторика' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '3 түрлі сусын, 4 түрлі тағам, 2 тәттіден неше түрлі таңдау?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Комбинаторика' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 түрлі сусын, 4 түрлі тағам, 2 тәттіден неше түрлі таңдау?', 'short_answer', '24'::jsonb, '3 × 4 × 2 = 24.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Комбинаторика' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '2 бөрік, 2 шарф, 3 қолғаптан неше түрлі жиынтық?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Комбинаторика' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 бөрік, 2 шарф, 3 қолғаптан неше түрлі жиынтық?', 'short_answer', '12'::jsonb, '2 × 2 × 3 = 12.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Комбинаторика' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '4 дәптер, 3 қалам, 2 өшіргіштен неше түрлі жиынтық?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Комбинаторика' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 дәптер, 3 қалам, 2 өшіргіштен неше түрлі жиынтық?', 'short_answer', '24'::jsonb, '4 × 3 × 2 = 24.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Комбинаторика' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '2 жолдың бірімен, 3 көліктің бірімен, 4 уақыттың бірімен неше түрлі жоспар жасалады?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Комбинаторика' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 жолдың бірімен, 3 көліктің бірімен, 4 уақыттың бірімен неше түрлі жоспар жасалады?', 'short_answer', '24'::jsonb, '2 × 3 × 4 = 24.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Комбинаторика' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '24 × 5 неше? 20 мен 4-ке жікте.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Тиімді тәсіл: көбейту және бөлу' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '24 × 5 неше? 20 мен 4-ке жікте.', 'short_answer', '120'::jsonb, '20 × 5 + 4 × 5 = 120.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсіл: көбейту және бөлу' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '36 × 4 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Тиімді тәсіл: көбейту және бөлу' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '36 × 4 неше?', 'short_answer', '144'::jsonb, '30 × 4 + 6 × 4 = 144.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсіл: көбейту және бөлу' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '84 ÷ 4 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Тиімді тәсіл: көбейту және бөлу' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '84 ÷ 4 неше?', 'short_answer', '21'::jsonb, '80 ÷ 4 + 4 ÷ 4 = 21.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсіл: көбейту және бөлу' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '96 ÷ 3 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Тиімді тәсіл: көбейту және бөлу' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '96 ÷ 3 неше?', 'short_answer', '32'::jsonb, '90 ÷ 3 + 6 ÷ 3 = 32.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсіл: көбейту және бөлу' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', '18 × 5 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Тиімді тәсіл: көбейту және бөлу' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '18 × 5 неше?', 'short_answer', '90'::jsonb, '10 × 5 + 8 × 5 = 90.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсіл: көбейту және бөлу' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Балаларға 2-ден зат берсе, 4 зат артық; 3-тен берсе, 2 зат жетпейді. Неше бала?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Балаларға 2-ден зат берсе, 4 зат артық; 3-тен берсе, 2 зат жетпейді. Неше бала?', 'short_answer', '6'::jsonb, '(4 + 2) ÷ (3 − 2) = 6.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Балаларға 3-тен дәптер берсе, 5 дәптер артық; 4-тен берсе, 3 дәптер жетпейді. Неше бала?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Балаларға 3-тен дәптер берсе, 5 дәптер артық; 4-тен берсе, 3 дәптер жетпейді. Неше бала?', 'short_answer', '8'::jsonb, '(5 + 3) ÷ (4 − 3) = 8.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Балаларға 4-тен алма берсе, 6 алма артық; 6-дан берсе, 4 алма жетпейді. Неше бала?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Балаларға 4-тен алма берсе, 6 алма артық; 6-дан берсе, 4 алма жетпейді. Неше бала?', 'short_answer', '5'::jsonb, '(6 + 4) ÷ (6 − 4) = 5.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Балаларға 2-ден қалам берсе, 3 қалам артық; 4-тен берсе, 5 қалам жетпейді. Неше бала?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Балаларға 2-ден қалам берсе, 3 қалам артық; 4-тен берсе, 5 қалам жетпейді. Неше бала?', 'short_answer', '4'::jsonb, '(3 + 5) ÷ (4 − 2) = 4.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикалық шешім', 'Балаларға 5-тен шар берсе, 2 шар артық; 6-дан берсе, 4 шар жетпейді. Неше бала?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Балаларға 5-тен шар берсе, 2 шар артық; 6-дан берсе, 4 шар жетпейді. Неше бала?', 'short_answer', '6'::jsonb, '(2 + 4) ÷ (6 − 5) = 6.', 'Шарттағы байланысты және кері амалды тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Артық қалу және жетпей қалу мәселесі' and tp.grade = 4 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

commit;

