import { useState } from 'react'
import { TalpynGuide } from './TalpynGuide'

interface NumberLineStageProps {
  min: number
  max: number
  target: number
  prompt: string
  onDone: () => void
}

/** "Сандық түзу": the student clicks the tick on a number line matching `target`. */
export function NumberLineStage({ min, max, target, prompt, onDone }: NumberLineStageProps) {
  const [picked, setPicked] = useState<number | null>(null)
  const [checked, setChecked] = useState(false)
  const isCorrect = picked === target

  const ticks = Array.from({ length: max - min + 1 }, (_, i) => min + i)
  const width = 560
  const usableWidth = width - 40
  const xFor = (n: number) => 20 + ((n - min) / (max - min)) * usableWidth

  return (
    <div>
      <TalpynGuide state={checked && isCorrect ? 'success' : 'thinking'} />
      <h3>{prompt}</h3>

      <svg viewBox={`0 0 ${width} 90`} width="100%" style={{ maxWidth: width }} role="img" aria-label={`${min}-ден ${max}-ге дейінгі сандық түзу`}>
        <line x1={20} y1={45} x2={width - 20} y2={45} stroke="#dbe7e9" strokeWidth={4} />
        {ticks.map((n) => {
          const x = xFor(n)
          const isPicked = picked === n
          const isTarget = checked && n === target
          return (
            <g key={n}>
              <line x1={x} y1={36} x2={x} y2={54} stroke="#176b87" strokeWidth={2} />
              <circle
                cx={x}
                cy={45}
                r={12}
                fill={isPicked ? (checked ? (isCorrect ? '#18b5ba' : '#e2544a') : '#176b87') : isTarget ? '#f2b63d' : '#fff'}
                stroke="#176b87"
                strokeWidth={2}
                style={{ cursor: checked && isCorrect ? 'default' : 'pointer' }}
                onClick={() => { if (!(checked && isCorrect)) { setPicked(n); setChecked(false) } }}
              />
              <text x={x} y={72} textAnchor="middle" fontSize={13} fontWeight={700} fill="#123b61">{n}</text>
            </g>
          )
        })}
      </svg>

      {checked && (
        <p className={isCorrect ? 'form-success' : 'form-error'} role="status">
          {isCorrect ? 'Дұрыс тапты!' : `Әлі дұрыс емес — ${target} санын тап.`}
        </p>
      )}

      <div className="actions">
        {!isCorrect ? (
          <button type="button" className="button primary" disabled={picked === null} onClick={() => setChecked(true)}>
            Тексеру
          </button>
        ) : (
          <button type="button" className="button primary" onClick={onDone}>
            Келесі кезеңге өту
          </button>
        )}
      </div>
    </div>
  )
}
