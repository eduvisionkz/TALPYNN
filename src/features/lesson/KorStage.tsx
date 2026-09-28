import { useState } from 'react'

interface KorStageProps {
  imageUrl: string
  pairs: [number, number][]
  onDone: () => void
}

/** Көр: the student steps through each pair while Talpyn narrates it. */
export function KorStage({ imageUrl, pairs, onDone }: KorStageProps) {
  const [index, setIndex] = useState(0)
  const pair = pairs[index]
  const isLast = index === pairs.length - 1

  return (
    <div>
      <div className="infographic">
        <img src={imageUrl} alt="10 санының құрамы: 1+9-дан 9+1-ге дейінгі жұптар кестесі" />
        <img src="/mascot/talpyn-greeting.png" alt="" aria-hidden="true" className="infographic-mascot" />
      </div>

      <div className="mascot-note">
        <img src="/mascot/talpyn-greeting.png" alt="" aria-hidden="true" />
        <div>
          <p style={{ fontSize: 22, fontWeight: 800, color: 'var(--navy)' }}>
            {pair ? `${pair[0]} + ${pair[1]} = 10` : ''}
          </p>
          <p>Талпын: «{pair ? `${pair[0]} мен ${pair[1]} қосылса, 10 болады.` : ''}»</p>
        </div>
      </div>

      <div className="actions">
        <button
          type="button"
          className="button secondary"
          onClick={() => setIndex((i) => Math.max(0, i - 1))}
          disabled={index === 0}
        >
          Алдыңғы жұп
        </button>
        {isLast ? (
          <button type="button" className="button primary" onClick={onDone}>
            Келесі кезеңге өту
          </button>
        ) : (
          <button type="button" className="button primary" onClick={() => setIndex((i) => i + 1)}>
            Келесі жұп
          </button>
        )}
      </div>
    </div>
  )
}
