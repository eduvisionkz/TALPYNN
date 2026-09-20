import { useState } from 'react'
import { TalpynGuide } from './TalpynGuide'

interface QoldanStageProps {
  questionText: string
  /** Part-whole visualisation (pencils/apples style) — omit for a plain scenario. */
  partWhole?: { total: number; known: number; knownLabel: string; unknownLabel: string }
  correctAnswer: number
  hint?: string
  onDone: (isCorrect: boolean, answer: number) => void
}

/** Қолдан: a practical/life-situation task, checked against a numeric answer. */
export function QoldanStage({ questionText, partWhole, correctAnswer, hint, onDone }: QoldanStageProps) {
  const [value, setValue] = useState('')
  const [result, setResult] = useState<'idle' | 'correct' | 'incorrect'>('idle')

  function handleCheck() {
    const numeric = Number(value)
    setResult(numeric === correctAnswer ? 'correct' : 'incorrect')
  }

  return (
    <div>
      <TalpynGuide state={result === 'correct' ? 'success' : result === 'incorrect' ? 'support' : 'pointing'} />
      <h3>{questionText}</h3>

      {partWhole && (
        <>
          <div className="pencil-row" aria-hidden="true">
            {Array.from({ length: partWhole.known }).map((_, i) => (
              <span key={`k-${i}`} className="pencil pencil--known" title={partWhole.knownLabel} />
            ))}
            {Array.from({ length: partWhole.total - partWhole.known }).map((_, i) => (
              <span key={`u-${i}`} className="pencil pencil--unknown" title={partWhole.unknownLabel} />
            ))}
          </div>
          <p className="status">
            {partWhole.known} {partWhole.knownLabel} + ? {partWhole.unknownLabel} = {partWhole.total}
          </p>
        </>
      )}

      <label htmlFor="qoldan-answer" style={{ display: 'block', fontWeight: 800, fontSize: 13, margin: '14px 0 6px' }}>
        Жауабыңды жаз
      </label>
      <input
        id="qoldan-answer"
        type="number"
        inputMode="numeric"
        value={value}
        onChange={(e) => { setValue(e.target.value); setResult('idle') }}
        style={{ width: 120 }}
      />

      {result === 'correct' && <p className="form-success" role="status">Дұрыс! {correctAnswer}.</p>}
      {result === 'incorrect' && (
        <p className="form-error" role="alert">{hint ?? 'Әлі дұрыс емес. Тағы бір рет ойлан.'}</p>
      )}

      <div className="actions">
        {result !== 'correct' ? (
          <button type="button" className="button primary" onClick={handleCheck} disabled={value === ''}>
            Тексеру
          </button>
        ) : (
          <button type="button" className="button primary" onClick={() => onDone(true, Number(value))}>
            Келесі кезеңге өту
          </button>
        )}
      </div>
    </div>
  )
}
