import { useState } from 'react'
import { Link } from 'react-router-dom'
import { KorRenderer } from './KorRenderer'
import { QurastyrRenderer } from './QurastyrRenderer'
import { TusindirStage } from './TusindirStage'
import { QoldanRenderer } from './QoldanRenderer'
import { BekitStage, type BekitBlockData, type BekitResult } from './BekitStage'
import { TalpynGuide } from './TalpynGuide'
import { supabase } from '@/lib/supabase'
import { evaluateAndAwardAchievements } from '@/lib/achievements'
import { Confetti } from './Confetti'
import {
  computeLevel, computeStreak, isSoundEnabled, setSoundEnabled,
  playCorrectSound, playIncorrectSound, playSuccessFanfare, playLevelUpFanfare,
  type LevelInfo,
} from '@/lib/gamification'
import type { Achievement, LessonBlock, LessonStage, Question, Topic } from '@/types/database'

const STAGE_ORDER: LessonStage[] = ['kor', 'qurastyr', 'tusindir', 'qoldan', 'bekit']
const STAGE_LABEL: Record<LessonStage, string> = {
  kor: 'Көр', qurastyr: 'Құрастыр', tusindir: 'Түсіндір', qoldan: 'Қолдан', bekit: 'Бекіт',
}

interface LessonEngineProps {
  topic: Topic
  blocksByStage: Record<LessonStage, LessonBlock[]>
  qoldanQuestion: Question | null
  bekitBlocks: BekitBlockData[]
  userId: string | null
  onProgressChange?: (percent: number) => void
}

