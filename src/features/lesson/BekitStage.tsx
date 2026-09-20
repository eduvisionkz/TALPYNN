import { useMemo, useState } from 'react'
import { TalpynGuide } from './TalpynGuide'
import { ICON_SETS, type IconName } from './IconRow'
import type { LessonBlock, Question, QuestionOption } from '@/types/database'

export interface BekitBlockData {
  block: LessonBlock
  question: Question | null
  options: QuestionOption[]
}

export interface BekitResult {
  blockId: string
  isCorrect: boolean
  answer: unknown
}

interface BekitStageProps {
  blocks: BekitBlockData[]
  onFinish: (results: BekitResult[]) => void
  /** Optional immediate feedback hook — e.g. a short correct/incorrect sound. */
  onAnswer?: (isCorrect: boolean) => void
}

type OnAnswered = (correct: boolean, answer: unknown) => void

function shuffled<T>(arr: T[]): T[] {
  const copy = [...arr]
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[copy[i], copy[j]] = [copy[j], copy[i]]
  }
  return copy
}

function ShortAnswerTask({ data, onAnswered }: { data: BekitBlockData; onAnswered: OnAnswered }) {
  const [value, setValue] = useState('')
  const [attempted, setAttempted] = useState(false)
  const [isCorrect, setIsCorrect] = useState(false)
  const correct = String(data.question?.correct_answer ?? '').replace(/"/g, '')

  function check() {
    const ok = value.trim() === correct
    setAttempted(true)
    setIsCorrect(ok)
    // Only the last attempt is what gets saved, but the student may keep
    // trying (retype and re-check) until they get it, per the brief's
    // "қайта көру" — the input only locks once the answer is correct.
    onAnswered(ok, value.trim())
  }

  return (
    <div>
      <h3>{data.block.content}</h3>
      <input
        type="text"
        inputMode="numeric"
        value={value}
        onChange={(e) => { setValue(e.target.value); if (isCorrect) return }}
        style={{ width: 140 }}
        disabled={isCorrect}
      />
      {!isCorrect ? (
        <div className="actions">
          <button type="button" className="button primary" onClick={check} disabled={value.trim() === ''}>
            {attempted ? 'Қайта тексеру' : 'Тексеру'}
          </button>
        </div>
      ) : (
        <p className="form-success" role="status">Дұрыс! {data.question?.explanation}</p>
      )}
      {attempted && !isCorrect && (
        <p className="form-error" role="alert">Әлі дұрыс емес. Тағы бір рет көр.</p>
      )}
    </div>
  )
}

function MultipleChoiceTask({ data, onAnswered }: { data: BekitBlockData; onAnswered: OnAnswered }) {
  const [selected, setSelected] = useState<string | null>(null)
  const [checked, setChecked] = useState(false)
  const [isCorrect, setIsCorrect] = useState(false)

  function check(optionText: string) {
    setSelected(optionText)
    setChecked(true)
    const option = data.options.find((o) => o.option_text === optionText)
    const correct = Boolean(option?.is_correct)
    setIsCorrect(correct)
    // Every attempt is reported; the student can keep picking again after
    // a wrong choice — only a correct pick locks the options.
    onAnswered(correct, optionText)
  }

  return (
    <div>
      <h3>{data.block.content}</h3>
      <div className="answers">
        {data.options.map((opt) => (
          <button
            key={opt.id}
            type="button"
            disabled={checked && isCorrect}
            onClick={() => opt.option_text && check(opt.option_text)}
            style={{
              background: checked && selected === opt.option_text ? (opt.is_correct ? 'var(--cyan)' : '#fdecea') : undefined,
              color: checked && selected === opt.option_text ? '#fff' : undefined,
              width: 'auto',
              borderRadius: 13,
              padding: '10px 16px',
            }}
          >
            {opt.option_text}
          </button>
        ))}
      </div>
      {checked && isCorrect && <p className="form-success" role="status">Дұрыс! {data.question?.explanation}</p>}
      {checked && !isCorrect && <p className="form-error" role="alert">Әлі дұрыс емес. Тағы бір нұсқаны таңда.</p>}
    </div>
  )
}

function MatchingTask({ data, onAnswered }: { data: BekitBlockData; onAnswered: OnAnswered }) {
  const pairs = useMemo(() => (data.block.configuration.pairs as [number, number][]) ?? [], [data.block.configuration.pairs])
  const rightValues = useMemo(() => shuffled(pairs.map((p) => p[1])), [pairs])
  const [matched, setMatched] = useState<Record<number, number>>({})
  const [activeLeft, setActiveLeft] = useState<number | null>(null)
  const done = Object.keys(matched).length === pairs.length

  function pickLeft(a: number) {
    setActiveLeft(a)
  }
  function pickRight(b: number) {
    if (activeLeft === null) return
    const expected = pairs.find((p) => p[0] === activeLeft)?.[1]
    if (expected === b) {
      const next = { ...matched, [activeLeft]: b }
      setMatched(next)
      setActiveLeft(null)
      if (Object.keys(next).length === pairs.length) onAnswered(true, next)
    } else {
      setActiveLeft(null)
    }
  }

  return (
    <div>
      <h3>{data.block.content}</h3>
      <div className="two" role="group" aria-label="Сандарды сәйкестендіру">
        <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
          {pairs.map(([a]) => (
            <button
              key={a}
              type="button"
              className={activeLeft === a ? 'active' : ''}
              disabled={a in matched}
              onClick={() => pickLeft(a)}
              style={{ border: '1px solid var(--line)', borderRadius: 11, padding: 10, background: a in matched ? 'var(--pale)' : '#fff' }}
            >
              {a} {a in matched ? `↔ ${matched[a]}` : ''}
            </button>
          ))}
        </div>
        <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
          {rightValues.map((b) => {
            const isUsed = Object.values(matched).includes(b)
            return (
              <button
                key={b}
                type="button"
                disabled={isUsed}
                onClick={() => pickRight(b)}
                style={{ border: '1px solid var(--line)', borderRadius: 11, padding: 10, background: isUsed ? 'var(--pale)' : '#fff' }}
              >
                {b}
              </button>
            )
          })}
        </div>
      </div>
      {done && <p className="form-success" role="status">Барлық жұп дұрыс сәйкестендірілді!</p>}
    </div>
  )
}

/** Visual variant of matching: pictures on the left, their names on the
 * right (shuffled) — same click-to-pair interaction as the numeric
 * `MatchingTask`, but for topics where the natural pairing is an image
 * to a word rather than two numbers. */
function VisualMatchingTask({ data, onAnswered }: { data: BekitBlockData; onAnswered: OnAnswered }) {
  const pairs = useMemo(
    () => (data.block.configuration.pairs as { icon: string; label: string }[]) ?? [],
    [data.block.configuration.pairs]
  )
  const rightLabels = useMemo(() => shuffled(pairs.map((p) => p.label)), [pairs])
  const [matched, setMatched] = useState<Record<string, string>>({})
  const [activeIcon, setActiveIcon] = useState<string | null>(null)
  const done = Object.keys(matched).length === pairs.length

  function pickIcon(icon: string) {
    setActiveIcon(icon)
  }
  function pickLabel(label: string) {
    if (activeIcon === null) return
    const expected = pairs.find((p) => p.icon === activeIcon)?.label
    if (expected === label) {
      const next = { ...matched, [activeIcon]: label }
      setMatched(next)
      setActiveIcon(null)
      if (Object.keys(next).length === pairs.length) onAnswered(true, next)
    } else {
      setActiveIcon(null)
    }
  }

  return (
    <div>
      <h3>{data.block.content}</h3>
      <div className="two" role="group" aria-label="Суретті атауымен сәйкестендіру">
        <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
          {pairs.map((p) => (
            <button
              key={p.icon + p.label}
              type="button"
              className={activeIcon === p.icon ? 'active' : ''}
              disabled={p.icon in matched}
              onClick={() => pickIcon(p.icon)}
              style={{ display: 'flex', alignItems: 'center', gap: 10, border: '1px solid var(--line)', borderRadius: 11, padding: 10, background: p.icon in matched ? 'var(--pale)' : '#fff', fontSize: 20 }}
            >
              <span aria-hidden>{ICON_SETS[p.icon as IconName] ?? p.icon}</span>
              {p.icon in matched ? `↔ ${matched[p.icon]}` : ''}
            </button>
          ))}
        </div>
        <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
          {rightLabels.map((label, i) => {
            const isUsed = Object.values(matched).includes(label)
            return (
              <button
                key={label + i}
                type="button"
                disabled={isUsed}
                onClick={() => pickLabel(label)}
                style={{ border: '1px solid var(--line)', borderRadius: 11, padding: 10, background: isUsed ? 'var(--pale)' : '#fff' }}
              >
                {label}
              </button>
            )
          })}
        </div>
      </div>
      {done && <p className="form-success" role="status">Барлық жұп дұрыс сәйкестендірілді!</p>}
    </div>
  )
}

/** An interactive ruler: an object bar drawn from 0 up to `length`, and
 * a row of clickable tick values along the ruler for the student to
 * read the length off and select — an SVG-based, genuinely interactive
 * stand-in for a physical ruler/measuring exercise. */
function MeasurementTask({ data, onAnswered }: { data: BekitBlockData; onAnswered: OnAnswered }) {
  const unit = (data.block.configuration.unit as string) ?? 'см'
  const length = (data.block.configuration.length as number) ?? 5
  const maxScale = (data.block.configuration.maxScale as number) ?? 10
  const [picked, setPicked] = useState<number | null>(null)
  const [checked, setChecked] = useState(false)
  const isCorrect = checked && picked === length

  const rulerWidth = 320
  const pxPerUnit = rulerWidth / maxScale
  const ticks = Array.from({ length: maxScale + 1 }, (_, i) => i)

  function pick(value: number) {
    setPicked(value)
    setChecked(true)
    onAnswered(value === length, value)
  }

  return (
    <div>
      <h3>{data.block.content}</h3>
      <svg viewBox={`0 0 ${rulerWidth + 20} 90`} width="100%" style={{ maxWidth: rulerWidth + 20 }} role="img" aria-label={`Ұзындығы ${length} ${unit} зат сызғышта`}>
        <rect x={10} y={44} width={length * pxPerUnit} height={16} rx={4} fill="var(--cyan)" opacity={0.85} />
        <line x1={10} y1={70} x2={10 + rulerWidth} y2={70} stroke="#123b61" strokeWidth={2} />
        {ticks.map((v) => (
          <g key={v}>
            <line x1={10 + v * pxPerUnit} y1={64} x2={10 + v * pxPerUnit} y2={76} stroke="#123b61" strokeWidth={1.5} />
            <text x={10 + v * pxPerUnit} y={88} textAnchor="middle" fontSize={10} fill="#3a5568">{v}</text>
          </g>
        ))}
      </svg>
      <p className="status" style={{ fontWeight: 400 }}>Заттың ұзындығы неше {unit}? Дұрыс санды бас.</p>
      <div className="answers" style={{ flexWrap: 'wrap' }}>
        {ticks.filter((v) => v > 0).map((v) => (
          <button
            key={v}
            type="button"
            disabled={isCorrect}
            onClick={() => pick(v)}
            style={{
              width: 'auto', padding: '8px 14px',
              background: checked && picked === v ? (v === length ? '#e7f6ee' : '#fdecea') : undefined,
            }}
          >
            {v}
          </button>
        ))}
      </div>
      {checked && isCorrect && <p className="form-success" role="status">Дұрыс! Заттың ұзындығы {length} {unit}.</p>}
      {checked && !isCorrect && <p className="form-error" role="alert">Әлі дұрыс емес — сызғыштағы белгілерді қайта санап көр.</p>}
    </div>
  )
}

function SortingTask({ data, onAnswered }: { data: BekitBlockData; onAnswered: OnAnswered }) {
  const correctOrder = useMemo(() => (data.block.configuration.items as string[]) ?? [], [data.block.configuration.items])
  const [order, setOrder] = useState<string[]>(() => shuffled(correctOrder))
  const [checked, setChecked] = useState(false)
  const isCorrect = checked && order.every((v, i) => v === correctOrder[i])

  function move(i: number, dir: -1 | 1) {
    const j = i + dir
    if (j < 0 || j >= order.length) return
    const next = [...order]
    ;[next[i], next[j]] = [next[j], next[i]]
    setOrder(next)
    setChecked(false)
  }

  function check() {
    setChecked(true)
    onAnswered(order.every((v, i) => v === correctOrder[i]), order)
  }

  return (
    <div>
      <h3>{data.block.content}</h3>
      <div style={{ display: 'flex', flexDirection: 'column', gap: 8, maxWidth: 360 }}>
        {order.map((item, i) => (
          <div key={item} style={{ display: 'flex', alignItems: 'center', gap: 8, border: '1px solid var(--line)', borderRadius: 11, padding: '8px 12px' }}>
            <span style={{ flex: 1, fontWeight: 700 }}>{item}</span>
            <button type="button" className="button secondary" style={{ padding: '4px 10px' }} disabled={i === 0} onClick={() => move(i, -1)} aria-label="Жоғары жылжыту">↑</button>
            <button type="button" className="button secondary" style={{ padding: '4px 10px' }} disabled={i === order.length - 1} onClick={() => move(i, 1)} aria-label="Төмен жылжыту">↓</button>
          </div>
        ))}
      </div>
      {checked && (
        <p className={isCorrect ? 'form-success' : 'form-error'} role="status">
          {isCorrect ? 'Дұрыс ретпен қойдың!' : 'Әлі дұрыс емес — ретін қайта қара.'}
        </p>
      )}
      <div className="actions">
        {!isCorrect ? (
          <button type="button" className="button primary" onClick={check}>Тексеру</button>
        ) : null}
      </div>
    </div>
  )
}

function GroupingTask({ data, onAnswered }: { data: BekitBlockData; onAnswered: OnAnswered }) {
  const items = (data.block.configuration.items as { label: string; group: 'a' | 'b' }[]) ?? []
  const groupALabel = (data.block.configuration.groupALabel as string) ?? 'А тобы'
  const groupBLabel = (data.block.configuration.groupBLabel as string) ?? 'Ә тобы'
  const [assignment, setAssignment] = useState<Record<string, 'a' | 'b'>>({})
  const [checked, setChecked] = useState(false)

  const allAssigned = items.every((item) => assignment[item.label])
  const isCorrect = checked && items.every((item) => assignment[item.label] === item.group)

  function assign(label: string, group: 'a' | 'b') {
    setAssignment((prev) => ({ ...prev, [label]: group }))
    setChecked(false)
  }

  function check() {
    setChecked(true)
    onAnswered(items.every((item) => assignment[item.label] === item.group), assignment)
  }

  return (
    <div>
      <h3>{data.block.content}</h3>
      <div style={{ display: 'flex', flexDirection: 'column', gap: 8, maxWidth: 420 }}>
        {items.map((item) => (
          <div key={item.label} style={{ display: 'flex', alignItems: 'center', gap: 10, border: '1px solid var(--line)', borderRadius: 11, padding: '8px 12px' }}>
            <span style={{ flex: 1, fontWeight: 700 }}>{item.label}</span>
            <button
              type="button"
              className="button secondary"
              style={{ padding: '6px 12px', background: assignment[item.label] === 'a' ? 'var(--cyan)' : undefined, color: assignment[item.label] === 'a' ? '#fff' : undefined }}
              onClick={() => assign(item.label, 'a')}
            >
              {groupALabel}
            </button>
            <button
              type="button"
              className="button secondary"
              style={{ padding: '6px 12px', background: assignment[item.label] === 'b' ? 'var(--cyan)' : undefined, color: assignment[item.label] === 'b' ? '#fff' : undefined }}
              onClick={() => assign(item.label, 'b')}
            >
              {groupBLabel}
            </button>
          </div>
        ))}
      </div>
      {checked && (
        <p className={isCorrect ? 'form-success' : 'form-error'} role="status">
          {isCorrect ? 'Барлығы дұрыс топтастырылды!' : 'Кейбіреулері қате топта тұр — қайта қара.'}
        </p>
      )}
      <div className="actions">
        {!isCorrect ? (
          <button type="button" className="button primary" disabled={!allAssigned} onClick={check}>Тексеру</button>
        ) : null}
      </div>
    </div>
  )
}

function ExpressionBuilderTask({ data, onAnswered }: { data: BekitBlockData; onAnswered: OnAnswered }) {
  const tiles = (data.block.configuration.tiles as string[]) ?? []
  const target = (data.block.configuration.target as string[]) ?? []
  const [usedIndexes, setUsedIndexes] = useState<number[]>([])
  const [checked, setChecked] = useState(false)
  const built = usedIndexes.map((i) => tiles[i])
  const isCorrect = checked && built.length === target.length && built.every((v, i) => v === target[i])
  const explanation = data.question?.explanation

  function pick(i: number) {
    if (usedIndexes.includes(i)) return
    setUsedIndexes((prev) => [...prev, i])
    setChecked(false)
  }
  function undo() {
    setUsedIndexes((prev) => prev.slice(0, -1))
    setChecked(false)
  }
  function check() {
    setChecked(true)
    onAnswered(built.length === target.length && built.every((v, i) => v === target[i]), built.join(' '))
  }

  return (
    <div>
      <h3>{data.block.content}</h3>
      <div className="builder-expression" style={{ minHeight: 40, marginBottom: 14 }}>
        {built.length > 0 ? built.join(' ') : '—'}
      </div>
      <div className="answers" style={{ flexWrap: 'wrap' }}>
        {tiles.map((tile, i) => (
          <button key={i} type="button" disabled={usedIndexes.includes(i)} onClick={() => pick(i)} style={{ width: 'auto', padding: '8px 16px' }}>
            {tile}
          </button>
        ))}
      </div>
      <div className="actions">
        <button type="button" className="button secondary" onClick={undo} disabled={usedIndexes.length === 0}>Кері</button>
        {!isCorrect && (
          <button type="button" className="button primary" onClick={check} disabled={usedIndexes.length === 0}>Тексеру</button>
        )}
      </div>
      {checked && isCorrect && <p className="form-success" role="status">Дұрыс құрастырдың! {explanation}</p>}
      {checked && !isCorrect && <p className="form-error" role="alert">Әлі дұрыс емес — «Кері» батырмасымен қайта құрастыр.</p>}
    </div>
  )
}

function FindErrorTask({ data, onAnswered }: { data: BekitBlockData; onAnswered: OnAnswered }) {
  const steps = (data.block.configuration.steps as string[]) ?? []
  const errorIndex = data.block.configuration.errorIndex as number
  const [picked, setPicked] = useState<number | null>(null)
  const [checked, setChecked] = useState(false)
  const isCorrect = checked && picked === errorIndex
  const explanation = data.question?.explanation

  function pick(i: number) {
    setPicked(i)
    setChecked(true)
    onAnswered(i === errorIndex, i)
  }

  return (
    <div>
      <h3>{data.block.content}</h3>
      <p className="status" style={{ fontWeight: 400 }}>Қай жолда қате бар — соны бас.</p>
      <div style={{ display: 'flex', flexDirection: 'column', gap: 8, maxWidth: 420 }}>
        {steps.map((step, i) => (
          <button
            key={i}
            type="button"
            disabled={isCorrect}
            onClick={() => pick(i)}
            style={{
              textAlign: 'left', border: '1px solid var(--line)', borderRadius: 11, padding: '10px 14px', background:
                checked && picked === i ? (i === errorIndex ? '#e7f6ee' : '#fdecea') : '#fff',
            }}
          >
            {i + 1}. {step}
          </button>
        ))}
      </div>
      {checked && isCorrect && <p className="form-success" role="status">Дәл таптың! {explanation}</p>}
      {checked && !isCorrect && <p className="form-error" role="alert">Бұл жол дұрыс — басқа жолды қара.</p>}
    </div>
  )
}

/** Бекіт: walks through the topic's short final tasks, one at a time. */
export function BekitStage({ blocks, onFinish, onAnswer }: BekitStageProps) {
  const [index, setIndex] = useState(0)
  const [results, setResults] = useState<BekitResult[]>([])
  const current = blocks[index]

  function handleAnswered(isCorrect: boolean, answer: unknown) {
    const next = [...results, { blockId: current.block.id, isCorrect, answer }]
    setResults(next)
    onAnswer?.(isCorrect)
  }

  function handleNext() {
    if (index + 1 < blocks.length) {
      setIndex(index + 1)
    } else {
      onFinish(results)
    }
  }

  const currentAnswered = results.find((r) => r.blockId === current?.block.id)
  const canAdvance = Boolean(currentAnswered?.isCorrect)

  if (!current) return null

  return (
    <div>
      <TalpynGuide state="pointing" />
      <p className="status">
        Тапсырма {index + 1} / {blocks.length}
      </p>

      {current.block.block_type === 'multiple_choice' && <MultipleChoiceTask data={current} onAnswered={handleAnswered} />}
      {current.block.block_type === 'matching' &&
        current.block.configuration.kind === 'visual' && (
          <VisualMatchingTask data={current} onAnswered={handleAnswered} />
        )}
      {current.block.block_type === 'matching' &&
        current.block.configuration.kind !== 'visual' && (
          <MatchingTask data={current} onAnswered={handleAnswered} />
        )}
      {current.block.block_type === 'ordering' && <SortingTask data={current} onAnswered={handleAnswered} />}
      {current.block.block_type === 'drag_drop' && <GroupingTask data={current} onAnswered={handleAnswered} />}
      {current.block.block_type === 'question' &&
        current.block.configuration.kind === 'expression_builder' && (
          <ExpressionBuilderTask data={current} onAnswered={handleAnswered} />
        )}
      {current.block.block_type === 'question' &&
        current.block.configuration.kind === 'find_error' && (
          <FindErrorTask data={current} onAnswered={handleAnswered} />
        )}
      {current.block.block_type === 'question' &&
        current.block.configuration.kind === 'measurement' && (
          <MeasurementTask data={current} onAnswered={handleAnswered} />
        )}
      {(current.block.block_type === 'short_answer' ||
        (current.block.block_type === 'question' &&
          current.block.configuration.kind !== 'expression_builder' &&
          current.block.configuration.kind !== 'find_error' &&
          current.block.configuration.kind !== 'measurement')) && (
        <ShortAnswerTask data={current} onAnswered={handleAnswered} />
      )}

      <div className="actions">
        <button type="button" className="button primary" disabled={!canAdvance} onClick={handleNext}>
          {index + 1 < blocks.length ? 'Келесі тапсырма' : 'Нәтижені көру'}
        </button>
      </div>
    </div>
  )
}
