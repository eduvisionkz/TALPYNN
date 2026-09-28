-- Correct the false assertion that all birds can fly in the Grade 2 logic lesson.
-- Keep the existing question identity so previously stored progress stays associated.
begin;
update public.lesson_blocks b
set content = 'Барлық үшбұрыштардың 3 қабырғасы бар. Талпын 4 үшбұрыш салды. Барлығы неше қабырға?'
from public.topics t
where b.topic_id = t.id and t.title = 'Қарапайым логика' and t.grade = 2 and t.track = 'logic'
  and b.stage = 'qoldan';
update public.questions q
set question_text = 'Барлық үшбұрыштардың 3 қабырғасы бар. Талпын 4 үшбұрыш салды. Барлығы неше қабырға?',
    correct_answer = '12'::jsonb,
    explanation = 'Әр үшбұрышта 3 қабырға бар: 4 × 3 = 12.',
    hint = 'Бір үшбұрыштағы қабырға санын 4-ке көбейт.'
from public.lesson_blocks b join public.topics t on t.id = b.topic_id
where q.lesson_block_id = b.id and t.title = 'Қарапайым логика' and t.grade = 2 and t.track = 'logic'
  and b.stage = 'qoldan';
commit;
