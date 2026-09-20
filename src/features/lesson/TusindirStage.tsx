import { useState } from 'react'
import { TalpynGuide } from './TalpynGuide'

interface TusindirStageProps {
  question: string
  onDone: (answer: string) => void
}

const CHOICES = [
  'Себебі жалпы саны әрқашан бірдей болады, бір топқа қосылған зат екінші топтан азаяды.',
  'Себебі сандар кездейсоқ өзгереді.',
  'Себебі екінші топ бірінші топқа тәуелсіз.',
]

export function TusindirStage({ question, onDone }: TusindirStageProps) {
  const [text, setText] = useState('')
  const [choice, setChoice] = useState<string | null>(null)

  const canSubmit = text.trim().length > 0 || choice !== null

  return (
    <div>
      <TalpynGuide state="thinking" />
      <h3>{question}</h3>

      <label htmlFor="tusindir-answer" style={{ display: 'block', fontWeight: 800, fontSize: 13, margin: '18px 0 6px' }}>
        Өз жауабыңды жаз
      </label>
      <textarea
        id="tusindir-answer"
        value={text}
        onChange={(e) => setText(e.target.value)}
        placeholder="Өз жауабыңды осында жаз..."
      />

      <p style={{ fontWeight: 800, fontSize: 13, margin: '18px 0 10px' }}>Немесе ең дәл түсіндірмені таңда:</p>
      <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
        {CHOICES.map((c) => (
          <label key={c} style={{ display: 'flex', gap: 8, alignItems: 'flex-start', fontWeight: 600, fontSize: 14 }}>
            <input type="radio" name="tusindir-choice" checked={choice === c} onChange={() => setChoice(c)} />
            {c}
          </label>
        ))}
      </div>

      <div className="actions">
        <button
          type="button"
          className="button primary"
          disabled={!canSubmit}
          onClick={() => onDone(choice ?? text.trim())}
        >
          Келесі кезеңге өту
        </button>
      </div>
    </div>
  )
}
