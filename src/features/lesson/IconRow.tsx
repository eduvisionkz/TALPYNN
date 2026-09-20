// A small shared set of emoji-based icons used across the generic
// lesson components below. Using text emoji (not raster images) keeps
// every one of these "infographics" fully accessible, crisp on any
// screen, and free of any external asset — this is the HTML/CSS/SVG
// approach chosen for the topics beyond the flagship lesson.
export const ICON_SETS = {
  apple: '🍎',
  star: '⭐',
  ball: '⚽',
  pencil: '✏️',
  flower: '🌷',
  fish: '🐟',
  leaf: '🍃',
  cube: '🧊',
  tree: '🌳',
  drop: '💧',
} as const

export type IconName = keyof typeof ICON_SETS

interface IconRowProps {
  icon: IconName
  count: number
  highlightUpTo?: number
  onIconClick?: (index: number) => void
}

export function IconRow({ icon, count, highlightUpTo, onIconClick }: IconRowProps) {
  return (
    <div className="icon-row" role={onIconClick ? 'group' : undefined} aria-label={onIconClick ? `${ICON_SETS[icon]} заттарын санау` : undefined}>
      {Array.from({ length: count }).map((_, i) => {
        const isHighlighted = highlightUpTo !== undefined && i < highlightUpTo
        const content = (
          <span key={i} className={`icon-item ${isHighlighted ? 'icon-item--highlight' : ''}`} aria-hidden={!onIconClick}>
            {ICON_SETS[icon]}
          </span>
        )
        if (!onIconClick) return content
        return (
          <button
            key={i}
            type="button"
            className={`icon-item icon-item--button ${isHighlighted ? 'icon-item--highlight' : ''}`}
            onClick={() => onIconClick(i)}
            aria-label={`${i + 1}-ші зат`}
          >
            {ICON_SETS[icon]}
          </button>
        )
      })}
    </div>
  )
}
