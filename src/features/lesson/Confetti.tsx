import { useMemo } from 'react'

const COLORS = ['#18b5ba', '#f2b63d', '#176b87', '#e2544a', '#123b61']

interface ConfettiPiece {
  left: number
  delay: number
  duration: number
  color: string
  rotate: number
  drift: number
}

/**
 * A small burst of falling CSS-animated rectangles — no image/GIF/video
 * asset, no external library, just DOM nodes + a keyframe animation
 * defined in global.css. Purely decorative; removed automatically by the
 * parent once `finalResults` resets.
 */
export function Confetti({ pieceCount = 40 }: { pieceCount?: number }) {
  const pieces = useMemo<ConfettiPiece[]>(
    () =>
      Array.from({ length: pieceCount }, () => ({
        left: Math.random() * 100,
        delay: Math.random() * 0.4,
        duration: 1.8 + Math.random() * 1.2,
        color: COLORS[Math.floor(Math.random() * COLORS.length)],
        rotate: Math.random() * 360,
        drift: (Math.random() - 0.5) * 120,
      })),
    [pieceCount]
  )

  return (
    <div className="confetti-layer" aria-hidden="true">
      {pieces.map((p, i) => {
        const style: React.CSSProperties & { '--drift'?: string } = {
          left: `${p.left}%`,
          background: p.color,
          animationDelay: `${p.delay}s`,
          animationDuration: `${p.duration}s`,
          '--drift': `${p.drift}px`,
          transform: `rotate(${p.rotate}deg)`,
        }
        return <span key={i} className="confetti-piece" style={style} />
      })}
    </div>
  )
}
