import { useState } from 'react'
import { IconRow, type IconName } from './IconRow'
import { TalpynGuide } from './TalpynGuide'

interface CountClickStageProps {
  icon: IconName
  count: number
  prompt: string
  onDone: () => void
}

/** "Заттарды санау" and similar: the student clicks each icon in turn to count it out loud. */
export function CountClickStage({ icon, count, prompt, onDone }: CountClickStageProps) {
  const [clicked, setClicked] = useState<Set<number>>(new Set())
  const [answer, setAnswer] = useState('')
  const [checked, setChecked] = useState(false)

  function handleIconClick(index: number) {
    setClicked((prev) => new Set(prev).add(index))
  }

  const allClicked = clicked.size === count
  const isCorrect = Number(answer) === count

  return (
    <div>
      <TalpynGuide state={checked && isCorrect ? 'success' : 'pointing'} />
      <h3>{prompt}</h3>
      <IconRow icon={icon} count={count} onIconClick={handleIconClick} highlightUpTo={clicked.size === count ? count : undefined} />
      <p className="status">Басылған заттар: {clicked.size} / {count}</p>

      <label htmlFor="count-answer" style={{ display: 'block', fontWeight: 800, fontSize: 13, margin: '14px 0 6px' }}>
        Барлығы неше зат бар?
      </label>
      <input
        id="count-answer"
        type="number"
        inputMode="numeric"
        value={answer}
        onChange={(e) => { setAnswer(e.target.value); setChecked(false) }}
        style={{ width: 100 }}
      />

      {checked && (
        <p className={isCorrect ? 'form-success' : 'form-error'} role="status">
          {isCorrect ? 'Дұрыс!' : `Тағы бір рет сана. Дұрыс жауап: ${count}.`}
        </p>
      )}

      <div className="actions">
        {!checked || !isCorrect ? (
          <button type="button" className="button primary" disabled={answer === ''} onClick={() => setChecked(true)}>
            Тексеру
          </button>
        ) : (
          <button type="button" className="button primary" onClick={onDone}>
            Келесі кезеңге өту
          </button>
        )}
      </div>
      {!allClicked && <p className="status">Кеңес: заттардың әрқайсысына басып санап шық.</p>}
    </div>
  )
}
