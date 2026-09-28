// Content-quality gate for the 113 authored lessons — runs against the
// content modules in src/data/lessonContent/ (the source of truth that
// scripts/generateLessonSeed.ts turns into SQL), so it catches problems
// before they ever reach a migration. Checks, per the audit brief:
//   - the content modules' topic set matches src/data/topics.ts exactly
//     (same title/grade/track, no extras, none missing);
//   - every topic has all 5 stages (guaranteed by TypeScript's type, but
//     re-checked defensively);
//   - Бекіт has at least 3 tasks;
//   - Қолдан and every short_answer/multiple_choice Бекіт task has a
//     non-empty correct answer, explanation and hint;
//   - no task/stage config is left empty (empty options/items/tiles/
//     steps arrays, blank titles) — the kind of authoring slip a type
//     system alone won't catch.
import { TOPICS } from '../src/data/topics'
import { GRADE1_BASE_LESSONS } from '../src/data/lessonContent/grade1Base'
import { GRADE1_LOGIC_LESSONS } from '../src/data/lessonContent/grade1Logic'
import { GRADE2_BASE_LESSONS } from '../src/data/lessonContent/grade2Base'
import { GRADE2_LOGIC_LESSONS } from '../src/data/lessonContent/grade2Logic'
import { GRADE3_BASE_LESSONS } from '../src/data/lessonContent/grade3Base'
import { GRADE3_LOGIC_LESSONS } from '../src/data/lessonContent/grade3Logic'
import { GRADE4_BASE_LESSONS } from '../src/data/lessonContent/grade4Base'
import { GRADE4_LOGIC_LESSONS } from '../src/data/lessonContent/grade4Logic'
import type { TopicLessonContent, BekitTask } from '../src/data/lessonContent/types'

const ALL_LESSONS: TopicLessonContent[] = [
  ...GRADE1_BASE_LESSONS, ...GRADE1_LOGIC_LESSONS,
  ...GRADE2_BASE_LESSONS, ...GRADE2_LOGIC_LESSONS,
  ...GRADE3_BASE_LESSONS, ...GRADE3_LOGIC_LESSONS,
  ...GRADE4_BASE_LESSONS, ...GRADE4_LOGIC_LESSONS,
]

// The flagship lesson was authored directly as hand-written SQL
// (supabase/migrations/0007_first_lesson.sql) before the content-module
// + generator pipeline existed for the rest of the catalog — it has no
// TopicLessonContent entry and is not expected to. Excluded here by
// design, not an oversight; checked structurally instead.
const FLAGSHIP_EXCEPTIONS = new Set(['1-base-10 көлеміндегі сандардың құрамы'])

let ok = true
function fail(msg: string) { ok = false; console.error(`✗ ${msg}`) }

// 1. Cross-check against the authoritative 113-topic catalog.
const catalogKeys = new Set(TOPICS.map((t) => `${t.grade}-${t.track}-${t.title}`))
const contentKeys = new Set(ALL_LESSONS.map((t) => `${t.grade}-${t.track}-${t.title}`))

const expectedContentCount = TOPICS.length - FLAGSHIP_EXCEPTIONS.size
if (ALL_LESSONS.length !== expectedContentCount) {
  fail(`Мазмұн модульдеріндегі тақырып саны (${ALL_LESSONS.length}) күтілгеннен (${expectedContentCount} = ${TOPICS.length} − флагман) өзгеше.`)
} else {
  console.log(`✓ Мазмұн модульдеріндегі тақырып саны: ${ALL_LESSONS.length} (+ 1 флагман SQL-де жеке жазылған = ${TOPICS.length})`)
}

for (const key of catalogKeys) {
  if (FLAGSHIP_EXCEPTIONS.has(key)) continue
  if (!contentKeys.has(key)) fail(`Каталогта бар, бірақ мазмұны жазылмаған: ${key}`)
}
for (const key of contentKeys) {
  if (!catalogKeys.has(key)) fail(`Мазмұны бар, бірақ каталогта жоқ (атау/сынып/бағыт сәйкессіздігі): ${key}`)
}
if (ok) console.log('✓ Барлық тақырып атаулары/сынып/бағыт каталогпен дәл сәйкес келеді.')

// 2. Per-topic structural + content checks.
function bekitTaskLabel(task: BekitTask, i: number): string {
  return `тапсырма ${i + 1} (${task.kind})`
}

