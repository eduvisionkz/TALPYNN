// Shared shape for a fully-authored topic lesson, consumed by
// scripts/generateLessonSeed.ts to produce a SQL migration. Keeping
// content here (not hand-written SQL) means every topic's numbers can
// be typechecked and is far less error-prone than editing raw SQL by
// hand across 15+ topics at a time.

export type BekitTask =
  | { kind: 'short_answer'; title: string; content: string; correctAnswer: string | number; explanation: string; hint: string }
  | {
      kind: 'multiple_choice'
      title: string
      content: string
      options: { text: string; correct: boolean }[]
      explanation: string
      hint: string
    }
  | { kind: 'matching'; title: string; content: string; pairs: [number, number][] }
  | { kind: 'visual_matching'; title: string; content: string; pairs: { icon: string; label: string }[] }
  | { kind: 'sorting'; title: string; content: string; items: string[] }
  | { kind: 'grouping'; title: string; content: string; groupALabel: string; groupBLabel: string; items: { label: string; group: 'a' | 'b' }[] }
  | { kind: 'expression_builder'; title: string; content: string; tiles: string[]; target: string[]; explanation: string }
  | { kind: 'find_error'; title: string; content: string; steps: string[]; errorIndex: number; explanation: string }
  | { kind: 'measurement'; title: string; content: string; unit: string; length: number; maxScale: number; explanation: string }

export interface TopicLessonContent {
  title: string
  grade: 1 | 2 | 3 | 4
  track: 'base' | 'logic'
  learningObjective: string
  kor:
    | { kind: 'pairs-infographic'; pairs: [number, number][]; mediaUrl?: string }
    | { kind: 'story'; slides: string[] }
    | { kind: 'scene'; items: { icon: string; label: string }[]; caption: string }
    | { kind: 'video'; videoUrl: string; caption: string }
  qurastyr:
    | { kind: 'combine-split'; total: number; startLeft: number }
    | { kind: 'count-click'; icon: string; count: number; content: string }
    | { kind: 'compare'; iconA: string; countA: number; iconB: string; countB: number; content: string }
    | { kind: 'pattern-number' | 'pattern-shape'; sequence: string[]; blankIndex: number; correctValue: string; content: string }
    | { kind: 'magic-square'; cells: (number | null)[]; targetSum: number; content: string }
    | { kind: 'shape-match'; shapes: string[]; targetShape: string; content: string }
    | { kind: 'ordinal'; icon: string; count: number; targetPosition: number; content: string }
    | { kind: 'value-compare'; labelA: string; labelB: string; numericA: number; numericB: number; content: string }
    | { kind: 'perimeter'; width: number; height: number; unit: string; content: string }
    | { kind: 'area'; width: number; height: number; unit: string; content: string }
    | { kind: 'number-line'; min: number; max: number; target: number; content: string }
    | { kind: 'clock'; hour: number; minute: 0 | 15 | 30 | 45; content: string }
    | { kind: 'balance-scale'; leftWeights: number[]; rightKnown: number; content: string }
    | { kind: 'money'; items: { label: string; price: number }[]; content: string }
  tusindir: { question: string }
  qoldan: {
    content: string
    partWhole?: { total: number; known: number; knownLabel: string; unknownLabel: string }
    correctAnswer: string | number
    explanation: string
    hint: string
  }
  bekit: BekitTask[]
}
