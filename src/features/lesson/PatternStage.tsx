import { useState } from 'react'
import { TalpynGuide } from './TalpynGuide'

interface PatternStageProps {
  /** e.g. ["2","4","6","?","10"] or ["🔵","🔺","🔵","🔺","?"] */
  sequence: string[]
  blankIndex: number
  correctValue: string
  prompt: string
  onDone: () => void
}

/** Sequence completion, used for both numeric and shape/pattern topics. */
export function PatternStage({ sequence, blankIndex, correctValue, prompt, onDone }: PatternStageProps) {
  const [value, setValue] = useState('')
  const [checked, setChecked] = useState(false)
  const isCorrect = value.trim() === correctValue

  return (
    <div>
      <TalpynGuide state={checked && isCorrect ? 'success' : 'thinking'} />
      <h3>{prompt}</h3>

      <div style={{ display: 'flex', justifyContent: 'center', gap: 14, flexWrap: 'wrap', margin: '20px 0' }}>
        {sequence.map((item, i) => (
          <span
            key={i}
            style={{
              width: 56,
              height: 56,
              display: 'grid',
              placeItems: 'center',
              borderRadius: 14,
              fontSize: 26,
              fontWeight: 800,
              background: i === blankIndex ? '#fff' : 'var(--pale)',
              border: i === blankIndex ? '2px dashed var(--blue)' : '1px solid var(--line)',
              color: 'var(--navy)',
            }}
          >
            {i === blankIndex ? (checked && isCorrect ? correctValue : '?') : item}
          </span>
        ))}
      </div>

      <label htmlFor="pattern-answer" style={{ display: 'block', fontWeight: 800, fontSize: 13, margin: '10px 0 6px' }}>
        Белгісіз орынға не келеді?
      </label>
      <input id="pattern-answer" type="text" value={value} onChange={(e) => { setValue(e.target.value); setChecked(false) }} style={{ width: 100 }} />

      {checked && (
        <p className={isCorrect ? 'form-success' : 'form-error'} role="status">
          {isCorrect ? 'Дұрыс!' : 'Әлі дұрыс емес. Заңдылықты қайта қарап көр.'}
        </p>
      )}

      <div className="actions">
        {!isCorrect ? (
          <button type="button" className="button primary" disabled={value.trim() === ''} onClick={() => setChecked(true)}>
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
