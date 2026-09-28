import { useState } from 'react'
import { TalpynGuide } from './TalpynGuide'

interface PerimeterStageProps {
  width: number
  height: number
  unit: string
  prompt: string
  onDone: () => void
}

/** "Периметр": an SVG rectangle with labelled sides; the student computes the perimeter. */
export function PerimeterStage({ width, height, unit, prompt, onDone }: PerimeterStageProps) {
  const [value, setValue] = useState('')
  const [checked, setChecked] = useState(false)
  const correct = 2 * (width + height)
  const isCorrect = Number(value) === correct

  const w = 180
  const h = (height / width) * w > 140 ? 140 : (height / width) * w
  const rectW = h === 140 ? (width / height) * 140 : w

  return (
    <div>
      <TalpynGuide state={checked && isCorrect ? 'success' : 'thinking'} />
      <h3>{prompt}</h3>

      <svg viewBox="0 0 260 200" width="260" height="200" role="img" aria-label={`Ені ${width} ${unit}, ұзындығы ${height} ${unit} тік төртбұрыш`}>
        <rect x={40} y={30} width={rectW} height={h} fill="none" stroke="#176b87" strokeWidth={3} rx={6} />
        <text x={40 + rectW / 2} y={22} textAnchor="middle" fontSize={16} fontWeight={800} fill="#123b61">{width} {unit}</text>
        <text x={26} y={30 + h / 2} textAnchor="end" fontSize={16} fontWeight={800} fill="#123b61">{height} {unit}</text>
      </svg>

      <label htmlFor="perimeter-answer" style={{ display: 'block', fontWeight: 800, fontSize: 13, margin: '10px 0 6px' }}>
        Периметрін тап
      </label>
      <input
        id="perimeter-answer"
        type="number"
        value={value}
        onChange={(e) => { setValue(e.target.value); setChecked(false) }}
        style={{ width: 100 }}
      />

      {checked && (
        <p className={isCorrect ? 'form-success' : 'form-error'} role="status">
          {isCorrect ? `Дұрыс! Периметрі ${correct} ${unit}.` : 'Әлі дұрыс емес. Барлық қабырғаларды қос.'}
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
