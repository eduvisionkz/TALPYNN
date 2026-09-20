import { QoldanStage } from './QoldanStage'
import type { LessonBlock, Question } from '@/types/database'

interface QoldanRendererProps {
  block: LessonBlock
  question: Question | null
  onDone: (isCorrect: boolean, answer: number) => void
}

export function QoldanRenderer({ block, question, onDone }: QoldanRendererProps) {
  const c = block.configuration
  const correctAnswer = question ? Number(String(question.correct_answer).replace(/"/g, '')) : 0
  const hasPartWhole = c.total !== undefined && c.known !== undefined

  return (
    <QoldanStage
      questionText={block.content ?? ''}
      partWhole={
        hasPartWhole
          ? {
              total: c.total as number,
              known: c.known as number,
              knownLabel: (c.knownLabel as string) ?? '',
              unknownLabel: (c.unknownLabel as string) ?? '',
            }
          : undefined
      }
      correctAnswer={correctAnswer}
      hint={question?.hint ?? undefined}
      onDone={onDone}
    />
  )
}
