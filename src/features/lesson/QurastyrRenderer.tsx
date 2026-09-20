import { QurastyrStage } from './QurastyrStage'
import { CountClickStage } from './CountClickStage'
import { CompareStage } from './CompareStage'
import { PatternStage } from './PatternStage'
import { MagicSquareStage } from './MagicSquareStage'
import { ShapeMatchStage } from './ShapeMatchStage'
import { OrdinalStage } from './OrdinalStage'
import { ValueCompareStage } from './ValueCompareStage'
import { PerimeterStage } from './PerimeterStage'
import { AreaStage } from './AreaStage'
import { NumberLineStage } from './NumberLineStage'
import { ClockStage } from './ClockStage'
import { BalanceScaleStage } from './BalanceScaleStage'
import { MoneyStage } from './MoneyStage'
import type { IconName } from './IconRow'
import type { LessonBlock } from '@/types/database'

interface QurastyrRendererProps {
  block: LessonBlock
  onDone: () => void
}

/** Dispatches the Құрастыр stage's interactive by `configuration.kind`. */
export function QurastyrRenderer({ block, onDone }: QurastyrRendererProps) {
  const c = block.configuration
  const kind = (c.kind as string | undefined) ?? 'combine-split'

  switch (kind) {
    case 'combine-split':
      return <QurastyrStage total={(c.total as number) ?? 10} startLeft={(c.startLeft as number) ?? 5} onDone={onDone} />
    case 'count-click':
      return <CountClickStage icon={c.icon as IconName} count={c.count as number} prompt={block.content ?? ''} onDone={onDone} />
    case 'compare':
      return (
        <CompareStage
          iconA={c.iconA as IconName}
          countA={c.countA as number}
          iconB={c.iconB as IconName}
          countB={c.countB as number}
          prompt={block.content ?? ''}
          onDone={onDone}
        />
      )
    case 'pattern-number':
    case 'pattern-shape':
      return (
        <PatternStage
          sequence={c.sequence as string[]}
          blankIndex={c.blankIndex as number}
          correctValue={String(c.correctValue)}
          prompt={block.content ?? ''}
          onDone={onDone}
        />
      )
    case 'magic-square':
      return <MagicSquareStage cells={c.cells as (number | null)[]} targetSum={c.targetSum as number} prompt={block.content ?? ''} onDone={onDone} />
    case 'shape-match':
      return <ShapeMatchStage shapes={c.shapes as string[]} targetShape={c.targetShape as string} prompt={block.content ?? ''} onDone={onDone} />
    case 'ordinal':
      return (
        <OrdinalStage
          icon={c.icon as IconName}
          count={c.count as number}
          targetPosition={c.targetPosition as number}
          prompt={block.content ?? ''}
          onDone={onDone}
        />
      )
    case 'value-compare':
      return (
        <ValueCompareStage
          labelA={c.labelA as string}
          labelB={c.labelB as string}
          numericA={c.numericA as number}
          numericB={c.numericB as number}
          prompt={block.content ?? ''}
          onDone={onDone}
        />
      )
    case 'perimeter':
      return (
        <PerimeterStage
          width={c.width as number}
          height={c.height as number}
          unit={c.unit as string}
          prompt={block.content ?? ''}
          onDone={onDone}
        />
      )
    case 'area':
      return (
        <AreaStage
          width={c.width as number}
          height={c.height as number}
          unit={c.unit as string}
          prompt={block.content ?? ''}
          onDone={onDone}
        />
      )
    case 'number-line':
      return (
        <NumberLineStage
          min={(c.min as number) ?? 0}
          max={(c.max as number) ?? 10}
          target={c.target as number}
          prompt={block.content ?? ''}
          onDone={onDone}
        />
      )
    case 'clock':
      return (
        <ClockStage
          hour={c.hour as number}
          minute={c.minute as 0 | 15 | 30 | 45}
          prompt={block.content ?? ''}
          onDone={onDone}
        />
      )
    case 'balance-scale':
      return (
        <BalanceScaleStage
          leftWeights={c.leftWeights as number[]}
          rightKnown={c.rightKnown as number}
          prompt={block.content ?? ''}
          onDone={onDone}
        />
      )
    case 'money':
      return (
        <MoneyStage
          items={c.items as { label: string; price: number }[]}
          prompt={block.content ?? ''}
          onDone={onDone}
        />
      )
    default:
      return <QurastyrStage total={(c.total as number) ?? 10} startLeft={(c.startLeft as number) ?? 5} onDone={onDone} />
  }
}
