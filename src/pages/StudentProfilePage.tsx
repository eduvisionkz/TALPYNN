import { useEffect, useState } from 'react'
import { useAuth } from '@/hooks/useAuth'
import { supabase } from '@/lib/supabase'
import { computeLevel, computeStreak } from '@/lib/gamification'
import type { Achievement, Progress, Topic, UserAchievement } from '@/types/database'

export function StudentProfilePage() {
  const { profile } = useAuth()
  const [progress, setProgress] = useState<Progress[]>([])
  const [topicsById, setTopicsById] = useState<Record<string, Topic>>({})
  const [achievements, setAchievements] = useState<(UserAchievement & { achievement?: Achievement })[]>([])
  const [status, setStatus] = useState<'loading' | 'ready' | 'error'>('loading')

  useEffect(() => {
    if (!profile) return
    let isMounted = true

    async function load() {
      const { data: progressData, error } = await supabase.from('progress').select('*').eq('user_id', profile!.id)
      if (!isMounted) return
      if (error) { setStatus('error'); return }
      setProgress(progressData ?? [])

      const topicIds = (progressData ?? []).map((p) => p.topic_id)
      if (topicIds.length > 0) {
        const { data: topicsData } = await supabase.from('topics').select('*').in('id', topicIds)
        if (isMounted && topicsData) setTopicsById(Object.fromEntries(topicsData.map((t) => [t.id, t])))
      }

      const { data: userAch } = await supabase.from('user_achievements').select('*, achievement:achievements(*)').eq('user_id', profile!.id)
      if (isMounted && userAch) setAchievements(userAch as unknown as (UserAchievement & { achievement?: Achievement })[])

      setStatus('ready')
    }
    load()
    return () => { isMounted = false }
  }, [profile])

  const completed = progress.filter((p) => p.completed)
  const inProgress = progress.filter((p) => !p.completed)
  const avgScore = progress.length ? Math.round(progress.reduce((sum, p) => sum + p.percent, 0) / progress.length) : null
  const difficult = progress.filter((p) => p.completed && p.score < 60)
  const recentActivity = [...progress].sort((a, b) => (a.updated_at < b.updated_at ? 1 : -1)).slice(0, 5)
  const streak = computeStreak(progress)
  const level = computeLevel(completed.length)

  return (
    <section className="shell section">
      <span className="eyebrow">Кабинетім</span>
      <h2 style={{ margin: '8px 0 30px' }}>
        {profile ? profile.full_name || 'Оқушы' : ''}
        {profile?.grade ? ` · ${profile.grade}-сынып` : ''}
      </h2>

      {status === 'ready' && (
        <div className="level-badge" style={{ marginBottom: 20, maxWidth: 420 }}>
          <span aria-hidden style={{ fontSize: 28 }}>🐆</span>
          <div>
            <b>{level.level}-деңгей — {level.title}</b>
            <div>
              <span>
                {level.completedForNext ? `Келесі деңгейге дейін ${level.completedForNext - completed.length} тақырып қалды.` : 'Ең жоғарғы деңгейдесің!'}
                {streak > 1 && ` 🔥 ${streak} күн қатарынан белсенді.`}
              </span>
            </div>
          </div>
        </div>
      )}

      <div className="stats" style={{ marginBottom: 36 }}>
        <span><b>{status === 'ready' ? completed.length : '—'}</b>Аяқталған тақырып</span>
        <span><b>{status === 'ready' ? inProgress.length : '—'}</b>Жалғасып жатқан</span>
        <span><b>{status === 'ready' && avgScore !== null ? `${avgScore}%` : '—'}</b>Орташа нәтиже</span>
      </div>

      {status === 'loading' && <div className="skeleton-block" style={{ height: 160, borderRadius: 20 }} />}
      {status === 'error' && <div className="empty-state"><b>Дерек жүктелмеді</b><p>Прогресті жүктеу кезінде қате шықты.</p></div>}

      {status === 'ready' && progress.length === 0 && (
        <div className="empty-state">
          <b>Әзірге нәтиже жоқ</b>
          <p>Тақырыптар каталогынан сабақ бастаған соң, прогресіңіз осында көрінеді.</p>
        </div>
      )}

      {status === 'ready' && progress.length > 0 && (
        <div className="teacher-grid">
          <div className="panel">
            <h3>Соңғы әрекеттер</h3>
            {recentActivity.map((p) => (
              <p key={p.id} className="status">
                {topicsById[p.topic_id]?.title ?? p.topic_id} — {p.completed ? `аяқталды (${p.score}%)` : `${p.percent}%`}
              </p>
            ))}
          </div>
          <div className="panel">
            <h3>Қиын тақырыптар</h3>
            {difficult.length === 0 && <p className="status">Қиын тақырып жоқ.</p>}
            {difficult.map((p) => (
              <p key={p.id} className="status">{topicsById[p.topic_id]?.title ?? p.topic_id} — {p.score}%</p>
            ))}
          </div>
        </div>
      )}

      <h3 style={{ marginTop: 40 }}>Жетістіктер</h3>
      {status === 'ready' && achievements.length === 0 && <p className="status">Әзірге жетістік жоқ.</p>}
      {achievements.map((a) => (
        <p key={a.id} className="status">{a.achievement?.title ?? a.achievement_id}</p>
      ))}
    </section>
  )
}
