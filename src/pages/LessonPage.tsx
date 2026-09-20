import { useEffect, useState, type CSSProperties } from 'react'
import { Link, useParams } from 'react-router-dom'
import { supabase, isSupabaseConfigured } from '@/lib/supabase'
import { useAuth } from '@/hooks/useAuth'
import { LessonEngine } from '@/features/lesson/LessonEngine'
import type { BekitBlockData } from '@/features/lesson/BekitStage'
import type { LessonBlock, LessonStage, Question, QuestionOption, Topic } from '@/types/database'

const STAGE_ORDER: LessonStage[] = ['kor', 'qurastyr', 'tusindir', 'qoldan', 'bekit']

export function LessonPage() {
  const { topicId } = useParams<{ topicId: string }>()
  const { user } = useAuth()
  const [topic, setTopic] = useState<Topic | null>(null)
  const [blocksByStage, setBlocksByStage] = useState<Record<LessonStage, LessonBlock[]> | null>(null)
  const [qoldanQuestion, setQoldanQuestion] = useState<Question | null>(null)
  const [bekitBlocks, setBekitBlocks] = useState<BekitBlockData[]>([])
  const [percent, setPercent] = useState(0)
  const [status, setStatus] = useState<'loading' | 'ready' | 'no-content' | 'not-found' | 'error' | 'no-supabase'>('loading')

  useEffect(() => {
    if (!topicId) return
    if (!isSupabaseConfigured) {
      // Sabaq content only ever lives in Supabase (no local fallback),
      // so this is where demo mode has to stop rather than error out.
      setStatus('no-supabase')
      return
    }
    let isMounted = true

    async function load() {
      const { data: topicData, error: topicError } = await supabase.from('topics').select('*').eq('id', topicId).single()
      if (!isMounted) return
      if (topicError || !topicData) {
        setStatus(topicError?.code === 'PGRST116' ? 'not-found' : 'error')
        return
      }
      setTopic(topicData)

      const { data: blockData, error: blockError } = await supabase
        .from('lesson_blocks')
        .select('*')
        .eq('topic_id', topicId)
        .order('stage', { ascending: true })
        .order('sort_order', { ascending: true })

      if (!isMounted) return
      if (blockError) { setStatus('error'); return }
      if (!blockData || blockData.length === 0) { setStatus('no-content'); return }

      const grouped = Object.fromEntries(STAGE_ORDER.map((s) => [s, [] as LessonBlock[]])) as Record<LessonStage, LessonBlock[]>
      for (const b of blockData) grouped[b.stage as LessonStage].push(b)
      setBlocksByStage(grouped)

      const blockIds = blockData.map((b) => b.id)
      const { data: questionData } = await supabase.from('questions').select('*').in('lesson_block_id', blockIds)
      const questions = questionData ?? []

      const qoldanBlock = grouped.qoldan[0]
      setQoldanQuestion(questions.find((q) => q.lesson_block_id === qoldanBlock?.id) ?? null)

      const questionIds = questions.map((q) => q.id)
      const { data: optionData } = questionIds.length
        ? await supabase.from('question_options').select('*').in('question_id', questionIds)
        : { data: [] as QuestionOption[] }

      const bekit: BekitBlockData[] = grouped.bekit.map((block) => {
        const question = questions.find((q) => q.lesson_block_id === block.id) ?? null
        const options = (optionData ?? []).filter((o) => o.question_id === question?.id)
        return { block, question, options }
      })
      setBekitBlocks(bekit)

      setStatus('ready')
    }

    load()
    return () => { isMounted = false }
  }, [topicId])

  if (status === 'loading') {
    return (
      <div className="shell section" aria-busy="true">
        <div className="skeleton-block" style={{ height: 320, borderRadius: 24 }} />
      </div>
    )
  }

  if (status === 'no-supabase') {
    return (
      <div className="shell section empty-state">
        <b>Демо режим</b>
        <p>
          Сабақ мазмұны тек Supabase-ке қосылған кезде қолжетімді. Бұл орта әзірге демо
          режимде жұмыс істеп тұр (<code>.env</code> файлында Supabase деректері жоқ).
        </p>
        <Link className="button primary" to="/topics">Каталогқа оралу</Link>
      </div>
    )
  }

  if (status === 'not-found') {
    return (
      <div className="shell section empty-state">
        <b>Тақырып табылмады</b>
        <p>Сілтеме қате немесе тақырып жойылған болуы мүмкін.</p>
        <Link className="button primary" to="/topics">Каталогқа оралу</Link>
      </div>
    )
  }

  if (status === 'error') {
    return (
      <div className="shell section empty-state">
        <b>Жүктеу қатесі</b>
        <p>Сабақты жүктеу кезінде қате шықты. Интернет байланысын тексеріп, қайталап көріңіз.</p>
      </div>
    )
  }

  if (status === 'no-content' || !topic || !blocksByStage) {
    return (
      <div className="shell section">
        <div className="lesson-head">
          <div>
            <span className="eyebrow">{topic?.grade}-сынып</span>
            <h2 style={{ margin: '6px 0' }}>{topic?.title}</h2>
          </div>
        </div>
        <div className="lesson-panel empty-state">
          <b>Бұл тақырыпқа әлі мазмұн қосылмаған</b>
          <p>Мұғалім конструктор арқылы блоктарды қосқан соң, сабақ осында көрсетіледі.</p>
        </div>
      </div>
    )
  }

  return (
    <div className="shell section lesson-view">
      <div className="lesson-head">
        <div>
          <span className="eyebrow">{topic.grade}-сынып</span>
          <h2 style={{ margin: '6px 0' }}>{topic.title}</h2>
          {topic.learning_objective && <p className="lead">{topic.learning_objective}</p>}
        </div>
        <div className="progress" aria-label="Сабақ барысы" style={{ '--percent': percent } as CSSProperties}>
          <span>{percent}%</span>
        </div>
      </div>

      <LessonEngine
        topic={topic}
        blocksByStage={blocksByStage}
        qoldanQuestion={qoldanQuestion}
        bekitBlocks={bekitBlocks}
        userId={user?.id ?? null}
        onProgressChange={setPercent}
      />
    </div>
  )
}
