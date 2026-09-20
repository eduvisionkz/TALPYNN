import type { TalpynState } from './TalpynGuide'

// A hand-drawn (in code) snow-leopard face, built from layered SVG shapes.
// No photo or generated image is used — every state genuinely redraws the
// eyes, mouth and a small accessory, so Talpyn's expression really changes
// from one lesson stage to the next rather than only the caption changing.

const FUR = '#eef3f4'
const FUR_SHADE = '#d9e3e5'
const SPOT = '#9fb0b6'
const INK = '#123b61'
const CYAN = '#18b5ba'
const GOLD = '#f2b63d'

function Spots() {
  const spots: [number, number, number][] = [
    [34, 46, 4], [58, 42, 3.5], [46, 60, 3], [70, 50, 3], [30, 66, 3], [66, 68, 3.5], [50, 30, 3],
  ]
  return (
    <>
      {spots.map(([cx, cy, r], i) => (
        <circle key={i} cx={cx} cy={cy} r={r} fill={SPOT} opacity={0.55} />
      ))}
    </>
  )
}

function Eyes({ state }: { state: TalpynState }) {
  if (state === 'thinking') {
    return (
      <>
        <path d="M30 44 q6 -5 12 0" stroke={INK} strokeWidth={2.4} fill="none" strokeLinecap="round" />
        <path d="M58 44 q6 -5 12 0" stroke={INK} strokeWidth={2.4} fill="none" strokeLinecap="round" />
      </>
    )
  }
  if (state === 'success' || state === 'finish') {
    return (
      <>
        <path d="M28 45 q8 -8 16 0" stroke={INK} strokeWidth={2.6} fill="none" strokeLinecap="round" />
        <path d="M56 45 q8 -8 16 0" stroke={INK} strokeWidth={2.6} fill="none" strokeLinecap="round" />
      </>
    )
  }
  if (state === 'support') {
    return (
      <>
        <circle cx={36} cy={46} r={4.2} fill={INK} />
        <circle cx={64} cy={46} r={4.2} fill={INK} />
        <path d="M27 40 q9 -6 17 -1" stroke={INK} strokeWidth={1.6} fill="none" strokeLinecap="round" />
        <path d="M56 39 q9 -5 17 1" stroke={INK} strokeWidth={1.6} fill="none" strokeLinecap="round" />
      </>
    )
  }
  // greeting, hint, pointing: open, alert eyes
  return (
    <>
      <circle cx={36} cy={46} r={5} fill={INK} />
      <circle cx={64} cy={46} r={5} fill={INK} />
      <circle cx={37.5} cy={44.5} r={1.4} fill="#fff" />
      <circle cx={65.5} cy={44.5} r={1.4} fill="#fff" />
    </>
  )
}

function Mouth({ state }: { state: TalpynState }) {
  if (state === 'success' || state === 'finish' || state === 'greeting') {
    return <path d="M40 62 q10 9 20 0" stroke={INK} strokeWidth={2.6} fill="none" strokeLinecap="round" />
  }
  if (state === 'support') {
    return <path d="M42 65 q8 -4 16 0" stroke={INK} strokeWidth={2.2} fill="none" strokeLinecap="round" />
  }
  return <path d="M42 63 q8 4 16 0" stroke={INK} strokeWidth={2.2} fill="none" strokeLinecap="round" />
}

function Accessory({ state }: { state: TalpynState }) {
  switch (state) {
    case 'hint':
      return (
        <g transform="translate(74 14)">
          <circle r={9} fill={GOLD} />
          <text x={0} y={4} textAnchor="middle" fontSize={11} fontWeight={800} fill="#5c3d00">!</text>
        </g>
      )
    case 'thinking':
      return (
        <g fill={FUR_SHADE}>
          <circle cx={82} cy={20} r={3} />
          <circle cx={90} cy={12} r={4} />
          <circle cx={100} cy={4} r={5} />
        </g>
      )
    case 'success':
      return (
        <g transform="translate(78 12)" fill={GOLD}>
          <path d="M0 -10 L2.5 -3 L10 -3 L4 1.5 L6 9 L0 4.5 L-6 9 L-4 1.5 L-10 -3 L-2.5 -3 Z" />
        </g>
      )
    case 'finish':
      return (
        <g transform="translate(50 4)">
          <path d="M-14 6 L0 -10 L14 6 Z" fill={CYAN} />
          <circle cx={0} cy={-12} r={3} fill={GOLD} />
        </g>
      )
    case 'support':
      return (
        <g transform="translate(80 20)">
          <path d="M0 0 Q4 8 0 14 Q-4 8 0 0 Z" fill={CYAN} opacity={0.7} />
        </g>
      )
    case 'pointing':
      return (
        <g transform="translate(84 58) rotate(-20)">
          <rect x={-4} y={-4} width={22} height={8} rx={4} fill={FUR} stroke={INK} strokeWidth={1.4} />
        </g>
      )
    case 'greeting':
    default:
      return null
  }
}

interface TalpynSvgProps {
  state: TalpynState
  className?: string
}

/** Code-drawn snow-leopard mascot face — changes eyes, mouth and a small accessory per lesson state. */
export function TalpynSvg({ state, className }: TalpynSvgProps) {
  return (
    <svg viewBox="0 0 108 96" width={72} height={64} className={className} role="img" aria-label={`Талпын — ${state} күйінде`}>
      {/* ears */}
      <path d="M22 30 L14 8 L36 24 Z" fill={FUR} stroke={FUR_SHADE} strokeWidth={1.5} />
      <path d="M78 30 L86 8 L64 24 Z" fill={FUR} stroke={FUR_SHADE} strokeWidth={1.5} />
      {/* face */}
      <ellipse cx={50} cy={50} rx={38} ry={34} fill={FUR} />
      <Spots />
      {/* muzzle */}
      <ellipse cx={50} cy={64} rx={16} ry={10} fill="#fff" opacity={0.85} />
      <Eyes state={state} />
      <Mouth state={state} />
      <ellipse cx={50} cy={56} rx={2.6} ry={2} fill={INK} />
      <Accessory state={state} />
    </svg>
  )
}
