import { useState } from 'react'
import { IconRow, type IconName } from './IconRow'
import { TalpynGuide } from './TalpynGuide'

interface OrdinalStageProps {
  icon: IconName
  count: number
  targetPosition: number // 1-based
  prompt: string
  onDone: () => void
}

const ORDINALS_KK = ['бірінші', 'екінші', 'үшінші', 'төртінші', 'бесінші', 'алтыншы', 'жетінші', 'сегізінші', 'тоғызыншы', 'оныншы']

/** "Неше? Нешінші?": click the Nth item in the row. */
export function OrdinalStage({ icon, count, targetPosition, prompt, onDone }: OrdinalStageProps) {
  const [picked, setPicked] = useState<number | null>(null)
  const isCorrect = picked === targetPosition - 1

  return (
    <div>
      <TalpynGuide state={picked !== null ? (isCorrect ? 'success' : 'support') : 'pointing'} />
      <h3>{prompt}</h3>
      <p className="status">{ORDINALS_KK[targetPosition - 1] ?? `${targetPosition}-ші`} затты тап.</p>

      <IconRow icon={icon} count={count} highlightUpTo={picked !== null && isCorrect ? targetPosition : undefined} onIconClick={setPicked} />

      {picked !== null && (
        <p className={isCorrect ? 'form-success' : 'form-error'} role="status">
          {isCorrect ? 'Дұрыс!' : 'Қайта санап көр.'}
        </p>
      )}

      <div className="actions">
        <button type="button" className="button primary" disabled={!isCorrect} onClick={onDone}>
          Келесі кезеңге өту
        </button>
      </div>
    </div>
  )
}
