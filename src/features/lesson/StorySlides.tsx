import { useState } from 'react'
import { TalpynGuide, type TalpynState } from './TalpynGuide'

interface StorySlidesProps {
  /** Each slide is one short paragraph Talpyn "narrates". */
  slides: string[]
  onDone: () => void
}

/** A narrated multi-slide explanation — used where no bespoke visual fits. */
export function StorySlides({ slides, onDone }: StorySlidesProps) {
  const [index, setIndex] = useState(0)
  const isLast = index === slides.length - 1
  const state: TalpynState = index === 0 ? 'greeting' : isLast ? 'finish' : 'pointing'

  return (
    <div>
      <TalpynGuide state={state} className="talpyn-guide--story" />
      <p style={{ fontSize: 18, lineHeight: 1.6, minHeight: 80 }}>{slides[index]}</p>
      <p className="status">{index + 1} / {slides.length}</p>
      <div className="actions">
        <button type="button" className="button secondary" onClick={() => setIndex((i) => Math.max(0, i - 1))} disabled={index === 0}>
          Алдыңғы
        </button>
        {isLast ? (
          <button type="button" className="button primary" onClick={onDone}>Келесі кезеңге өту</button>
        ) : (
          <button type="button" className="button primary" onClick={() => setIndex((i) => i + 1)}>Келесі</button>
        )}
      </div>
    </div>
  )
}
