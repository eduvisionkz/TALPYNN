import { writeFileSync } from 'node:fs'
import { GRADE1_BASE_LESSONS } from '../src/data/lessonContent/grade1Base'
import { GRADE1_LOGIC_LESSONS } from '../src/data/lessonContent/grade1Logic'
import { GRADE2_BASE_LESSONS } from '../src/data/lessonContent/grade2Base'
import { GRADE2_LOGIC_LESSONS } from '../src/data/lessonContent/grade2Logic'
import { GRADE3_BASE_LESSONS } from '../src/data/lessonContent/grade3Base'
import { GRADE3_LOGIC_LESSONS } from '../src/data/lessonContent/grade3Logic'
import { GRADE4_BASE_LESSONS } from '../src/data/lessonContent/grade4Base'
import { GRADE4_LOGIC_LESSONS } from '../src/data/lessonContent/grade4Logic'
const lessons = [...GRADE1_BASE_LESSONS,...GRADE1_LOGIC_LESSONS,...GRADE2_BASE_LESSONS,...GRADE2_LOGIC_LESSONS,...GRADE3_BASE_LESSONS,...GRADE3_LOGIC_LESSONS,...GRADE4_BASE_LESSONS,...GRADE4_LOGIC_LESSONS]
const expanded = [...GRADE1_BASE_LESSONS, ...GRADE1_LOGIC_LESSONS, ...GRADE2_BASE_LESSONS, ...GRADE2_LOGIC_LESSONS, ...GRADE3_BASE_LESSONS, ...GRADE3_LOGIC_LESSONS, ...GRADE4_BASE_LESSONS, ...GRADE4_LOGIC_LESSONS]
if (expanded.some(t => t.bekit.length !== 10)) throw new Error('Expanded topics must contain exactly ten tasks')
if (expanded.some(t => new Set(t.bekit.map(task => task.content)).size !== 10)) throw new Error('Duplicate task text in expanded topics: ' + expanded.filter(t => new Set(t.bekit.map(task => task.content)).size !== 10).map(t => t.title).join(', '))
const rows = lessons.map(t => ({title:t.title, grade:t.grade, track:t.track, count:t.bekit.length, missing:Math.max(0,10-t.bekit.length)}))
const csv = ['grade,track,title,bekit_tasks,missing_to_ten',...rows.map(r=>[r.grade,r.track,`"${r.title.replaceAll('"','""')}"`,r.count,r.missing].join(','))].join('\n')+'\n'
writeFileSync('TASK_AUDIT.csv',csv)
console.log(`Audited ${rows.length} authored topics; ${rows.filter(r=>r.missing).length} need more tasks; ${rows.reduce((s,r)=>s+r.missing,0)} tasks missing. Flagship topic is SQL-only and excluded.`)
