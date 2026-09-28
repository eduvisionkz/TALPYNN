import { useState } from 'react'
import { IconRow, type IconName } from './IconRow'
import { TalpynGuide } from './TalpynGuide'

interface CompareStageProps {
  iconA: IconName
  countA: number
  iconB: IconName
  countB: number
  prompt: string
  onDone: () => void
}

type Relation = '>' | '<' | '='

/** "Заттарды салыстыру": the student picks >, < or = between two visible groups. */
export function CompareStage({ iconA, countA, iconB, countB, prompt, onDone }: CompareStageProps) {
  const [choice, setChoice] = useState<Relation | null>(null)
  const correct: Relation = countA > countB ? '>' : countA < countB ? '<' : '='

  return (
    <div>
      <TalpynGuide state={choice ? (choice === correct ? 'success' : 'support') : 'pointing'} />
      <h3>{prompt}</h3>

      <div className="two" style={{ alignItems: 'center', textAlign: 'center' }}>
        <div>
          <IconRow icon={iconA} count={countA} />
          <p className="status">{countA}</p>
        </div>
        <div>
          <IconRow icon={iconB} count={countB} />
          <p className="status">{countB}</p>
        </div>
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
          {choice === correct ? 'Дұрыс!' : `Тағы қарап көр: ${countA} ${correct} ${countB}.`}
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
