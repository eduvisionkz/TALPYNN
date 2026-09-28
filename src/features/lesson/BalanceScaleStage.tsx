import { useState } from 'react'
import { TalpynGuide } from './TalpynGuide'

interface BalanceScaleStageProps {
  leftWeights: number[]
  rightKnown: number
  prompt: string
  onDone: () => void
}

/**
 * "Тепе-теңдік таразы": the left pan shows two or more known weights, the
 * right pan shows one known weight and one blank — the student enters the
 * number that makes both pans balance (sum of the left pan).
 */
export function BalanceScaleStage({ leftWeights, rightKnown, prompt, onDone }: BalanceScaleStageProps) {
  const [value, setValue] = useState('')
  const [checked, setChecked] = useState(false)
  const leftTotal = leftWeights.reduce((a, b) => a + b, 0)
  const correct = leftTotal - rightKnown
  const isCorrect = Number(value) === correct

  // Visual tilt while typing gives the balance real feedback, not just a checkmark at the end.
  const guess = Number(value) || 0
  const tilt = Math.max(-10, Math.min(10, (rightKnown + guess - leftTotal) * 2))

  return (
    <div>
      <TalpynGuide state={checked && isCorrect ? 'success' : 'thinking'} />
      <h3>{prompt}</h3>

      <svg viewBox="0 0 260 170" width="100%" style={{ maxWidth: 320 }} role="img" aria-label="Тепе-теңдік таразы">
        <line x1={130} y1={20} x2={130} y2={70} stroke="#123b61" strokeWidth={4} />
        <g transform={`rotate(${tilt} 130 70)`}>
          <line x1={30} y1={70} x2={230} y2={70} stroke="#123b61" strokeWidth={4} />
          <line x1={40} y1={70} x2={40} y2={100} stroke="#176b87" strokeWidth={2} />
          <line x1={220} y1={70} x2={220} y2={100} stroke="#176b87" strokeWidth={2} />
          <rect x={5} y={100} width={70} height={14} rx={7} fill="#eef8f8" stroke="#176b87" strokeWidth={2} />
          <text x={40} y={110} textAnchor="middle" fontSize={12} fontWeight={800} fill="#123b61">
            {leftWeights.join(' + ')}
          </text>
          <rect x={185} y={100} width={70} height={14} rx={7} fill="#eef8f8" stroke="#176b87" strokeWidth={2} />
          <text x={220} y={110} textAnchor="middle" fontSize={12} fontWeight={800} fill="#123b61">
            {rightKnown} + ?
          </text>
        </g>
        <rect x={110} y={140} width={40} height={10} rx={3} fill="#123b61" />
      </svg>

      <label htmlFor="balance-answer" style={{ display: 'block', fontWeight: 800, fontSize: 13, margin: '10px 0 6px' }}>
        Таразы теңесу үшін оң жаққа қандай сан қосу керек?
      </label>
      <input
        id="balance-answer"
        type="number"
        value={value}
        onChange={(e) => { setValue(e.target.value); setChecked(false) }}
        style={{ width: 100 }}
      />

      {checked && (
        <p className={isCorrect ? 'form-success' : 'form-error'} role="status">
          {isCorrect ? 'Дұрыс, таразы теңесті!' : 'Әлі теңеспеді — есептеп қайта көр.'}
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
