import { ICON_SETS, type IconName } from './IconRow'
import { TalpynGuide } from './TalpynGuide'

interface SceneItem {
  icon: string
  label: string
}

interface SceneStageProps {
  items: SceneItem[]
  caption: string
  onDone: () => void
}

/**
 * A richer Көр visual than a plain text slide: a labelled row of icon
 * "cards" inside an SVG frame, for topics that need to show several
 * related objects at once (units, steps, examples) rather than one line
 * of narration at a time.
 */
export function SceneStage({ items, caption, onDone }: SceneStageProps) {
  const cardWidth = 100
  const gap = 14
  const totalWidth = items.length * cardWidth + (items.length - 1) * gap + 40

  return (
    <div>
      <TalpynGuide state="greeting" />
      <svg
        viewBox={`0 0 ${totalWidth} 150`}
        width="100%"
        style={{ maxWidth: totalWidth }}
        role="img"
        aria-label={caption}
      >
        <rect x={0} y={0} width={totalWidth} height={150} rx={20} fill="var(--pale)" />
        {items.map((item, i) => {
          const x = 20 + i * (cardWidth + gap)
          return (
            <g key={i}>
              <rect x={x} y={20} width={cardWidth} height={100} rx={16} fill="#fff" stroke="#dbe7e9" strokeWidth={2} />
              <text x={x + cardWidth / 2} y={70} textAnchor="middle" fontSize={38}>
                {ICON_SETS[item.icon as IconName] ?? item.icon}
              </text>
              <text x={x + cardWidth / 2} y={106} textAnchor="middle" fontSize={12} fontWeight={800} fill="#123b61">
                {item.label}
              </text>
            </g>
          )
        })}
      </svg>
      <p style={{ marginTop: 14, fontWeight: 700, color: '#234356' }}>{caption}</p>

      <div className="actions">
        <button type="button" className="button primary" onClick={onDone}>
          Келесі кезеңге өту
        </button>
      </div>
    </div>
  )
}
