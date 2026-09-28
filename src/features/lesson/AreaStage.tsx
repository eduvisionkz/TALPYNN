import { useState } from 'react'
import { TalpynGuide } from './TalpynGuide'

interface AreaStageProps {
  width: number
  height: number
  unit: string
  prompt: string
  onDone: () => void
}

/** "Аудан": a grid of unit squares the student can inspect; computes width × height. */
export function AreaStage({ width, height, unit, prompt, onDone }: AreaStageProps) {
  const [value, setValue] = useState('')
  const [checked, setChecked] = useState(false)
  const correct = width * height
  const isCorrect = Number(value) === correct

  const cell = Math.min(28, Math.floor(220 / Math.max(width, height)))
  const svgW = width * cell + 60
  const svgH = height * cell + 60

  const cells: JSX.Element[] = []
  for (let row = 0; row < height; row++) {
    for (let col = 0; col < width; col++) {
      cells.push(
        <rect
          key={`${row}-${col}`}
          x={40 + col * cell}
          y={30 + row * cell}
          width={cell}
          height={cell}
          fill="#eaf6fb"
          stroke="#176b87"
          strokeWidth={1}
        />,
      )
    }
  }

  return (
    <div>
      <TalpynGuide state={checked && isCorrect ? 'success' : 'thinking'} />
      <h3>{prompt}</h3>

      <svg
        viewBox={`0 0 ${svgW} ${svgH}`}
        width={svgW}
        height={svgH}
        role="img"
        aria-label={`Ені ${width} ${unit}, ұзындығы ${height} ${unit} тіктөртбұрыш, ${width * height} шаршы бөлікке бөлінген`}
      >
        {cells}
        <text x={40 + (width * cell) / 2} y={22} textAnchor="middle" fontSize={15} fontWeight={800} fill="#123b61">
          {width} {unit}
        </text>
        <text x={26} y={30 + (height * cell) / 2} textAnchor="end" fontSize={15} fontWeight={800} fill="#123b61">
          {height} {unit}
        </text>
      </svg>

      <label htmlFor="area-answer" style={{ display: 'block', fontWeight: 800, fontSize: 13, margin: '10px 0 6px' }}>
        Ауданын тап (шаршы {unit})
      </label>
      <input
        id="area-answer"
        type="number"
        value={value}
        onChange={(e) => { setValue(e.target.value); setChecked(false) }}
        style={{ width: 100 }}
      />

      {checked && (
        <p className={isCorrect ? 'form-success' : 'form-error'} role="status">
          {isCorrect ? `Дұрыс! Ауданы ${correct} шаршы ${unit}.` : 'Әлі дұрыс емес. Ені мен ұзындығын көбейт.'}
        </p>
      )}

      <div className="actions">
        {!isCorrect ? (
          <button type="button" className="button primary" disabled={value === ''} onClick={() => setChecked(true)}>
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
