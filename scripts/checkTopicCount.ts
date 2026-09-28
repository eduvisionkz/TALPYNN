// Fails loudly if the topic catalog ever drifts from the brief's
// requirement: exactly 113 topics — 60 base + 53 logic — 15 per
// grade/track cell except where the brief's own list is shorter
// (2-logic has 12, 4-logic has 11).
import { TOPICS, BASE_TOPIC_COUNT, LOGIC_TOPIC_COUNT, TOTAL_TOPIC_COUNT } from '../src/data/topics'

const EXPECTED_TOTAL = 113
const EXPECTED_BASE = 60
const EXPECTED_LOGIC = 53

let ok = true

function check(label: string, actual: number, expected: number) {
  if (actual !== expected) {
    ok = false
    console.error(`✗ ${label}: күтілгені ${expected}, нақты ${actual}`)
  } else {
    console.log(`✓ ${label}: ${actual}`)
  }
}

check('Барлық тақырып саны', TOTAL_TOPIC_COUNT, EXPECTED_TOTAL)
check('Негізгі математика', BASE_TOPIC_COUNT, EXPECTED_BASE)
check('Логика және функционалдық сауаттылық', LOGIC_TOPIC_COUNT, EXPECTED_LOGIC)

// No duplicate titles within the same grade+track (a weaker but useful
// data-quality check — the brief's list has no duplicates).
const seen = new Set<string>()
for (const t of TOPICS) {
  const key = `${t.grade}-${t.track}-${t.title}`
  if (seen.has(key)) {
    ok = false
    console.error(`✗ Қайталанған тақырып: ${t.title} (${t.grade}-сынып, ${t.track})`)
  }
  seen.add(key)
}

if (!ok) {
  console.error('\nТақырыптар каталогы брифке сәйкес келмейді.')
  process.exit(1)
}
console.log('\nБарлық тексеру сәтті өтті.')
