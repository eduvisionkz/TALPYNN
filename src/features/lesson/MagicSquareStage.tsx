import { useState } from 'react'
import { TalpynGuide } from './TalpynGuide'

interface MagicSquareStageProps {
  /** 9 cells, row-major; null = a blank the student must fill */
  cells: (number | null)[]
  targetSum: number
  prompt: string
  onDone: () => void
}

/** "Сиқырлы фигураларға сандарды толтыру": fill blanks so every row/column sums to targetSum. */
export function MagicSquareStage({ cells, targetSum, prompt, onDone }: MagicSquareStageProps) {
  const blankIndexes = cells.map((c, i) => (c === null ? i : -1)).filter((i) => i >= 0)
  const [values, setValues] = useState<Record<number, string>>({})
  const [checked, setChecked] = useState(false)

  function rowSum(row: number) {
    return [0, 1, 2].reduce((sum, col) => {
      const idx = row * 3 + col
      const v = cells[idx] ?? Number(values[idx] ?? NaN)
      return sum + (Number.isFinite(v) ? v : 0)
    }, 0)
  }
  const allFilled = blankIndexes.every((i) => values[i]?.trim())
  const isCorrect = allFilled && [0, 1, 2].every((row) => rowSum(row) === targetSum)

  return (
    <div>
      <TalpynGuide state={checked && isCorrect ? 'success' : 'thinking'} />
      <h3>{prompt}</h3>
      <p className="status">Әр жолдың қосындысы {targetSum} болуы керек.</p>

      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 56px)', gap: 8, justifyContent: 'center', margin: '18px 0' }}>
        {cells.map((cell, i) =>
          cell === null ? (
            <input
              key={i}
              type="number"
              value={values[i] ?? ''}
              onChange={(e) => { setValues((v) => ({ ...v, [i]: e.target.value })); setChecked(false) }}
              style={{ width: 56, height: 56, textAlign: 'center', fontSize: 20, fontWeight: 800 }}
              aria-label={`${i + 1}-ұяшық`}
            />
          ) : (
            <span key={i} style={{ width: 56, height: 56, display: 'grid', placeItems: 'center', borderRadius: 12, background: 'var(--pale)', fontWeight: 800, fontSize: 20 }}>
              {cell}
            </span>
          )
        )}
      </div>

      {checked && (
        <p className={isCorrect ? 'form-success' : 'form-error'} role="status">
          {isCorrect ? 'Керемет, сиқырлы шаршы шықты!' : 'Әлі дұрыс емес — қосындыларды қайта тексер.'}
        </p>
      )}

      <div className="actions">
        {!isCorrect ? (
          <button type="button" className="button primary" disabled={!allFilled} onClick={() => setChecked(true)}>
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
