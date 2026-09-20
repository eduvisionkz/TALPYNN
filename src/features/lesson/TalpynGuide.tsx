import { TalpynSvg } from './TalpynSvg'

// Talpyn's states throughout the lesson. There is no image/video
// generation tool available, so instead of seven commissioned
// illustrations, Talpyn's face is drawn in code as SVG (`TalpynSvg`) —
// its eyes, mouth and a small accessory genuinely redraw per state, not
// just the caption. A small emoji badge and light CSS motion reinforce
// each state further.
export type TalpynState = 'greeting' | 'hint' | 'thinking' | 'success' | 'support' | 'pointing' | 'finish'

const MESSAGES: Record<TalpynState, string> = {
  greeting: 'Сәлем! Бүгін бірге 10 санының құрамын үйренеміз.',
  hint: 'Кеңес: 10-нан белгілі санды азайтып көр.',
  thinking: 'Ойлан... асықпа, уақытың жеткілікті.',
  success: 'Керемет! Дәл тауып тұрсың!',
  support: 'Ештеңе етпейді, тағы да көріп көрейік.',
  pointing: 'Мына жерге назар аудар.',
  finish: 'Тақырыпты сәтті аяқтадың! Талпын сені мақтан тұтады.',
}

const BADGES: Record<TalpynState, string> = {
  greeting: '👋',
  hint: '💡',
  thinking: '💭',
  success: '🎉',
  support: '🤗',
  pointing: '👉',
  finish: '🏆',
}

interface TalpynGuideProps {
  state: TalpynState
  className?: string
}

export function TalpynGuide({ state, className }: TalpynGuideProps) {
  return (
    <div className={`talpyn-guide talpyn-guide--${state} ${className ?? ''}`}>
      <span className="talpyn-guide-photo">
        <TalpynSvg state={state} />
        <span className="talpyn-guide-badge" aria-hidden>{BADGES[state]}</span>
      </span>
      <p role="status">{MESSAGES[state]}</p>
    </div>
  )
}
