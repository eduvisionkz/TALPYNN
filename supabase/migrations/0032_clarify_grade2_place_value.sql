-- Clarify the original Grade 2 question: "how many units" could mean 84 units or 4 in the units place.
begin;
update public.lesson_blocks b set content = '84 санының бірліктер разрядында қай цифр тұр?'
from public.topics tp where b.topic_id = tp.id and tp.title = '100 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 2 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 0 and b.content = '84 санында неше бірлік бар?';
update public.questions q set question_text = '84 санының бірліктер разрядында қай цифр тұр?', explanation = '84 = 80 + 4, бірліктер разрядындағы цифр — 4.', hint = 'Санның соңғы цифрі — бірліктер разрядындағы цифр.'
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id
where q.lesson_block_id = b.id and tp.title = '100 көлеміндегі сандардың разрядтық құрамы' and tp.grade = 2 and tp.track = 'base' and b.stage = 'bekit' and b.sort_order = 0 and q.question_text = '84 санында неше бірлік бар?';
commit;
