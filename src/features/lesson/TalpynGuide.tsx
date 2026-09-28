// Keep one recognizable pupil throughout the lesson; use different poses
// for working, celebrating and greeting instead of a second SVG character.
export type TalpynState = 'greeting' | 'hint' | 'thinking' | 'success' | 'support' | 'pointing' | 'finish'

const MESSAGES: Record<TalpynState, string> = {
  greeting: 'Сәлем! Бүгінгі тапсырмаларды бірге орындайық.',
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
  const pose = state === 'success' || state === 'finish' ? 'celebrating'
    : state === 'thinking' || state === 'hint' || state === 'support' ? 'studying' : 'greeting'
  return (
    <div className={`talpyn-guide talpyn-guide--${state} ${className ?? ''}`}>
      <span className="talpyn-guide-photo">
        <img src={`/mascot/talpyn-${pose}.png`} alt={`Талпын, оқушы — ${state}`} />
        <span className="talpyn-guide-badge" aria-hidden>{BADGES[state]}</span>
      </span>
      <p role="status">{MESSAGES[state]}</p>
    </div>
  )
}
