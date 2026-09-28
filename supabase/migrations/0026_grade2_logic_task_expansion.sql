-- Additional reviewed tasks for the Grade 2 logic topics. Run migrations in numeric order.

begin;

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '38 + 2 + 7 неше?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Тиімді тәсілмен есептеу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '38 + 2 + 7 неше?', 'short_answer', '47'::jsonb, '38 + 2 = 40, 40 + 7 = 47.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсілмен есептеу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '49 + 11 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Тиімді тәсілмен есептеу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '49 + 11 неше?', 'short_answer', '60'::jsonb, '49 + 1 + 10 = 60.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсілмен есептеу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '27 + 13 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Тиімді тәсілмен есептеу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '27 + 13 неше?', 'short_answer', '40'::jsonb, '27 + 3 + 10 = 40.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсілмен есептеу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '96 + 4 + 5 неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Тиімді тәсілмен есептеу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '96 + 4 + 5 неше?', 'short_answer', '105'::jsonb, '96 + 4 = 100, 100 + 5 = 105.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсілмен есептеу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '52 − 12 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Тиімді тәсілмен есептеу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '52 − 12 неше?', 'short_answer', '40'::jsonb, '52 − 2 − 10 = 40.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсілмен есептеу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'x + 9 = 20. x-ті тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Теңдеу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x + 9 = 20. x-ті тап.', 'short_answer', '11'::jsonb, '20 − 9 = 11.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Теңдеу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'x − 8 = 13. x-ті тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Теңдеу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x − 8 = 13. x-ті тап.', 'short_answer', '21'::jsonb, '13 + 8 = 21.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Теңдеу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '27 − x = 19. x-ті тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Теңдеу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '27 − x = 19. x-ті тап.', 'short_answer', '8'::jsonb, '27 − 19 = 8.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Теңдеу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '5 × x = 35. x-ті тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Теңдеу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5 × x = 35. x-ті тап.', 'short_answer', '7'::jsonb, '35 ÷ 5 = 7.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Теңдеу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'x ÷ 4 = 6. x-ті тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Теңдеу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x ÷ 4 = 6. x-ті тап.', 'short_answer', '24'::jsonb, '6 × 4 = 24.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Теңдеу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '1 м мен 25 см барлығы неше см?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Өлшем бірліктері және оларды салыстыру' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1 м мен 25 см барлығы неше см?', 'short_answer', '125'::jsonb, '100 + 25 = 125 см.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өлшем бірліктері және оларды салыстыру' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '2 кг неше грамм?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Өлшем бірліктері және оларды салыстыру' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 кг неше грамм?', 'short_answer', '2000'::jsonb, '2 × 1000 = 2000 г.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өлшем бірліктері және оларды салыстыру' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '90 см мен 1 м ұзындықтарының айырмасы неше см?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Өлшем бірліктері және оларды салыстыру' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '90 см мен 1 м ұзындықтарының айырмасы неше см?', 'short_answer', '10'::jsonb, '1 м = 100 см; 100 − 90 = 10 см.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өлшем бірліктері және оларды салыстыру' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '3 м неше сантиметр?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Өлшем бірліктері және оларды салыстыру' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 м неше сантиметр?', 'short_answer', '300'::jsonb, '3 × 100 = 300 см.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өлшем бірліктері және оларды салыстыру' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '1 кг мен 200 г барлығы неше грамм?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Өлшем бірліктері және оларды салыстыру' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1 кг мен 200 г барлығы неше грамм?', 'short_answer', '1200'::jsonb, '1000 + 200 = 1200 г.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өлшем бірліктері және оларды салыстыру' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Кестеде: бірінші қатарда 8 ағаш, екіншісінде 6 ағаш. Барлығы неше ағаш?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Сызба салу және кесте құру' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Кестеде: бірінші қатарда 8 ағаш, екіншісінде 6 ағаш. Барлығы неше ағаш?', 'short_answer', '14'::jsonb, '8 + 6 = 14.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сызба салу және кесте құру' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Сызбада бірінші кесінді 15 см, екіншісі 4 см қысқа. Екіншісі неше см?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Сызба салу және кесте құру' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Сызбада бірінші кесінді 15 см, екіншісі 4 см қысқа. Екіншісі неше см?', 'short_answer', '11'::jsonb, '15 − 4 = 11 см.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сызба салу және кесте құру' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Кестеде 3 қорап, әрқайсысында 5 алма. Барлығы неше алма?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Сызба салу және кесте құру' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Кестеде 3 қорап, әрқайсысында 5 алма. Барлығы неше алма?', 'short_answer', '15'::jsonb, '3 × 5 = 15.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сызба салу және кесте құру' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Қысқаша шарт: болды 18, 7-еуін берді. Қалды неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Сызба салу және кесте құру' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қысқаша шарт: болды 18, 7-еуін берді. Қалды неше?', 'short_answer', '11'::jsonb, '18 − 7 = 11.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сызба салу және кесте құру' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Сызбада 12 см және 9 см кесінді бар. Жалпы ұзындық неше см?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Сызба салу және кесте құру' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Сызбада 12 см және 9 см кесінді бар. Жалпы ұзындық неше см?', 'short_answer', '21'::jsonb, '12 + 9 = 21 см.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сызба салу және кесте құру' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Белгісіз санға 7 қосты, 19 шықты. Бастапқы санды тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Кері шегіну' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Белгісіз санға 7 қосты, 19 шықты. Бастапқы санды тап.', 'short_answer', '12'::jsonb, '19 − 7 = 12.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Кері шегіну' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Белгісіз саннан 8 азайтты, 14 шықты. Бастапқы санды тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Кері шегіну' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Белгісіз саннан 8 азайтты, 14 шықты. Бастапқы санды тап.', 'short_answer', '22'::jsonb, '14 + 8 = 22.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Кері шегіну' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Белгісіз санды 3-ке көбейтіп, 27 алды. Бастапқы санды тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Кері шегіну' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Белгісіз санды 3-ке көбейтіп, 27 алды. Бастапқы санды тап.', 'short_answer', '9'::jsonb, '27 ÷ 3 = 9.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Кері шегіну' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Белгісіз санды 5-ке бөлгенде 6 шықты. Бастапқы санды тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Кері шегіну' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Белгісіз санды 5-ке бөлгенде 6 шықты. Бастапқы санды тап.', 'short_answer', '30'::jsonb, '6 × 5 = 30.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Кері шегіну' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Белгісіз саннан 5 азайтып, нәтижеге 3 қосты, 18 шықты. Бастапқы санды тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Кері шегіну' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Белгісіз саннан 5 азайтып, нәтижеге 3 қосты, 18 шықты. Бастапқы санды тап.', 'short_answer', '20'::jsonb, '18 − 3 + 5 = 20.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Кері шегіну' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Барлық үшбұрыштарда 3 қабырға бар. Талпын үшбұрыш сызды. Оның неше қабырғасы бар?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қарапайым логика' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Барлық үшбұрыштарда 3 қабырға бар. Талпын үшбұрыш сызды. Оның неше қабырғасы бар?', 'short_answer', '3'::jsonb, 'Үшбұрыштың 3 қабырғасы бар.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым логика' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Барлық шаршылардың 4 бұрышы бар. Екі шаршыда барлығы неше бұрыш бар?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қарапайым логика' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Барлық шаршылардың 4 бұрышы бар. Екі шаршыда барлығы неше бұрыш бар?', 'short_answer', '8'::jsonb, '4 + 4 = 8.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым логика' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Барлық апталарда 7 күн бар. Екі аптада неше күн бар?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қарапайым логика' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Барлық апталарда 7 күн бар. Екі аптада неше күн бар?', 'short_answer', '14'::jsonb, '7 + 7 = 14.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым логика' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Барлық үшбұрыштарда 3 төбе бар. Үш үшбұрышта барлығы неше төбе бар?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қарапайым логика' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Барлық үшбұрыштарда 3 төбе бар. Үш үшбұрышта барлығы неше төбе бар?', 'short_answer', '9'::jsonb, '3 × 3 = 9.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым логика' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Барлық қарындаштардың екі ұшы бар деп алайық. Үш қарындаштың барлығы неше ұшы бар?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қарапайым логика' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Барлық қарындаштардың екі ұшы бар деп алайық. Үш қарындаштың барлығы неше ұшы бар?', 'short_answer', '6'::jsonb, '2 × 3 = 6.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым логика' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '18 саны жұп па, тақ па? «жұп» немесе «тақ» деп жаз.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Тақ сан және жұп сан' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '18 саны жұп па, тақ па? «жұп» немесе «тақ» деп жаз.', 'short_answer', '"жұп"'::jsonb, '18 саны 2-ге қалдықсыз бөлінеді.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тақ сан және жұп сан' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '23 саны жұп па, тақ па? «жұп» немесе «тақ» деп жаз.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Тақ сан және жұп сан' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '23 саны жұп па, тақ па? «жұп» немесе «тақ» деп жаз.', 'short_answer', '"тақ"'::jsonb, '23 саны 2-ге қалдықсыз бөлінбейді.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тақ сан және жұп сан' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '12 + 7 қосындысы жұп па, тақ па? «жұп» немесе «тақ» деп жаз.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Тақ сан және жұп сан' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '12 + 7 қосындысы жұп па, тақ па? «жұп» немесе «тақ» деп жаз.', 'short_answer', '"тақ"'::jsonb, '12 + 7 = 19 — тақ сан.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тақ сан және жұп сан' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '8 + 6 қосындысы жұп па, тақ па? «жұп» немесе «тақ» деп жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Тақ сан және жұп сан' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '8 + 6 қосындысы жұп па, тақ па? «жұп» немесе «тақ» деп жаз.', 'short_answer', '"жұп"'::jsonb, '8 + 6 = 14 — жұп сан.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тақ сан және жұп сан' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '1, 2, 3, 4, 5 сандарының ішінде неше тақ сан бар?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Тақ сан және жұп сан' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1, 2, 3, 4, 5 сандарының ішінде неше тақ сан бар?', 'short_answer', '3'::jsonb, '1, 3, 5 — үш тақ сан.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тақ сан және жұп сан' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '2 жейде мен 3 шалбарды неше түрлі жолмен таңдауға болады?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қарапайым комбинаторика' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 жейде мен 3 шалбарды неше түрлі жолмен таңдауға болады?', 'short_answer', '6'::jsonb, '2 × 3 = 6.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым комбинаторика' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '4 түрлі сусын мен 2 түрлі тәттіден неше жұп құралады?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қарапайым комбинаторика' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 түрлі сусын мен 2 түрлі тәттіден неше жұп құралады?', 'short_answer', '8'::jsonb, '4 × 2 = 8.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым комбинаторика' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '3 бөрік пен 3 шарфтан неше түрлі жиынтық болады?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қарапайым комбинаторика' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 бөрік пен 3 шарфтан неше түрлі жиынтық болады?', 'short_answer', '9'::jsonb, '3 × 3 = 9.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым комбинаторика' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '2 аяқкиім мен 5 жейдеден неше түрлі жұп таңдауға болады?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қарапайым комбинаторика' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 аяқкиім мен 5 жейдеден неше түрлі жұп таңдауға болады?', 'short_answer', '10'::jsonb, '2 × 5 = 10.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым комбинаторика' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '3 түрлі дәптер мен 4 түрлі қаламнан неше жұп таңдауға болады?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қарапайым комбинаторика' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 түрлі дәптер мен 4 түрлі қаламнан неше жұп таңдауға болады?', 'short_answer', '12'::jsonb, '3 × 4 = 12.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым комбинаторика' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Ұзындығы 9 см, ені 4 см тіктөртбұрыштың периметрі неше см?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Периметр' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ұзындығы 9 см, ені 4 см тіктөртбұрыштың периметрі неше см?', 'short_answer', '26'::jsonb, '9 + 4 + 9 + 4 = 26 см.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Периметр' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Қабырғасы 6 см шаршының периметрі неше см?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Периметр' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қабырғасы 6 см шаршының периметрі неше см?', 'short_answer', '24'::jsonb, '6 × 4 = 24 см.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Периметр' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Ұзындығы 8 см, ені 5 см тіктөртбұрыштың периметрі неше см?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Периметр' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ұзындығы 8 см, ені 5 см тіктөртбұрыштың периметрі неше см?', 'short_answer', '26'::jsonb, '8 + 5 + 8 + 5 = 26 см.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Периметр' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Қабырғасы 9 см шаршының периметрі неше см?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Периметр' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қабырғасы 9 см шаршының периметрі неше см?', 'short_answer', '36'::jsonb, '9 × 4 = 36 см.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Периметр' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Қабырғалары 4 см, 5 см, 6 см үшбұрыштың периметрі неше см?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Периметр' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қабырғалары 4 см, 5 см, 6 см үшбұрыштың периметрі неше см?', 'short_answer', '15'::jsonb, '4 + 5 + 6 = 15 см.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Периметр' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Жіпті 3 жерден кессе, неше бөлік шығады?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Аралық санау және кесу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Жіпті 3 жерден кессе, неше бөлік шығады?', 'short_answer', '4'::jsonb, '3 кесуден 4 бөлік шығады.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аралық санау және кесу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Таяқты 7 бөлікке бөлу үшін неше рет кесу керек?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Аралық санау және кесу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Таяқты 7 бөлікке бөлу үшін неше рет кесу керек?', 'short_answer', '6'::jsonb, '7 бөлікке 6 кесу керек.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аралық санау және кесу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Бөренені 6 рет кессе, неше бөлік шығады?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Аралық санау және кесу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бөренені 6 рет кессе, неше бөлік шығады?', 'short_answer', '7'::jsonb, '6 кесуден 7 бөлік шығады.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аралық санау және кесу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Қағаз жолағын 9 бөлікке бөлу үшін неше рет кесу керек?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Аралық санау және кесу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қағаз жолағын 9 бөлікке бөлу үшін неше рет кесу керек?', 'short_answer', '8'::jsonb, '9 бөлікке 8 кесу керек.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аралық санау және кесу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Лентаны 4 рет кессе, неше бөлік болады?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Аралық санау және кесу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Лентаны 4 рет кессе, неше бөлік болады?', 'short_answer', '5'::jsonb, '4 кесуден 5 бөлік шығады.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аралық санау және кесу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Түзу жолдың екі шетіне де ағаш егіп, 4 аралық жасады. Неше ағаш керек?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Ағаш егу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Түзу жолдың екі шетіне де ағаш егіп, 4 аралық жасады. Неше ағаш керек?', 'short_answer', '5'::jsonb, '4 аралыққа 5 ағаш керек.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Ағаш егу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Жол бойына 8 ағаш егілді. Екі шетте де ағаш болса, неше аралық бар?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Ағаш егу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Жол бойына 8 ағаш егілді. Екі шетте де ағаш болса, неше аралық бар?', 'short_answer', '7'::jsonb, '8 ағаштың арасында 7 аралық бар.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Ағаш егу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Екі шетіне де ағаш егіп, 10 аралық жасағанда неше ағаш болады?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Ағаш егу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Екі шетіне де ағаш егіп, 10 аралық жасағанда неше ағаш болады?', 'short_answer', '11'::jsonb, '10 аралыққа 11 ағаш керек.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Ағаш егу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Түзу жолда 6 ағаш бар. Олардың арасында неше аралық болады?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Ағаш егу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Түзу жолда 6 ағаш бар. Олардың арасында неше аралық болады?', 'short_answer', '5'::jsonb, '6 ағаш арасында 5 аралық болады.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Ағаш егу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', 'Екі шетіне де ағаш егіп, 3 аралық жасағанда неше ағаш керек?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Ағаш егу' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Екі шетіне де ағаш егіп, 3 аралық жасағанда неше ағаш керек?', 'short_answer', '4'::jsonb, '3 аралыққа 4 ағаш керек.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Ағаш егу' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '2 л және 5 л суды бір ыдысқа құйды. Барлығы неше литр?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 л және 5 л суды бір ыдысқа құйды. Барлығы неше литр?', 'short_answer', '7'::jsonb, '2 + 5 = 7 л.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '9 л судан 4 л құйып алды. Неше литр қалды?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '9 л судан 4 л құйып алды. Неше литр қалды?', 'short_answer', '5'::jsonb, '9 − 4 = 5 л.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '6 л ыдыста 2 л су бар. Толтыру үшін тағы неше литр керек?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6 л ыдыста 2 л су бар. Толтыру үшін тағы неше литр керек?', 'short_answer', '4'::jsonb, '6 − 2 = 4 л.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '3 л және 4 л ыдыстағы барлық суды 10 л ыдысқа құйды. Бос орын неше литр?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 л және 4 л ыдыстағы барлық суды 10 л ыдысқа құйды. Бос орын неше литр?', 'short_answer', '3'::jsonb, '10 − 3 − 4 = 3 л.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Логикамен шеш', '12 л суды 3 ыдысқа тең бөлді. Әр ыдыста неше литр?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '12 л суды 3 ыдысқа тең бөлді. Әр ыдыста неше литр?', 'short_answer', '4'::jsonb, '12 ÷ 3 = 4 л.', 'Есептің шартына қайта қара.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Өлшеу және құю' and tp.grade = 2 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

commit;

