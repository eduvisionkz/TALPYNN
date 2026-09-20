import { useState } from 'react'
import { TalpynGuide } from './TalpynGuide'

interface ValueCompareStageProps {
  labelA: string
  labelB: string
  numericA: number
  numericB: number
  prompt: string
  onDone: () => void
}

type Relation = '>' | '<' | '='

/**
 * A text-based comparison for values too large or unit-based to show as
 * icon grids (e.g. "150 см" vs "1 м") — the student still picks >, < or =,
 * but the two sides are shown as labels rather than counted dots. The two
 * label strings are for display; `numericA`/`numericB` are the values the
 * comparison is actually checked against.
 */
export function ValueCompareStage({ labelA, labelB, numericA, numericB, prompt, onDone }: ValueCompareStageProps) {
  const [choice, setChoice] = useState<Relation | null>(null)
  const correct: Relation = numericA > numericB ? '>' : numericA < numericB ? '<' : '='

  return (
    <div>
      <TalpynGuide state={choice ? (choice === correct ? 'success' : 'support') : 'pointing'} />
      <h3>{prompt}</h3>

      <div className="two" style={{ alignItems: 'center', textAlign: 'center' }}>
        <div style={{ fontSize: 26, fontWeight: 800, color: 'var(--navy)', padding: '18px 0' }}>{labelA}</div>
        <div style={{ fontSize: 26, fontWeight: 800, color: 'var(--navy)', padding: '18px 0' }}>{labelB}</div>
      </div>

      <div className="answers" style={{ justifyContent: 'center' }}>
        {(['>', '=', '<'] as Relation[]).map((rel) => (
          <button
            key={rel}
            type="button"
            onClick={() => setChoice(rel)}
            style={{
              background: choice === rel ? (rel === correct ? 'var(--cyan)' : '#fdecea') : undefined,
              color: choice === rel ? '#fff' : undefined,
            }}
          >
            {rel}
          </button>
        ))}
      </div>

      {choice && (
        <p className={choice === correct ? 'form-success' : 'form-error'} role="status">
          {choice === correct ? 'Дұрыс!' : `Тағы қарап көр: ${labelA} ${correct} ${labelB}.`}
        </p>
      )}

      <div className="actions">
        <button type="button" className="button primary" disabled={choice !== correct} onClick={onDone}>
          Келесі кезеңге өту
        </button>
      </div>
    </div>
  )
}