for (const t of ALL_LESSONS) {
  const label = `${t.title} (${t.grade}-сынып, ${t.track})`

  if (!t.learningObjective?.trim()) fail(`${label}: оқу мақсаты жазылмаған.`)
  if (!t.tusindir.question?.trim()) fail(`${label}: Түсіндір сұрағы бос.`)
  if (!t.qoldan.content?.trim()) fail(`${label}: Қолдан есебінің мәтіні бос.`)
  if (t.qoldan.correctAnswer === '' || t.qoldan.correctAnswer === undefined) fail(`${label}: Қолдан дұрыс жауабы жоқ.`)
  if (!t.qoldan.explanation?.trim()) fail(`${label}: Қолдан түсіндірмесі бос.`)
  if (!t.qoldan.hint?.trim()) fail(`${label}: Қолдан кеңесі бос.`)

  if (t.bekit.length < 3) fail(`${label}: Бекіт кезеңінде 3-тен кем тапсырма (${t.bekit.length}).`)

  t.bekit.forEach((task, i) => {
    const tl = `${label} — ${bekitTaskLabel(task, i)}`
    if (!task.content?.trim()) fail(`${tl}: тапсырма мәтіні бос.`)

    switch (task.kind) {
      case 'short_answer':
        if (task.correctAnswer === '' || task.correctAnswer === undefined) fail(`${tl}: дұрыс жауап жоқ.`)
        if (!task.explanation?.trim()) fail(`${tl}: түсіндірме бос.`)
        if (!task.hint?.trim()) fail(`${tl}: кеңес бос.`)
        break
      case 'multiple_choice':
        if (task.options.length < 2) fail(`${tl}: 2-ден аз жауап нұсқасы.`)
        if (!task.options.some((o) => o.correct)) fail(`${tl}: дұрыс нұсқа белгіленбеген.`)
        if (task.options.some((o) => !o.text?.trim())) fail(`${tl}: бос жауап нұсқасы бар.`)
        if (!task.explanation?.trim()) fail(`${tl}: түсіндірме бос.`)
        break
      case 'matching':
        if (task.pairs.length < 2) fail(`${tl}: 2-ден аз жұп.`)
        break
      case 'visual_matching':
        if (task.pairs.length < 2) fail(`${tl}: 2-ден аз жұп.`)
        if (task.pairs.some((p) => !p.icon?.trim() || !p.label?.trim())) fail(`${tl}: бос белгіше немесе атауы бар жұп.`)
        break
      case 'sorting':
        if (task.items.length < 2) fail(`${tl}: сұрыптауға 2-ден аз элемент.`)
        break
      case 'grouping':
        if (task.items.length < 2) fail(`${tl}: топтастыруға 2-ден аз элемент.`)
        if (!task.items.some((i2) => i2.group === 'a') || !task.items.some((i2) => i2.group === 'b')) {
          fail(`${tl}: екі топтың да кемінде бір мысалы болуы керек.`)
        }
        break
      case 'expression_builder':
        if (task.tiles.length < 2) fail(`${tl}: текше саны жеткіліксіз.`)
        if (task.target.length < 1) fail(`${tl}: дұрыс тізбек (target) бос.`)
        if (task.target.some((v) => !task.tiles.includes(v))) fail(`${tl}: target ішіндегі мән tiles тізімінде жоқ.`)
        if (!task.explanation?.trim()) fail(`${tl}: түсіндірме бос.`)
        break
      case 'find_error':
        if (task.steps.length < 2) fail(`${tl}: 2-ден аз қадам.`)
        if (task.errorIndex < 0 || task.errorIndex >= task.steps.length) fail(`${tl}: errorIndex қадамдар шегінен тыс.`)
        if (!task.explanation?.trim()) fail(`${tl}: түсіндірме бос.`)
        break
      case 'measurement':
        if (!task.unit?.trim()) fail(`${tl}: өлшем бірлігі жазылмаған.`)
        if (task.length <= 0 || task.length >= task.maxScale) fail(`${tl}: length мәні 0 мен maxScale аралығында болуы керек.`)
        if (!task.explanation?.trim()) fail(`${tl}: түсіндірме бос.`)
        break
    }
  })
}

if (!ok) {
  console.error('\nМазмұн тексеруі сәтсіз аяқталды.')
  process.exit(1)
}
console.log(`\n✓ Барлық ${ALL_LESSONS.length} тақырыптың мазмұны құрылымдық тексеруден өтті.`)
