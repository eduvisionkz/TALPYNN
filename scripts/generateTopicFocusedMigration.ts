import { writeFileSync } from 'node:fs'
import { TOPIC_FOCUSED_REVISIONS } from '../src/data/lessonContent/topicFocusedCorrections'
const q = (s: string) => `'${s.replaceAll("'", "''")}'`
const lines = ['-- Replace unrelated fifth matching tasks with topic-specific choices. Do not overwrite edited tasks.', 'begin;']
for (const [key, [content, answer, distractors, explanation]] of Object.entries(TOPIC_FOCUSED_REVISIONS)) {
  const match = key.match(/^([1-4])-(base|logic)-(.+)$/)
  if (!match) throw new Error(`Invalid topic key: ${key}`)
  const [,grade,track,title] = match
  const topic = `tp.title = ${q(title)} and tp.grade = ${grade} and tp.track = ${q(track)}`
  lines.push(`update public.lesson_blocks b set block_type = 'multiple_choice', title = 'Тақырып бойынша таңда', content = ${q(content)}, configuration = '{}'::jsonb
from public.topics tp where tp.id = b.topic_id and ${topic} and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'matching' and b.content like 'Қосындысы %';`)
  lines.push(`insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, ${q(content)}, 'multiple_choice', ${q(JSON.stringify(answer))}::jsonb, ${q(explanation)}, 'Тақырыптағы негізгі ережені еске түсір.', 1
from public.lesson_blocks b join public.topics tp on tp.id = b.topic_id where ${topic} and b.stage = 'bekit' and b.sort_order = 4
and b.block_type = 'multiple_choice' and b.content = ${q(content)}
and not exists (select 1 from public.questions qq where qq.lesson_block_id = b.id);`)
  for (const [index, option] of [answer,...distractors].entries()) {
    lines.push(`insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, ${q(option)}, ${index === 0}, ${index} from public.questions qq
join public.lesson_blocks b on b.id = qq.lesson_block_id join public.topics tp on tp.id = b.topic_id
where ${topic} and b.stage = 'bekit' and b.sort_order = 4 and b.content = ${q(content)} and qq.question_text = ${q(content)}
and not exists (select 1 from public.question_options o where o.question_id = qq.id and o.sort_order = ${index});`)
  }
}
lines.push('commit;', '')
writeFileSync('supabase/migrations/0034_topic_focused_tasks.sql', lines.join('\n\n'))
console.log(`Wrote ${Object.keys(TOPIC_FOCUSED_REVISIONS).length} reviewed topic corrections.`)
