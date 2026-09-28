import { writeFileSync } from 'node:fs'
import { GRADE1_BASE_LESSONS } from '../src/data/lessonContent/grade1Base'
import { GRADE1_LOGIC_LESSONS } from '../src/data/lessonContent/grade1Logic'
import { GRADE2_BASE_LESSONS } from '../src/data/lessonContent/grade2Base'
import { GRADE2_LOGIC_LESSONS } from '../src/data/lessonContent/grade2Logic'
import { GRADE3_BASE_LESSONS } from '../src/data/lessonContent/grade3Base'
import { GRADE3_LOGIC_LESSONS } from '../src/data/lessonContent/grade3Logic'
import { GRADE4_BASE_LESSONS } from '../src/data/lessonContent/grade4Base'
import { GRADE4_LOGIC_LESSONS } from '../src/data/lessonContent/grade4Logic'
import type { BekitTask } from '../src/data/lessonContent/types'
const firstFive = GRADE1_BASE_LESSONS.slice(0, 5)
const remaining = GRADE1_BASE_LESSONS.slice(5)
const firstLogic = GRADE1_LOGIC_LESSONS.slice(0, 5)
const remainingLogic = GRADE1_LOGIC_LESSONS.slice(5)
const grade2Base = GRADE2_BASE_LESSONS
const grade2Logic = GRADE2_LOGIC_LESSONS
const grade3Base = GRADE3_BASE_LESSONS
const grade3Logic = GRADE3_LOGIC_LESSONS
const grade4Base = GRADE4_BASE_LESSONS
const grade4Logic = GRADE4_LOGIC_LESSONS
const q = (s: string) => `'${s.replaceAll("'", "''")}'`
let lines: string[] = []
function addTask(title: string, grade: number, track: 'base' | 'logic', index: number, t: BekitTask) {
  const topic = `tp.title = ${q(title)} and tp.grade = ${grade} and tp.track = ${q(track)}`
  const blockType = t.kind === 'multiple_choice' ? 'multiple_choice' : t.kind === 'sorting' ? 'ordering' : 'short_answer'
  if (!['multiple_choice', 'sorting', 'short_answer'].includes(t.kind)) throw new Error(`Unsupported task: ${t.kind}`)
  const config = t.kind === 'sorting' ? q(JSON.stringify({ items: t.items })) + '::jsonb' : "'{}'::jsonb"
  lines.push(`insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)
select tp.id, 'bekit', ${q(blockType)}, ${q(t.title)}, ${q(t.content)}, ${config}, ${index}
from public.topics tp where ${topic}
and not exists (select 1 from public.lesson_blocks b where b.topic_id=tp.id and b.stage='bekit' and b.sort_order=${index});`)
  if (t.kind === 'sorting') return
  const answer = t.kind === 'short_answer' ? t.correctAnswer : t.options.find(o => o.correct)?.text
  if (answer === undefined) throw new Error('Missing answer')
  lines.push(`insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)
select b.id, ${q(t.content)}, ${q(t.kind)}, ${q(JSON.stringify(answer))}::jsonb, ${q(t.explanation)}, ${q(t.hint)}, 1
from public.lesson_blocks b join public.topics tp on tp.id=b.topic_id where ${topic} and b.stage='bekit' and b.sort_order=${index}
and not exists (select 1 from public.questions qq where qq.lesson_block_id=b.id);`)
  if (t.kind === 'multiple_choice') {
    t.options.forEach((option, oi) => lines.push(`insert into public.question_options (question_id, option_text, is_correct, sort_order)
select qq.id, ${q(option.text)}, ${option.correct}, ${oi} from public.questions qq
join public.lesson_blocks b on b.id=qq.lesson_block_id join public.topics tp on tp.id=b.topic_id
where ${topic} and b.stage='bekit' and b.sort_order=${index}
and not exists (select 1 from public.question_options o where o.question_id=qq.id and o.sort_order=${oi});`))
  }
}
for (const [topics, migration, label, grade, track] of [
  [firstFive, '0021_grade1_first_five_task_expansion.sql', 'first five', 1, 'base'],
  [remaining, '0022_grade1_remaining_base_task_expansion.sql', 'remaining nine', 1, 'base'],
  [firstLogic, '0023_grade1_first_five_logic_task_expansion.sql', 'first five logic', 1, 'logic'],
  [remainingLogic, '0024_grade1_remaining_logic_task_expansion.sql', 'remaining ten logic', 1, 'logic'],
  [grade2Base, '0025_grade2_base_task_expansion.sql', 'Grade 2 base', 2, 'base'],
  [grade2Logic, '0026_grade2_logic_task_expansion.sql', 'Grade 2 logic', 2, 'logic'],
  [grade3Base, '0028_grade3_base_task_expansion.sql', 'Grade 3 base', 3, 'base'],
  [grade3Logic, '0029_grade3_logic_task_expansion.sql', 'Grade 3 logic', 3, 'logic'],
  [grade4Base, '0030_grade4_base_task_expansion.sql', 'Grade 4 base', 4, 'base'],
  [grade4Logic, '0031_grade4_logic_task_expansion.sql', 'Grade 4 logic', 4, 'logic'],
] as const) {
  lines = [`-- Additional reviewed tasks for the ${label} topics. Run migrations in numeric order.`, 'begin;']
  for (const lesson of topics) {
    if (lesson.bekit.length !== 10) throw new Error(`${lesson.title}: expected ten tasks`)
    lesson.bekit.slice(5).forEach((task, offset) => addTask(lesson.title, grade, track, offset + 5, task))
  }
  lines.push('commit;', '')
  writeFileSync(`supabase/migrations/${migration}`, lines.join('\n\n'))
  console.log(`Generated ${migration}: ${topics.length * 5} tasks`)
}
