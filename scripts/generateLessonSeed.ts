// Turns a TopicLessonContent[] array into a SQL migration that:
//   1. publishes the matching (already-seeded, draft) topic row and
//      sets its learning_objective;
//   2. inserts its five lesson_blocks (kor/qurastyr/tusindir/qoldan/bekit)
//      with the right block_type + JSONB configuration for the generic
//      renderers in src/features/lesson/*Renderer.tsx to pick up;
//   3. inserts the qoldan question and every bekit task's question
//      (+ options for multiple_choice, or configuration.pairs for
//      matching).
//
// Usage: npx tsx scripts/generateLessonSeed.ts <content-module> <output-file>
// Example:
//   npx tsx scripts/generateLessonSeed.ts src/data/lessonContent/grade1Logic.ts supabase/migrations/0008_grade1_logic_lessons.sql
import { writeFileSync } from 'fs'
import type { TopicLessonContent, BekitTask } from '../src/data/lessonContent/types'

function esc(s: string): string {
  return s.replace(/'/g, "''")
}

function sqlString(s: string): string {
  return `'${esc(s)}'`
}

function sqlAnswer(v: string | number): string {
  // correct_answer is stored as jsonb; a bare number needs no quotes
  // inside the JSON literal, a string does.
  return typeof v === 'number' ? `'${v}'::jsonb` : `'"${esc(String(v))}"'::jsonb`
}

function topicMatchWhere(t: TopicLessonContent, alias?: string): string {
  const p = alias ? `${alias}.` : ''
  return `${p}title = ${sqlString(t.title)} and ${p}grade = ${t.grade} and ${p}track = ${sqlString(t.track)}`
}

function korConfig(t: TopicLessonContent): { blockType: string; content: string | null; mediaUrl: string | null; config: string } {
  if (t.kor.kind === 'pairs-infographic') {
    const pairsJson = `jsonb_build_array(${t.kor.pairs.map(([a, b]) => `jsonb_build_array(${a},${b})`).join(', ')})`
    return {
      blockType: 'infographic',
      content: null,
      mediaUrl: t.kor.mediaUrl ?? '/infographics/ten-composition.png',
      config: `jsonb_build_object('pairs', ${pairsJson})`,
    }
  }
  if (t.kor.kind === 'scene') {
    const itemsJson = `jsonb_build_array(${t.kor.items.map((it) => `jsonb_build_object('icon', ${sqlString(it.icon)}, 'label', ${sqlString(it.label)})`).join(', ')})`
    return {
      blockType: 'infographic',
      content: null,
      mediaUrl: null,
      config: `jsonb_build_object('kind', 'scene', 'items', ${itemsJson}, 'caption', ${sqlString(t.kor.caption)})`,
    }
  }
  if (t.kor.kind === 'video') {
    return {
      blockType: 'video',
      content: null,
      mediaUrl: t.kor.videoUrl,
      config: `jsonb_build_object('kind', 'video', 'caption', ${sqlString(t.kor.caption)})`,
    }
  }
  const slidesJson = `jsonb_build_array(${t.kor.slides.map((s) => sqlString(s)).join(', ')})`
  return { blockType: 'text', content: null, mediaUrl: null, config: `jsonb_build_object('kind', 'story', 'slides', ${slidesJson})` }
}

function qurastyrConfig(t: TopicLessonContent): { blockType: string; content: string | null; config: string } {
  const q = t.qurastyr
  switch (q.kind) {
    case 'combine-split':
      return { blockType: 'number_builder', content: null, config: `jsonb_build_object('total', ${q.total}, 'startLeft', ${q.startLeft})` }
    case 'count-click':
      return {
        blockType: 'number_builder',
        content: q.content,
        config: `jsonb_build_object('kind', 'count-click', 'icon', ${sqlString(q.icon)}, 'count', ${q.count})`,
      }
    case 'compare':
      return {
        blockType: 'number_builder',
        content: q.content,
        config: `jsonb_build_object('kind', 'compare', 'iconA', ${sqlString(q.iconA)}, 'countA', ${q.countA}, 'iconB', ${sqlString(q.iconB)}, 'countB', ${q.countB})`,
      }
    case 'pattern-number':
    case 'pattern-shape': {
      const seqJson = `jsonb_build_array(${q.sequence.map((s) => sqlString(s)).join(', ')})`
      return {
        blockType: 'number_builder',
        content: q.content,
        config: `jsonb_build_object('kind', ${sqlString(q.kind)}, 'sequence', ${seqJson}, 'blankIndex', ${q.blankIndex}, 'correctValue', ${sqlString(q.correctValue)})`,
      }
    }
    case 'magic-square': {
      const cellsJson = `jsonb_build_array(${q.cells.map((c) => (c === null ? 'null' : String(c))).join(', ')})`
      return {
        blockType: 'number_builder',
        content: q.content,
        config: `jsonb_build_object('kind', 'magic-square', 'cells', ${cellsJson}, 'targetSum', ${q.targetSum})`,
      }
    }
    case 'shape-match': {
      const shapesJson = `jsonb_build_array(${q.shapes.map((s) => sqlString(s)).join(', ')})`
      return {
        blockType: 'number_builder',
        content: q.content,
        config: `jsonb_build_object('kind', 'shape-match', 'shapes', ${shapesJson}, 'targetShape', ${sqlString(q.targetShape)})`,
      }
    }
    case 'ordinal':
      return {
        blockType: 'number_builder',
        content: q.content,
        config: `jsonb_build_object('kind', 'ordinal', 'icon', ${sqlString(q.icon)}, 'count', ${q.count}, 'targetPosition', ${q.targetPosition})`,
      }
    case 'value-compare':
      return {
        blockType: 'number_builder',
        content: q.content,
        config: `jsonb_build_object('kind', 'value-compare', 'labelA', ${sqlString(q.labelA)}, 'labelB', ${sqlString(q.labelB)}, 'numericA', ${q.numericA}, 'numericB', ${q.numericB})`,
      }
    case 'perimeter':
      return {
        blockType: 'number_builder',
        content: q.content,
        config: `jsonb_build_object('kind', 'perimeter', 'width', ${q.width}, 'height', ${q.height}, 'unit', ${sqlString(q.unit)})`,
      }
    case 'area':
      return {
        blockType: 'number_builder',
        content: q.content,
        config: `jsonb_build_object('kind', 'area', 'width', ${q.width}, 'height', ${q.height}, 'unit', ${sqlString(q.unit)})`,
      }
    case 'number-line':
      return {
        blockType: 'number_builder',
        content: q.content,
        config: `jsonb_build_object('kind', 'number-line', 'min', ${q.min}, 'max', ${q.max}, 'target', ${q.target})`,
      }
    case 'clock':
      return {
        blockType: 'number_builder',
        content: q.content,
        config: `jsonb_build_object('kind', 'clock', 'hour', ${q.hour}, 'minute', ${q.minute})`,
      }
    case 'balance-scale':
      return {
        blockType: 'number_builder',
        content: q.content,
        config: `jsonb_build_object('kind', 'balance-scale', 'leftWeights', jsonb_build_array(${q.leftWeights.join(', ')}), 'rightKnown', ${q.rightKnown})`,
      }
    case 'money': {
      const itemsJson = `jsonb_build_array(${q.items.map((i) => `jsonb_build_object('label', ${sqlString(i.label)}, 'price', ${i.price})`).join(', ')})`
      return {
        blockType: 'number_builder',
        content: q.content,
        config: `jsonb_build_object('kind', 'money', 'items', ${itemsJson})`,
      }
    }
  }
}

function generateTopicSql(t: TopicLessonContent): string {
  const where = topicMatchWhere(t)
  const lines: string[] = []

  lines.push(`-- ==== ${t.title} (${t.grade}-сынып, ${t.track}) ====`)
  lines.push(`update public.topics set status = 'published', learning_objective = ${sqlString(t.learningObjective)} where ${where};`)
  lines.push('')

  // Көр
  const kor = korConfig(t)
  lines.push(`insert into public.lesson_blocks (topic_id, stage, block_type, content, media_url, configuration, sort_order)`)
  lines.push(
    `select id, 'kor', '${kor.blockType}', ${kor.content ? sqlString(kor.content) : 'null'}, ${kor.mediaUrl ? sqlString(kor.mediaUrl) : 'null'}, ${kor.config}, 0 from public.topics where ${where};`
  )
  lines.push('')

  // Құрастыр
  const qur = qurastyrConfig(t)
  lines.push(`insert into public.lesson_blocks (topic_id, stage, block_type, content, configuration, sort_order)`)
  lines.push(`select id, 'qurastyr', '${qur.blockType}', ${qur.content ? sqlString(qur.content) : 'null'}, ${qur.config}, 0 from public.topics where ${where};`)
  lines.push('')

  // Түсіндір
  lines.push(`insert into public.lesson_blocks (topic_id, stage, block_type, content, sort_order)`)
  lines.push(`select id, 'tusindir', 'short_answer', ${sqlString(t.tusindir.question)}, 0 from public.topics where ${where};`)
  lines.push('')

  // Қолдан
  const qoldanConfig = t.qoldan.partWhole
    ? `jsonb_build_object('total', ${t.qoldan.partWhole.total}, 'known', ${t.qoldan.partWhole.known}, 'knownLabel', ${sqlString(t.qoldan.partWhole.knownLabel)}, 'unknownLabel', ${sqlString(t.qoldan.partWhole.unknownLabel)})`
    : `'{}'::jsonb`
  lines.push(`insert into public.lesson_blocks (topic_id, stage, block_type, content, configuration, sort_order)`)
  lines.push(`select id, 'qoldan', 'question', ${sqlString(t.qoldan.content)}, ${qoldanConfig}, 0 from public.topics where ${where};`)
  lines.push('')
  lines.push(`insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)`)
  lines.push(
    `select lb.id, ${sqlString(t.qoldan.content)}, 'short_answer', ${sqlAnswer(t.qoldan.correctAnswer)}, ${sqlString(t.qoldan.explanation)}, ${sqlString(t.qoldan.hint)}, 1 from public.lesson_blocks lb join public.topics tp on tp.id = lb.topic_id where ${topicMatchWhere(t, 'tp')} and lb.stage = 'qoldan';`
  )
  lines.push('')

  // Бекіт
  t.bekit.forEach((task: BekitTask, i: number) => {
    const blockType =
      task.kind === 'multiple_choice' ? 'multiple_choice' :
      task.kind === 'matching' || task.kind === 'visual_matching' ? 'matching' :
      task.kind === 'sorting' ? 'ordering' :
      task.kind === 'grouping' ? 'drag_drop' :
      task.kind === 'expression_builder' || task.kind === 'find_error' || task.kind === 'measurement' ? 'question' :
      'short_answer'
    const taskWhereBlocks = topicMatchWhere(t, 't2')

    if (task.kind === 'matching') {
      const pairsJson = `jsonb_build_array(${task.pairs.map(([a, b]) => `jsonb_build_array(${a},${b})`).join(', ')})`
      lines.push(`insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)`)
      lines.push(
        `select id, 'bekit', '${blockType}', ${sqlString(task.title)}, ${sqlString(task.content)}, jsonb_build_object('pairs', ${pairsJson}), ${i} from public.topics where ${where};`
      )
      lines.push('')
      return
    }

    if (task.kind === 'visual_matching') {
      const pairsJson = `jsonb_build_array(${task.pairs.map((p) => `jsonb_build_object('icon', ${sqlString(p.icon)}, 'label', ${sqlString(p.label)})`).join(', ')})`
      lines.push(`insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)`)
      lines.push(
        `select id, 'bekit', '${blockType}', ${sqlString(task.title)}, ${sqlString(task.content)}, jsonb_build_object('kind', 'visual', 'pairs', ${pairsJson}), ${i} from public.topics where ${where};`
      )
      lines.push('')
      return
    }

    if (task.kind === 'measurement') {
      lines.push(`insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)`)
      lines.push(
        `select id, 'bekit', '${blockType}', ${sqlString(task.title)}, ${sqlString(task.content)}, jsonb_build_object('kind', 'measurement', 'unit', ${sqlString(task.unit)}, 'length', ${task.length}, 'maxScale', ${task.maxScale}), ${i} from public.topics where ${where};`
      )
      lines.push('')
      lines.push(`insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)`)
      lines.push(
        `select lb.id, ${sqlString(task.content)}, 'measurement', ${sqlAnswer(task.length)}, ${sqlString(task.explanation)}, ${sqlString('')}, 1 from public.lesson_blocks lb join public.topics t2 on t2.id = lb.topic_id where ${taskWhereBlocks} and lb.stage = 'bekit' and lb.sort_order = ${i};`
      )
      lines.push('')
      return
    }

    if (task.kind === 'sorting') {
      const itemsJson = `jsonb_build_array(${task.items.map((s) => sqlString(s)).join(', ')})`
      lines.push(`insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)`)
      lines.push(
        `select id, 'bekit', '${blockType}', ${sqlString(task.title)}, ${sqlString(task.content)}, jsonb_build_object('items', ${itemsJson}), ${i} from public.topics where ${where};`
      )
      lines.push('')
      return
    }

    if (task.kind === 'grouping') {
      const itemsJson = `jsonb_build_array(${task.items.map((it) => `jsonb_build_object('label', ${sqlString(it.label)}, 'group', ${sqlString(it.group)})`).join(', ')})`
      lines.push(`insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)`)
      lines.push(
        `select id, 'bekit', '${blockType}', ${sqlString(task.title)}, ${sqlString(task.content)}, jsonb_build_object('items', ${itemsJson}, 'groupALabel', ${sqlString(task.groupALabel)}, 'groupBLabel', ${sqlString(task.groupBLabel)}), ${i} from public.topics where ${where};`
      )
      lines.push('')
      return
    }

    if (task.kind === 'expression_builder') {
      const tilesJson = `jsonb_build_array(${task.tiles.map((s) => sqlString(s)).join(', ')})`
      const targetJson = `jsonb_build_array(${task.target.map((s) => sqlString(s)).join(', ')})`
      lines.push(`insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)`)
      lines.push(
        `select id, 'bekit', '${blockType}', ${sqlString(task.title)}, ${sqlString(task.content)}, jsonb_build_object('kind', 'expression_builder', 'tiles', ${tilesJson}, 'target', ${targetJson}), ${i} from public.topics where ${where};`
      )
      lines.push('')
      lines.push(`insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)`)
      lines.push(
        `select lb.id, ${sqlString(task.content)}, 'expression_builder', ${sqlString(task.target.join(' '))}::jsonb, ${sqlString(task.explanation)}, ${sqlString('')}, 1 from public.lesson_blocks lb join public.topics t2 on t2.id = lb.topic_id where ${taskWhereBlocks} and lb.stage = 'bekit' and lb.sort_order = ${i};`
      )
      lines.push('')
      return
    }

    if (task.kind === 'find_error') {
      const stepsJson = `jsonb_build_array(${task.steps.map((s) => sqlString(s)).join(', ')})`
      lines.push(`insert into public.lesson_blocks (topic_id, stage, block_type, title, content, configuration, sort_order)`)
      lines.push(
        `select id, 'bekit', '${blockType}', ${sqlString(task.title)}, ${sqlString(task.content)}, jsonb_build_object('kind', 'find_error', 'steps', ${stepsJson}, 'errorIndex', ${task.errorIndex}), ${i} from public.topics where ${where};`
      )
      lines.push('')
      lines.push(`insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)`)
      lines.push(
        `select lb.id, ${sqlString(task.content)}, 'find_error', ${sqlAnswer(task.errorIndex)}, ${sqlString(task.explanation)}, ${sqlString('')}, 1 from public.lesson_blocks lb join public.topics t2 on t2.id = lb.topic_id where ${taskWhereBlocks} and lb.stage = 'bekit' and lb.sort_order = ${i};`
      )
      lines.push('')
      return
    }

    lines.push(`insert into public.lesson_blocks (topic_id, stage, block_type, title, content, sort_order)`)
    lines.push(`select id, 'bekit', '${blockType}', ${sqlString(task.title)}, ${sqlString(task.content)}, ${i} from public.topics where ${where};`)
    lines.push('')

    if (task.kind === 'short_answer') {
      lines.push(`insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)`)
      lines.push(
        `select lb.id, ${sqlString(task.content)}, 'short_answer', ${sqlAnswer(task.correctAnswer)}, ${sqlString(task.explanation)}, ${sqlString(task.hint)}, 1 from public.lesson_blocks lb join public.topics t2 on t2.id = lb.topic_id where ${taskWhereBlocks} and lb.stage = 'bekit' and lb.sort_order = ${i};`
      )
      lines.push('')
    } else if (task.kind === 'multiple_choice') {
      const correctOption = task.options.find((o) => o.correct)!
      lines.push(`insert into public.questions (lesson_block_id, question_text, question_type, correct_answer, explanation, hint, points)`)
      lines.push(
        `select lb.id, ${sqlString(task.content)}, 'multiple_choice', ${sqlAnswer(correctOption.text)}, ${sqlString(task.explanation)}, ${sqlString(task.hint)}, 1 from public.lesson_blocks lb join public.topics t2 on t2.id = lb.topic_id where ${taskWhereBlocks} and lb.stage = 'bekit' and lb.sort_order = ${i};`
      )
      lines.push('')
      const optionRows = task.options.map((o, oi) => `(${sqlString(o.text)}, ${o.correct}, ${oi})`).join(', ')
      lines.push(`insert into public.question_options (question_id, option_text, is_correct, sort_order)`)
      lines.push(
        `select q.id, opt.text, opt.is_correct, opt.ord from public.questions q join public.lesson_blocks lb on lb.id = q.lesson_block_id join public.topics t2 on t2.id = lb.topic_id cross join (values ${optionRows}) as opt(text, is_correct, ord) where ${taskWhereBlocks} and lb.stage = 'bekit' and lb.sort_order = ${i};`
      )
      lines.push('')
    }
  })

  return lines.join('\n')
}

const [, , contentModule, outputFile] = process.argv
if (!contentModule || !outputFile) {
  console.error('Usage: npx tsx scripts/generateLessonSeed.ts <content-module-relative-to-scripts> <output-file>')
  process.exit(1)
}

async function main() {
  const mod = await import(contentModule.startsWith('.') ? contentModule : `../${contentModule}`)
  const key = Object.keys(mod).find((k) => Array.isArray(mod[k]))
  if (!key) throw new Error('No exported array found in content module')
  const lessons = mod[key] as TopicLessonContent[]

  const header = [
    `-- Generated by scripts/generateLessonSeed.ts from ${contentModule}.`,
    '-- Do not hand-edit — change the content module and regenerate instead.',
    '',
  ].join('\n')

  const body = lessons.map(generateTopicSql).join('\n\n')
  writeFileSync(outputFile, header + body + '\n')
  console.log(`Wrote ${lessons.length} topic lessons to ${outputFile}`)
}

main()
