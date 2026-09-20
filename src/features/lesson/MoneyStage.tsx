import { useState } from 'react'
import { TalpynGuide } from './TalpynGuide'

interface MoneyItem {
  label: string
  price: number
}

interface MoneyStageProps {
  items: MoneyItem[]
  prompt: string
  onDone: () => void
}

/** "Ақша/дүкен сценарийі": the student sums the price tags and enters the total (in ₸). */
export function MoneyStage({ items, prompt, onDone }: MoneyStageProps) {
  const [value, setValue] = useState('')
  const [checked, setChecked] = useState(false)
  const correct = items.reduce((sum, i) => sum + i.price, 0)
  const isCorrect = Number(value) === correct

  return (
    <div>
      <TalpynGuide state={checked && isCorrect ? 'success' : 'thinking'} />
      <h3>{prompt}</h3>

      <div className="icon-row" style={{ flexWrap: 'wrap' }}>
        {items.map((item, i) => (
          <div
            key={i}
            style={{
              border: '1px solid var(--line)', borderRadius: 14, padding: '10px 16px',
              display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 4, minWidth: 90,
            }}
          >
            <span style={{ fontSize: 15, fontWeight: 700 }}>{item.label}</span>
            <span style={{ fontSize: 15, fontWeight: 800, color: 'var(--blue)' }}>{item.price} ₸</span>
          </div>
        ))}
      </div>

      <label htmlFor="money-answer" style={{ display: 'block', fontWeight: 800, fontSize: 13, margin: '18px 0 6px' }}>
        Барлығы қанша теңге керек?
      </label>
      <input
        id="money-answer"
        type="number"
        value={value}
        onChange={(e) => { setValue(e.target.value); setChecked(false) }}
        style={{ width: 120 }}
      />
      <span style={{ marginLeft: 8, fontWeight: 800 }}>₸</span>

      {checked && (
        <p className={isCorrect ? 'form-success' : 'form-error'} role="status">
          {isCorrect ? 'Дұрыс есептедің!' : 'Әлі дұрыс емес — бағаларды қайта қос.'}
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
