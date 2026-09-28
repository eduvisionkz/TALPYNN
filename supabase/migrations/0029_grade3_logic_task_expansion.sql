-- Additional reviewed tasks for the Grade 3 logic topics. Run migrations in numeric order.

begin;

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '99 + 18 неше? 99-ды 100-ге толықтыр.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Тиімді тәсіл: қосу және азайту' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '99 + 18 неше? 99-ды 100-ге толықтыр.', 'short_answer', '117'::jsonb, '99 + 1 + 17 = 117.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсіл: қосу және азайту' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '48 + 26 + 2 неше?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Тиімді тәсіл: қосу және азайту' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '48 + 26 + 2 неше?', 'short_answer', '76'::jsonb, '48 + 2 = 50; 50 + 26 = 76.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсіл: қосу және азайту' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '125 + 75 + 9 неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Тиімді тәсіл: қосу және азайту' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '125 + 75 + 9 неше?', 'short_answer', '209'::jsonb, '125 + 75 = 200; 200 + 9 = 209.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсіл: қосу және азайту' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '302 − 99 неше? 99-ды 100 деп есептеп түзет.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Тиімді тәсіл: қосу және азайту' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '302 − 99 неше? 99-ды 100 деп есептеп түзет.', 'short_answer', '203'::jsonb, '302 − 100 + 1 = 203.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсіл: қосу және азайту' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '67 + 33 + 14 неше?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Тиімді тәсіл: қосу және азайту' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '67 + 33 + 14 неше?', 'short_answer', '114'::jsonb, '67 + 33 = 100; 100 + 14 = 114.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Тиімді тәсіл: қосу және азайту' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '? + 17 = 42. Жасырын санды тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Сандармен логика' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '? + 17 = 42. Жасырын санды тап.', 'short_answer', '25'::jsonb, '42 − 17 = 25.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандармен логика' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '3 × ? + 2 = 20. Жасырын санды тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Сандармен логика' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 × ? + 2 = 20. Жасырын санды тап.', 'short_answer', '6'::jsonb, '(20 − 2) ÷ 3 = 6.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандармен логика' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '? − 15 = 38. Жасырын санды тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Сандармен логика' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '? − 15 = 38. Жасырын санды тап.', 'short_answer', '53'::jsonb, '38 + 15 = 53.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандармен логика' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '60 ÷ ? = 12. Жасырын санды тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Сандармен логика' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '60 ÷ ? = 12. Жасырын санды тап.', 'short_answer', '5'::jsonb, '60 ÷ 12 = 5.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандармен логика' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '? × 4 − 5 = 23. Жасырын санды тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Сандармен логика' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '? × 4 − 5 = 23. Жасырын санды тап.', 'short_answer', '7'::jsonb, '(23 + 5) ÷ 4 = 7.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандармен логика' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '3, 6, 9, 12, ? — келесі санды жаз.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Сандар қатарының заңдылығы' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3, 6, 9, 12, ? — келесі санды жаз.', 'short_answer', '15'::jsonb, 'Әр жолы 3 қосылады.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар қатарының заңдылығы' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '2, 4, 8, 16, ? — келесі санды жаз.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Сандар қатарының заңдылығы' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2, 4, 8, 16, ? — келесі санды жаз.', 'short_answer', '32'::jsonb, 'Әр сан екі еселенеді.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар қатарының заңдылығы' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '50, 45, 40, 35, ? — келесі санды жаз.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Сандар қатарының заңдылығы' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '50, 45, 40, 35, ? — келесі санды жаз.', 'short_answer', '30'::jsonb, 'Әр жолы 5 азаяды.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар қатарының заңдылығы' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '1, 4, 7, 10, ? — келесі санды жаз.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Сандар қатарының заңдылығы' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '1, 4, 7, 10, ? — келесі санды жаз.', 'short_answer', '13'::jsonb, 'Әр жолы 3 қосылады.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар қатарының заңдылығы' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '5, 10, 20, 40, ? — келесі санды жаз.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Сандар қатарының заңдылығы' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5, 10, 20, 40, ? — келесі санды жаз.', 'short_answer', '80'::jsonb, 'Әр сан екі еселенеді.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Сандар қатарының заңдылығы' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '20 алманың 7-еуін беріп, тағы 5 алма алды. Неше алма болды?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Мәтін есептер' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '20 алманың 7-еуін беріп, тағы 5 алма алды. Неше алма болды?', 'short_answer', '18'::jsonb, '20 − 7 + 5 = 18.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мәтін есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '3 қорапта 6 доптан бар. 4 допты берді. Неше доп қалды?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Мәтін есептер' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 қорапта 6 доптан бар. 4 допты берді. Неше доп қалды?', 'short_answer', '14'::jsonb, '3 × 6 − 4 = 14.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мәтін есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Әселде 12 қарындаш, Әлиде одан 5 қарындаш артық. Әлиде неше қарындаш?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Мәтін есептер' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Әселде 12 қарындаш, Әлиде одан 5 қарындаш артық. Әлиде неше қарындаш?', 'short_answer', '17'::jsonb, '12 + 5 = 17.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мәтін есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '24 кітапты 4 сөреге тең бөліп, тағы әр сөреге 2 кітаптан қойды. Бір сөреде неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Мәтін есептер' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '24 кітапты 4 сөреге тең бөліп, тағы әр сөреге 2 кітаптан қойды. Бір сөреде неше?', 'short_answer', '8'::jsonb, '24 ÷ 4 + 2 = 8.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мәтін есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Бірінші топта 15 бала, екіншісінде 3 бала кем. Екі топта барлығы неше бала?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Мәтін есептер' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бірінші топта 15 бала, екіншісінде 3 бала кем. Екі топта барлығы неше бала?', 'short_answer', '27'::jsonb, '15 + (15 − 3) = 27.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Мәтін есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '3 үшбұрыш пен 5 шаршы бар. Барлығы неше фигура?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қарапайым фигураларды санау' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 үшбұрыш пен 5 шаршы бар. Барлығы неше фигура?', 'short_answer', '8'::jsonb, '3 + 5 = 8.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым фигураларды санау' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '4 дөңгелек, 2 үшбұрыш, 3 шаршы бар. Неше фигура?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қарапайым фигураларды санау' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 дөңгелек, 2 үшбұрыш, 3 шаршы бар. Неше фигура?', 'short_answer', '9'::jsonb, '4 + 2 + 3 = 9.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым фигураларды санау' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '5 шаршының 2-еуін алып қойды. Неше шаршы қалды?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қарапайым фигураларды санау' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5 шаршының 2-еуін алып қойды. Неше шаршы қалды?', 'short_answer', '3'::jsonb, '5 − 2 = 3.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым фигураларды санау' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '6 үшбұрыш пен 4 дөңгелектің санының айырмасы неше?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қарапайым фигураларды санау' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '6 үшбұрыш пен 4 дөңгелектің санының айырмасы неше?', 'short_answer', '2'::jsonb, '6 − 4 = 2.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым фигураларды санау' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Әр қатарда 3 дөңгелектен, 4 қатар бар. Неше дөңгелек?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қарапайым фигураларды санау' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Әр қатарда 3 дөңгелектен, 4 қатар бар. Неше дөңгелек?', 'short_answer', '12'::jsonb, '3 × 4 = 12.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым фигураларды санау' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '3 жейде мен 4 шалбардан неше түрлі жұп құралады?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қарапайым комбинаторика' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 жейде мен 4 шалбардан неше түрлі жұп құралады?', 'short_answer', '12'::jsonb, '3 × 4 = 12.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым комбинаторика' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '2 сусын мен 5 тәттіден неше түрлі таңдауға болады?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қарапайым комбинаторика' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 сусын мен 5 тәттіден неше түрлі таңдауға болады?', 'short_answer', '10'::jsonb, '2 × 5 = 10.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым комбинаторика' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '4 қалам мен 3 дәптерден неше түрлі жұп жасауға болады?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қарапайым комбинаторика' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '4 қалам мен 3 дәптерден неше түрлі жұп жасауға болады?', 'short_answer', '12'::jsonb, '4 × 3 = 12.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым комбинаторика' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '3 жол және 2 түрлі аяқкиім бар. Жол мен аяқкиімді неше түрлі жұптауға болады?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қарапайым комбинаторика' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 жол және 2 түрлі аяқкиім бар. Жол мен аяқкиімді неше түрлі жұптауға болады?', 'short_answer', '6'::jsonb, '3 × 2 = 6.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым комбинаторика' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '5 ойыншық пен 2 қораптың біреуін таңдап жұптау жолы нешеу?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қарапайым комбинаторика' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '5 ойыншық пен 2 қораптың біреуін таңдап жұптау жолы нешеу?', 'short_answer', '10'::jsonb, '5 × 2 = 10.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қарапайым комбинаторика' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Пицца 4 тең бөлікке бөлінді. Жартысы неше бөлік?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Үлес' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Пицца 4 тең бөлікке бөлінді. Жартысы неше бөлік?', 'short_answer', '2'::jsonb, '4 ÷ 2 = 2 бөлік.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үлес' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '12 алманың жартысы неше алма?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Үлес' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '12 алманың жартысы неше алма?', 'short_answer', '6'::jsonb, '12 ÷ 2 = 6.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үлес' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '15 заттың үштен бірі неше зат?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Үлес' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '15 заттың үштен бірі неше зат?', 'short_answer', '5'::jsonb, '15 ÷ 3 = 5.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үлес' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '20 теңгенің төрттен бірі неше теңге?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Үлес' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '20 теңгенің төрттен бірі неше теңге?', 'short_answer', '5'::jsonb, '20 ÷ 4 = 5.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үлес' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Торт 8 тең бөлікке бөлінді. Төрттен бірі неше бөлік?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Үлес' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Торт 8 тең бөлікке бөлінді. Төрттен бірі неше бөлік?', 'short_answer', '2'::jsonb, '8 ÷ 4 = 2 бөлік.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Үлес' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '24 санының жартысын тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Санның бөлігін табу және бөлігі бойынша санды табу' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '24 санының жартысын тап.', 'short_answer', '12'::jsonb, '24 ÷ 2 = 12.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Санның бөлігін табу және бөлігі бойынша санды табу' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '18 санының үштен бірін тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Санның бөлігін табу және бөлігі бойынша санды табу' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '18 санының үштен бірін тап.', 'short_answer', '6'::jsonb, '18 ÷ 3 = 6.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Санның бөлігін табу және бөлігі бойынша санды табу' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Санның жартысы 9 болса, сол санды тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Санның бөлігін табу және бөлігі бойынша санды табу' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Санның жартысы 9 болса, сол санды тап.', 'short_answer', '18'::jsonb, '9 × 2 = 18.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Санның бөлігін табу және бөлігі бойынша санды табу' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Санның төрттен бірі 5 болса, сол санды тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Санның бөлігін табу және бөлігі бойынша санды табу' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Санның төрттен бірі 5 болса, сол санды тап.', 'short_answer', '20'::jsonb, '5 × 4 = 20.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Санның бөлігін табу және бөлігі бойынша санды табу' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '32 санының төрттен бірін тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Санның бөлігін табу және бөлігі бойынша санды табу' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '32 санының төрттен бірін тап.', 'short_answer', '8'::jsonb, '32 ÷ 4 = 8.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Санның бөлігін табу және бөлігі бойынша санды табу' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Ұзындығы 7 см, ені 3 см тіктөртбұрыштың ауданы неше см²?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Аудан' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ұзындығы 7 см, ені 3 см тіктөртбұрыштың ауданы неше см²?', 'short_answer', '21'::jsonb, '7 × 3 = 21 см².', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аудан' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Қабырғасы 5 см шаршының ауданы неше см²?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Аудан' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қабырғасы 5 см шаршының ауданы неше см²?', 'short_answer', '25'::jsonb, '5 × 5 = 25 см².', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аудан' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Ұзындығы 9 см, ені 2 см тіктөртбұрыштың ауданы неше см²?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Аудан' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ұзындығы 9 см, ені 2 см тіктөртбұрыштың ауданы неше см²?', 'short_answer', '18'::jsonb, '9 × 2 = 18 см².', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аудан' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Ауданы 24 см², ені 4 см тіктөртбұрыштың ұзындығы неше см?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Аудан' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Ауданы 24 см², ені 4 см тіктөртбұрыштың ұзындығы неше см?', 'short_answer', '6'::jsonb, '24 ÷ 4 = 6 см.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аудан' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Қабырғасы 8 см шаршының ауданы неше см²?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Аудан' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қабырғасы 8 см шаршының ауданы неше см²?', 'short_answer', '64'::jsonb, '8 × 8 = 64 см².', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Аудан' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '{2, 4, 6, 8} жиынында неше элемент бар?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '{2, 4, 6, 8} жиынында неше элемент бар?', 'short_answer', '4'::jsonb, 'Төрт түрлі элемент бар.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '{а, ә, б} жиынына в әрпін қосты. Енді неше элемент?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '{а, ә, б} жиынына в әрпін қосты. Енді неше элемент?', 'short_answer', '4'::jsonb, '3 + 1 = 4.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '{1, 2, 2, 3} жиынында неше түрлі элемент бар?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '{1, 2, 2, 3} жиынында неше түрлі элемент бар?', 'short_answer', '3'::jsonb, 'Қайталанған 2 бір элемент болып саналады.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '{5, 10, 15} жиынынан 10 алынса, неше элемент қалады?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '{5, 10, 15} жиынынан 10 алынса, неше элемент қалады?', 'short_answer', '2'::jsonb, '5 және 15 қалады.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '{алма, алмұрт, өрік, шие} жиынында неше элемент бар?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '{алма, алмұрт, өрік, шие} жиынында неше элемент бар?', 'short_answer', '4'::jsonb, 'Төрт түрлі жеміс бар.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жиын' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Екі санның қосындысы 20, айырмасы 4. Үлкен санды тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қосынды айырма' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Екі санның қосындысы 20, айырмасы 4. Үлкен санды тап.', 'short_answer', '12'::jsonb, '(20 + 4) ÷ 2 = 12.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосынды айырма' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Екі санның қосындысы 18, айырмасы 6. Кіші санды тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қосынды айырма' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Екі санның қосындысы 18, айырмасы 6. Кіші санды тап.', 'short_answer', '6'::jsonb, '(18 − 6) ÷ 2 = 6.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосынды айырма' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Қосындысы 30, айырмасы 10 болатын екі санның үлкенін тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қосынды айырма' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қосындысы 30, айырмасы 10 болатын екі санның үлкенін тап.', 'short_answer', '20'::jsonb, '(30 + 10) ÷ 2 = 20.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосынды айырма' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Қосындысы 24, айырмасы 8 болатын екі санның кішісін тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қосынды айырма' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қосындысы 24, айырмасы 8 болатын екі санның кішісін тап.', 'short_answer', '8'::jsonb, '(24 − 8) ÷ 2 = 8.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосынды айырма' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Қосындысы 16, айырмасы 2 болатын екі санның үлкенін тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қосынды айырма' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Қосындысы 16, айырмасы 2 болатын екі санның үлкенін тап.', 'short_answer', '9'::jsonb, '(16 + 2) ÷ 2 = 9.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосынды айырма' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Екі санның қосындысы 24. Үлкені кішісінен 2 есе артық. Кіші санды тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Қосынды еселік' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Екі санның қосындысы 24. Үлкені кішісінен 2 есе артық. Кіші санды тап.', 'short_answer', '8'::jsonb, 'Барлығы 3 үлес: 24 ÷ 3 = 8.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосынды еселік' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Екі санның қосындысы 30. Үлкені кішісінен 2 есе артық. Үлкенін тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Қосынды еселік' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Екі санның қосындысы 30. Үлкені кішісінен 2 есе артық. Үлкенін тап.', 'short_answer', '20'::jsonb, '30 ÷ 3 × 2 = 20.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосынды еселік' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Екі санның қосындысы 28. Үлкені кішісінен 3 есе артық. Кіші санды тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Қосынды еселік' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Екі санның қосындысы 28. Үлкені кішісінен 3 есе артық. Кіші санды тап.', 'short_answer', '7'::jsonb, '28 ÷ 4 = 7.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосынды еселік' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Екі санның қосындысы 36. Үлкені кішісінен 3 есе артық. Үлкенін тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Қосынды еселік' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Екі санның қосындысы 36. Үлкені кішісінен 3 есе артық. Үлкенін тап.', 'short_answer', '27'::jsonb, '36 ÷ 4 × 3 = 27.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосынды еселік' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Екі санның қосындысы 25. Үлкені кішісінен 4 есе артық. Кіші санды тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Қосынды еселік' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Екі санның қосындысы 25. Үлкені кішісінен 4 есе артық. Кіші санды тап.', 'short_answer', '5'::jsonb, '25 ÷ 5 = 5.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Қосынды еселік' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Үлкен сан кішісінен 3 есе артық, айырмасы 12. Кіші санды тап.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Еселік айырма' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Үлкен сан кішісінен 3 есе артық, айырмасы 12. Кіші санды тап.', 'short_answer', '6'::jsonb, '3 − 1 = 2 үлес; 12 ÷ 2 = 6.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Еселік айырма' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Үлкен сан кішісінен 4 есе артық, айырмасы 15. Үлкенін тап.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Еселік айырма' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Үлкен сан кішісінен 4 есе артық, айырмасы 15. Үлкенін тап.', 'short_answer', '20'::jsonb, '3 үлес = 15, 1 үлес = 5, үлкені 20.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Еселік айырма' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Үлкен сан кішісінен 2 есе артық, айырмасы 9. Кіші санды тап.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Еселік айырма' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Үлкен сан кішісінен 2 есе артық, айырмасы 9. Кіші санды тап.', 'short_answer', '9'::jsonb, '2 − 1 = 1 үлес; кіші сан 9.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Еселік айырма' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Үлкен сан кішісінен 5 есе артық, айырмасы 16. Үлкенін тап.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Еселік айырма' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Үлкен сан кішісінен 5 есе артық, айырмасы 16. Үлкенін тап.', 'short_answer', '20'::jsonb, '4 үлес = 16; бір үлес 4, үлкені 20.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Еселік айырма' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Үлкен сан кішісінен 3 есе артық, айырмасы 8. Кіші санды тап.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Еселік айырма' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Үлкен сан кішісінен 3 есе артық, айырмасы 8. Кіші санды тап.', 'short_answer', '4'::jsonb, '2 үлес = 8; бір үлес 4.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Еселік айырма' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Айша 9 жаста, ағасы одан 4 жас үлкен. Ағасы неше жаста?', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Айша 9 жаста, ағасы одан 4 жас үлкен. Ағасы неше жаста?', 'short_answer', '13'::jsonb, '9 + 4 = 13.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Бала 12 жаста, қарындасы одан 5 жас кіші. Қарындасы неше жаста?', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Бала 12 жаста, қарындасы одан 5 жас кіші. Қарындасы неше жаста?', 'short_answer', '7'::jsonb, '12 − 5 = 7.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Анасы 35 жаста, қызы 10 жаста. Жас айырмасы неше?', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Анасы 35 жаста, қызы 10 жаста. Жас айырмасы неше?', 'short_answer', '25'::jsonb, '35 − 10 = 25.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Дәулет қазір 8 жаста. 3 жылдан кейін неше жаста?', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Дәулет қазір 8 жаста. 3 жылдан кейін неше жаста?', 'short_answer', '11'::jsonb, '8 + 3 = 11.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'Әкесі 40 жаста, баласы 12 жаста. 2 жылдан кейін баласы неше жаста?', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'Әкесі 40 жаста, баласы 12 жаста. 2 жылдан кейін баласы неше жаста?', 'short_answer', '14'::jsonb, '12 + 2 = 14.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жасқа байланысты есептер' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'x + 7 = 20. x-ті байқап тауып, тексер.', '{}'::jsonb, 5
from public.topics tp where tp.title = 'Жорамалдау тәсілі' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=5);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x + 7 = 20. x-ті байқап тауып, тексер.', 'short_answer', '13'::jsonb, '13 + 7 = 20.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жорамалдау тәсілі' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=5
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '3 × x = 27. x-ті тауып, орнына қойып тексер.', '{}'::jsonb, 6
from public.topics tp where tp.title = 'Жорамалдау тәсілі' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=6);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '3 × x = 27. x-ті тауып, орнына қойып тексер.', 'short_answer', '9'::jsonb, '3 × 9 = 27.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жорамалдау тәсілі' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=6
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', 'x − 8 = 15. x-ті тауып, орнына қойып тексер.', '{}'::jsonb, 7
from public.topics tp where tp.title = 'Жорамалдау тәсілі' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=7);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, 'x − 8 = 15. x-ті тауып, орнына қойып тексер.', 'short_answer', '23'::jsonb, '23 − 8 = 15.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жорамалдау тәсілі' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=7
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '40 ÷ x = 5. x-ті тауып, тексер.', '{}'::jsonb, 8
from public.topics tp where tp.title = 'Жорамалдау тәсілі' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=8);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '40 ÷ x = 5. x-ті тауып, тексер.', 'short_answer', '8'::jsonb, '40 ÷ 8 = 5.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жорамалдау тәсілі' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=8
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', 'short_answer', 'Ойлан және шеш', '2 × x + 3 = 17. x-ті тауып, тексер.', '{}'::jsonb, 9
from public.topics tp where tp.title = 'Жорамалдау тәсілі' and tp.grade = 3 and tp.track = 'logic'
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=9);

insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, '2 × x + 3 = 17. x-ті тауып, тексер.', 'short_answer', '7'::jsonb, '2 × 7 + 3 = 17.', 'Берілгендерді ретімен тексер.', 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where tp.title = 'Жорамалдау тәсілі' and tp.grade = 3 and tp.track = 'logic' and b.stage='bekit' and b.sort_order=9
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);

commit;