export function LessonEngine({ topic, blocksByStage, qoldanQuestion, bekitBlocks, userId, onProgressChange }: LessonEngineProps) {
  const [stageIndex, setStageIndex] = useState(0)
  const [finalResults, setFinalResults] = useState<BekitResult[] | null>(null)
  const [saveStatus, setSaveStatus] = useState<'idle' | 'saving' | 'saved' | 'error'>('idle')
  const [newAchievements, setNewAchievements] = useState<Achievement[]>([])
  const [streak, setStreak] = useState<number | null>(null)
  const [levelUp, setLevelUp] = useState<LevelInfo | null>(null)
  const [soundOn, setSoundOn] = useState(isSoundEnabled())

  function toggleSound() {
    const next = !soundOn
    setSoundOn(next)
    setSoundEnabled(next)
  }

  const stage = STAGE_ORDER[stageIndex]

  async function persistProgress(currentStage: LessonStage, finalPercent: number, score: number, completed: boolean) {
    if (!userId) return // not signed in — the lesson still works, nothing is saved
    setSaveStatus('saving')
    const { error } = await supabase.from('progress').upsert(
      {
        user_id: userId,
        topic_id: topic.id,
        current_stage: currentStage,
        percent: finalPercent,
        score,
        completed,
        completed_at: completed ? new Date().toISOString() : null,
      },
      { onConflict: 'user_id,topic_id' }
    )
    setSaveStatus(error ? 'error' : 'saved')
  }

  async function persistAttempts(results: BekitResult[]) {
    if (!userId) return
    // Deduplicate by block, keeping only the last attempt per block.
    const lastByBlock = new Map<string, { isCorrect: boolean; answer: unknown }>()
    for (const r of results) lastByBlock.set(r.blockId, { isCorrect: r.isCorrect, answer: r.answer })

    const rows = bekitBlocks
      .filter((b) => b.question && lastByBlock.has(b.block.id))
      .map((b) => {
        const last = lastByBlock.get(b.block.id)!
        return {
          user_id: userId,
          topic_id: topic.id,
          question_id: b.question!.id,
          answer: last.answer ?? null,
          is_correct: last.isCorrect,
          points: last.isCorrect ? b.question!.points : 0,
        }
      })
    if (rows.length > 0) await supabase.from('attempts').insert(rows)
  }

  function goToNextStage() {
    if (stageIndex + 1 < STAGE_ORDER.length) {
      const next = stageIndex + 1
      setStageIndex(next)
      const nextPercent = Math.round((next / STAGE_ORDER.length) * 100)
      onProgressChange?.(nextPercent)
      persistProgress(STAGE_ORDER[next], nextPercent, 0, false)
    }
  }

  async function handleBekitFinish(results: BekitResult[]) {
    const lastByBlock = new Map<string, boolean>()
    for (const r of results) lastByBlock.set(r.blockId, r.isCorrect)
    const correctCount = [...lastByBlock.values()].filter(Boolean).length
    const total = bekitBlocks.length
    const score = Math.round((correctCount / total) * 100)

    setFinalResults(results)
    await persistAttempts(results)

    if (userId) {
      const { data: beforeRows } = await supabase.from('progress').select('completed').eq('user_id', userId)
      const prevCompletedCount = (beforeRows ?? []).filter((r) => r.completed).length

      await persistProgress('bekit', 100, score, true)

      const { data: afterRows } = await supabase.from('progress').select('completed, completed_at').eq('user_id', userId)
      const newCompletedCount = (afterRows ?? []).filter((r) => r.completed).length
      setStreak(computeStreak(afterRows ?? []))

      const prevLevel = computeLevel(prevCompletedCount)
      const newLevel = computeLevel(newCompletedCount)
      if (newLevel.level > prevLevel.level) {
        setLevelUp(newLevel)
        playLevelUpFanfare()
      }

      setNewAchievements(await evaluateAndAwardAchievements(userId))
    } else {
      await persistProgress('bekit', 100, score, true)
    }

    playSuccessFanfare()
  }

  if (finalResults) {
    const lastByBlock = new Map<string, boolean>()
    for (const r of finalResults) lastByBlock.set(r.blockId, r.isCorrect)
    const correctCount = [...lastByBlock.values()].filter(Boolean).length
    const total = bekitBlocks.length
    const percentScore = total > 0 ? Math.round((correctCount / total) * 100) : 0

    return (
      <div className="lesson-panel">
        {percentScore >= 50 && <Confetti pieceCount={percentScore === 100 ? 60 : 30} />}
        <TalpynGuide state="finish" />
        <div className="result">
          <p className="status">Нәтиже</p>
          <b>{percentScore}%</b>
          <p>
            {correctCount} / {total} тапсырма дұрыс орындалды.
          </p>
          {!userId && (
            <p className="status">Нәтижеңіз сақталмады — сақтау үшін аккаунтқа кіріңіз.</p>
          )}
          {userId && saveStatus === 'saved' && <p className="form-success">Нәтиже сәтті сақталды.</p>}
          {userId && saveStatus === 'error' && <p className="form-error">Нәтижені сақтау кезінде қате шықты.</p>}
          {userId && streak !== null && streak > 1 && (
            <p className="streak-badge">🔥 {streak} күн қатарынан сабақ өттің!</p>
          )}
        </div>

        {levelUp && (
          <div className="level-badge" role="status">
            <span aria-hidden style={{ fontSize: 28 }}>🐆</span>
            <div>
              <b>Жаңа деңгей: {levelUp.title}!</b>
              <div><span>{levelUp.completedForCurrent} тақырыпты аяқтап, {levelUp.level}-деңгейге көтерілдің.</span></div>
            </div>
          </div>
        )}

        {newAchievements.length > 0 && (
          <div className="achievement-toast" role="status">
            {newAchievements.map((a) => (
              <div key={a.id} className="achievement-toast-item">
                <span className="achievement-toast-icon" aria-hidden>🏆</span>
                <div>
                  <b>Жаңа жетістік: {a.title}</b>
                  {a.description && <p>{a.description}</p>}
                </div>
              </div>
            ))}
          </div>
        )}
        <div className="actions">
          <button
            type="button"
            className="button secondary"
            onClick={() => {
              setFinalResults(null)
              setStageIndex(0)
              setLevelUp(null)
              setNewAchievements([])
            }}
          >
            Қайталау
          </button>
          <Link className="button primary" to="/topics">
            Тақырыптар каталогына оралу
          </Link>
        </div>
      </div>
    )
  }

  return (
    <div>
      <div className="actions" style={{ justifyContent: 'flex-end', margin: '0 0 10px' }}>
        <button type="button" className="sound-toggle" onClick={toggleSound} aria-pressed={soundOn}>
          {soundOn ? '🔊 Дыбыс қосулы' : '🔇 Дыбыс өшірулі'}
        </button>
      </div>
      <div className="lesson-layout">
        <aside aria-label="Сабақ кезеңдері">
          {STAGE_ORDER.map((s, i) => (
            <button key={s} type="button" className={i === stageIndex ? 'active' : ''} disabled={i > stageIndex} onClick={() => i <= stageIndex && setStageIndex(i)}>
              {STAGE_LABEL[s]}
            </button>
          ))}
        </aside>

        <div className="lesson-panel">
          {stage === 'kor' && blocksByStage.kor[0] && (
            <KorRenderer block={blocksByStage.kor[0]} onDone={goToNextStage} />
          )}
          {stage === 'qurastyr' && blocksByStage.qurastyr[0] && (
            <QurastyrRenderer block={blocksByStage.qurastyr[0]} onDone={goToNextStage} />
          )}
          {stage === 'tusindir' && blocksByStage.tusindir[0] && (
            <TusindirStage question={blocksByStage.tusindir[0].content ?? ''} onDone={goToNextStage} />
          )}
          {stage === 'qoldan' && blocksByStage.qoldan[0] && (
            <QoldanRenderer block={blocksByStage.qoldan[0]} question={qoldanQuestion} onDone={goToNextStage} />
          )}
          {stage === 'bekit' && bekitBlocks.length > 0 && (
            <BekitStage
              blocks={bekitBlocks}
              onFinish={handleBekitFinish}
              onAnswer={(isCorrect) => (isCorrect ? playCorrectSound() : playIncorrectSound())}
            />
          )}
        </div>
      </div>
    </div>
  )
}

export { STAGE_ORDER }
