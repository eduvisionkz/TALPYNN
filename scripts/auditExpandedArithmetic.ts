import { GRADE1_BASE_LESSONS } from '../src/data/lessonContent/grade1Base'
import { GRADE1_LOGIC_LESSONS } from '../src/data/lessonContent/grade1Logic'
import { GRADE2_BASE_LESSONS } from '../src/data/lessonContent/grade2Base'
import { GRADE2_LOGIC_LESSONS } from '../src/data/lessonContent/grade2Logic'
import { GRADE3_BASE_LESSONS } from '../src/data/lessonContent/grade3Base'
import { GRADE3_LOGIC_LESSONS } from '../src/data/lessonContent/grade3Logic'
import { GRADE4_BASE_LESSONS } from '../src/data/lessonContent/grade4Base'
import { GRADE4_LOGIC_LESSONS } from '../src/data/lessonContent/grade4Logic'
const lessons = [...GRADE1_BASE_LESSONS, ...GRADE1_LOGIC_LESSONS, ...GRADE2_BASE_LESSONS, ...GRADE2_LOGIC_LESSONS, ...GRADE3_BASE_LESSONS, ...GRADE3_LOGIC_LESSONS, ...GRADE4_BASE_LESSONS, ...GRADE4_LOGIC_LESSONS]
let checked = 0
const errors: string[] = []
function calculate(a: number, op: string, b: number) {
  return op === '+' ? a + b : op === '−' ? a - b : op === '×' ? a * b : a / b
}
for (const lesson of lessons) for (const task of lesson.bekit.slice(5)) {
  if (task.kind !== 'short_answer') continue
  // A complete, standalone calculation in the question must agree with the answer.
  const direct = task.content.match(/^(?:Бағанмен (?:қос|азайт): )?(\d+)\s*([+−×÷])\s*(\d+)\s*(?:неше\??|\.)$/)
  if (direct && typeof task.correctAnswer === 'number') {
    checked++
    if (calculate(Number(direct[1]), direct[2], Number(direct[3])) !== task.correctAnswer) errors.push(`${lesson.title}: ${task.content}`)
  }
}
if (errors.length) { console.error(errors.join('\n')); process.exit(1) }
console.log(`Verified ${checked} standalone arithmetic answers in 560 new tasks.`)
