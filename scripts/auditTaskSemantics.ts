import { GRADE1_BASE_LESSONS } from '../src/data/lessonContent/grade1Base'
import { GRADE1_LOGIC_LESSONS } from '../src/data/lessonContent/grade1Logic'
import { GRADE2_BASE_LESSONS } from '../src/data/lessonContent/grade2Base'
import { GRADE2_LOGIC_LESSONS } from '../src/data/lessonContent/grade2Logic'
import { GRADE3_BASE_LESSONS } from '../src/data/lessonContent/grade3Base'
import { GRADE3_LOGIC_LESSONS } from '../src/data/lessonContent/grade3Logic'
import { GRADE4_BASE_LESSONS } from '../src/data/lessonContent/grade4Base'
import { GRADE4_LOGIC_LESSONS } from '../src/data/lessonContent/grade4Logic'
const lessons = [...GRADE1_BASE_LESSONS,...GRADE1_LOGIC_LESSONS,...GRADE2_BASE_LESSONS,...GRADE2_LOGIC_LESSONS,...GRADE3_BASE_LESSONS,...GRADE3_LOGIC_LESSONS,...GRADE4_BASE_LESSONS,...GRADE4_LOGIC_LESSONS]
let count = 0
let arithmeticClaims = 0
const errors: string[] = []
// Only complete numeric equalities are mechanically checked; statements with
// remainders and chained equalities require separate pedagogical review.
const arithmetic = /(?<![\d+−×÷=])(?<!\d\s)(\d+(?:\s*[+−×÷]\s*\d+)+)\s*=\s*(\d+)(?![\d]|\s*[+−×÷=])/g
for (const lesson of lessons) for (const [i, task] of [lesson.qoldan, ...lesson.bekit].entries()) {
  const explanation = 'explanation' in task ? task.explanation : ''
  for (const match of explanation.matchAll(arithmetic)) {
    if (explanation.slice(match.index + match[0].length, match.index + match[0].length + 12).includes('қалдық')) continue
    const expression = match[1].replaceAll('×','*').replaceAll('÷','/').replaceAll('−','-')
    const value = Function(`"use strict";return (${expression})`)() as number
    arithmeticClaims++
    if (value !== Number(match[2])) errors.push(`${lesson.grade} ${lesson.title}, #${i}: incorrect equality ${match[0]}`)
  }
}
for (const lesson of lessons) for (const [i, task] of lesson.bekit.entries()) {
  const tag = `${lesson.grade} ${lesson.title}, #${i + 1}`
  if (task.kind === 'multiple_choice') {
    count++
    if (task.options.filter(o => o.correct).length !== 1) errors.push(`${tag}: expected one correct choice`)
    if (new Set(task.options.map(o => o.text)).size !== task.options.length) errors.push(`${tag}: duplicate choice`)
  }
  if (task.kind === 'matching') {
    count++
    if (new Set(task.pairs.map(p => p[0])).size !== task.pairs.length || new Set(task.pairs.map(p => p[1])).size !== task.pairs.length) errors.push(`${tag}: repeated value makes matching impossible`)
    const sum = task.content.match(/(?:Қосындысы|қосындысы)\s+(\d+)/)
    if (sum && task.pairs.some(([a,b]) => a+b !== Number(sum[1]))) errors.push(`${tag}: pairs do not add to ${sum[1]}`)
  }
  if (task.kind === 'visual_matching') {
    count++
    if (new Set(task.pairs.map(p => p.icon)).size !== task.pairs.length || new Set(task.pairs.map(p => p.label)).size !== task.pairs.length) errors.push(`${tag}: repeated icon or label`)
  }
  if (task.kind === 'sorting') {
    count++
    if (new Set(task.items).size !== task.items.length) errors.push(`${tag}: repeated item`)
    if (task.items.every(item => /^\d+$/.test(item))) {
      const numbers = task.items.map(Number)
      const ascending = /өсу|кіші.*үлкен/i.test(task.content+' '+task.title)
      const descending = /кему|үлкен.*кіші/i.test(task.content+' '+task.title)
      if (ascending && !descending && numbers.some((n,j) => j && n < numbers[j-1])) errors.push(`${tag}: expected ascending, got ${numbers}`)
      if (descending && !ascending && numbers.some((n,j) => j && n > numbers[j-1])) errors.push(`${tag}: expected descending, got ${numbers}`)
    }
  }
  if (task.kind === 'expression_builder') {
    count++
    const tileCounts = new Map<string,number>()
    for (const tile of task.tiles) tileCounts.set(tile,(tileCounts.get(tile)??0)+1)
    for (const tile of task.target) { const left = (tileCounts.get(tile)??0)-1; tileCounts.set(tile,left); if(left<0) errors.push(`${tag}: insufficient tile ${tile}`) }
  }
}
if(errors.length) {console.error(errors.join('\n'));process.exit(1)}
console.log(`Validated ${count} choice, matching, sorting and expression tasks; ${arithmeticClaims} numeric equalities.`)
