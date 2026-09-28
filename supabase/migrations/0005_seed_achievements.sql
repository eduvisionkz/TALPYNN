-- Talpyn — a small starter set of rule-based achievements.
-- "condition" is read by the frontend (src/lib/achievements.ts), not by
-- a database trigger — this keeps the awarding logic auditable and easy
-- for a teacher/admin to extend without SQL.

insert into public.achievements (code, title, description, condition) values
  ('first_topic_completed', 'Алғашқы қадам', 'Алғашқы тақырыпты толық аяқтады', '{"type":"topics_completed","count":1}'),
  ('five_topics_completed', 'Талпынған талапкер', 'Бес тақырыпты толық аяқтады', '{"type":"topics_completed","count":5}'),
  ('perfect_score', 'Мінсіз нәтиже', 'Бір тақырыпты 100% нәтижемен аяқтады', '{"type":"topic_percent","percent":100}')
on conflict (code) do nothing;
