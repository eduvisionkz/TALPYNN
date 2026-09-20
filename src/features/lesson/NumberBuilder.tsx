import { useState } from 'react'

interface NumberBuilderProps {
  total: number
  startLeft: number
  onChange?: (left: number, right: number) => void
}

/**
 * A genuinely interactive split-ten builder: the student changes the
 * left group with +/- buttons (mouse, touch, and keyboard-operable —
 * they are real <button> elements), and the right group and the
 * expression update immediately. No animation library, no fake state.
 */
export function NumberBuilder({ total, startLeft, onChange }: NumberBuilderProps) {
  const [left, setLeft] = useState(() => Math.min(Math.max(startLeft, 0), total))
  const right = total - left

  function update(next: number) {
    const clamped = Math.min(Math.max(next, 0), total)
    setLeft(clamped)
    onChange?.(clamped, total - clamped)
  }

  return (
    <div>
      <div className="number-builder" role="group" aria-label="Топтардағы заттар санын өзгерту">
        <button type="button" onClick={() => update(left - 1)} disabled={left <= 0} aria-label="Бірінші топтан бір затты алып тастау">
          −
        </button>
        <b aria-live="polite">{left}</b>
        <span aria-hidden="true">+</span>
        <b aria-live="polite">{right}</b>
        <button type="button" onClick={() => update(left + 1)} disabled={left >= total} aria-label="Бірінші топқа бір зат қосу">
          +
        </button>
      </div>

      <div className="builder-groups" aria-hidden="true">
        <div className="builder-group">
          {Array.from({ length: left }).map((_, i) => (
            <span key={`l-${i}`} className="builder-dot builder-dot--a" />
          ))}
        </div>
        <div className="builder-group">
          {Array.from({ length: right }).map((_, i) => (
            <span key={`r-${i}`} className="builder-dot builder-dot--b" />
          ))}
        </div>
      </div>

      <p className="builder-expression">
        {left} + {right} = {total}
      </p>
    </div>
  )
}
