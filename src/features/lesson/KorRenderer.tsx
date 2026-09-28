import { KorStage } from './KorStage'
import { StorySlides } from './StorySlides'
import { SceneStage } from './SceneStage'
import { VideoStage } from './VideoStage'
import type { LessonBlock } from '@/types/database'

interface KorRendererProps {
  block: LessonBlock
  onDone: () => void
}

/**
 * Dispatches the Көр stage's visual by `configuration.kind`:
 *  - 'pairs-infographic' (default when `pairs` is present): the original
 *    number-pairs infographic stepper.
 *  - 'scene': a labelled row of icon cards inside an SVG frame — several
 *    related objects shown at once, richer than a single text slide.
 *  - 'story' (default otherwise): a narrated multi-slide explanation,
 *    built from `configuration.slides: string[]`.
 */
export function KorRenderer({ block, onDone }: KorRendererProps) {
  const kind = (block.configuration.kind as string | undefined) ?? (block.configuration.pairs ? 'pairs-infographic' : 'story')

  if (kind === 'pairs-infographic') {
    return (
      <KorStage
        imageUrl={block.media_url ?? '/infographics/ten-composition.png'}
        pairs={(block.configuration.pairs as [number, number][]) ?? []}
        onDone={onDone}
      />
    )
  }

  if (kind === 'scene') {
    return (
      <SceneStage
        items={(block.configuration.items as { icon: string; label: string }[]) ?? []}
        caption={(block.configuration.caption as string) ?? block.content ?? ''}
        onDone={onDone}
      />
    )
  }

  if (kind === 'video') {
    return (
      <VideoStage
        videoUrl={block.media_url ?? ''}
        caption={(block.configuration.caption as string) ?? block.content ?? ''}
        onDone={onDone}
      />
    )
  }

  const slides = (block.configuration.slides as string[] | undefined) ?? (block.content ? [block.content] : [''])
  return <StorySlides slides={slides} onDone={onDone} />
}
