import { useState } from 'react'
import { TalpynGuide } from './TalpynGuide'

const SHAPE_GLYPH: Record<string, string> = {
  circle: '●', square: '■', triangle: '▲', rectangle: '▬', star: '★',
}
const SHAPE_LABEL_KK: Record<string, string> = {
  circle: 'дөңгелек', square: 'шаршы', triangle: 'үшбұрыш', rectangle: 'тік төртбұрыш', star: 'жұлдыз',
}

interface ShapeMatchStageProps {
  shapes: string[] // keys of SHAPE_GLYPH, shown as choices
  targetShape: string
  prompt: string
  onDone: () => void
}

/** "Қарапайым фигураларды тану": click the shape that matches the name Talpyn asks for. */
export function ShapeMatchStage({ shapes, targetShape, prompt, onDone }: ShapeMatchStageProps) {
  const [picked, setPicked] = useState<string | null>(null)
  const isCorrect = picked === targetShape

  return (
    <div>
      <TalpynGuide state={picked ? (isCorrect ? 'success' : 'support') : 'pointing'} />
      <h3>{prompt}</h3>
      <div className="answers" style={{ justifyContent: 'center', flexWrap: 'wrap' }}>
        {shapes.map((shape) => (
          <button
            key={shape}
            type="button"
            onClick={() => setPicked(shape)}
            aria-label={SHAPE_LABEL_KK[shape] ?? shape}
            style={{
              width: 70,
              height: 70,
              fontSize: 32,
              borderRadius: 16,
              background: picked === shape ? (shape === targetShape ? 'var(--cyan)' : '#fdecea') : '#fff',
              color: picked === shape ? '#fff' : 'var(--navy)',
            }}
          >
            {SHAPE_GLYPH[shape] ?? '?'}
          </button>
        ))}
      </div>

      {picked && (
        <p className={isCorrect ? 'form-success' : 'form-error'} role="status">
          {isCorrect ? 'Дұрыс!' : `Бұл ${SHAPE_LABEL_KK[picked] ?? picked}. ${SHAPE_LABEL_KK[targetShape]}-ды тап.`}
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
