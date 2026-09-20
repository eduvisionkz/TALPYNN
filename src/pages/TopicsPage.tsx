import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { supabase, isSupabaseConfigured } from '@/lib/supabase'
import { useAuth } from '@/hooks/useAuth'
import { TOPICS } from '@/data/topics'
import type { Progress, Topic, Track } from '@/types/database'

// Demo-mode rows built from the local topic list when no Supabase
// project is connected — same shape as a real `Topic` row so the
// existing card/filter UI needs no branching, but with a `demo-`
// prefixed id (there is no real lesson content behind these).
const DEMO_TOPICS: Topic[] = TOPICS.map((t, i) => ({
  id: `demo-${i}`,
  section_id: null,
  grade: t.grade,
  track: t.track,
  title: t.title,
  description: null,
  learning_objective: null,
  cover_url: null,
  status: 'published',
  sort_order: i,
  created_by: null,
  created_at: new Date(0).toISOString(),
  updated_at: new Date(0).toISOString(),
}))

const TRACK_LABEL: Record<Track, string> = {
  base: 'Негізгі математика',
  logic: 'Логика және функционалдық сауаттылық',
}

export function TopicsPage() {
  const { user, profile } = useAuth()
  const canManageMedia = profile?.role === 'teacher' || profile?.role === 'admin'
  const [topics, setTopics] = useState<Topic[]>([])
  const [progressByTopic, setProgressByTopic] = useState<Record<string, Progress>>({})
  const [status, setStatus] = useState<'loading' | 'ready' | 'error'>('loading')
  const [grade, setGrade] = useState<number | 'all'>('all')
  const [track, setTrack] = useState<Track | 'all'>('all')
  const [query, setQuery] = useState('')

  useEffect(() => {
    if (!isSupabaseConfigured) {
      // Demo mode: show the local catalog instead of an unreachable query.
      setTopics(DEMO_TOPICS)
      setStatus('ready')
      return
    }

    let isMounted = true

    async function load() {
      const { data, error } = await supabase.from('topics').select('*').eq('status', 'published').order('sort_order', { ascending: true })
      if (!isMounted) return
      if (error) { setStatus('error'); return }
      setTopics(data ?? [])

      if (user) {
        const { data: progressData } = await supabase.from('progress').select('*').eq('user_id', user.id)
        if (isMounted && progressData) {
          setProgressByTopic(Object.fromEntries(progressData.map((p) => [p.topic_id, p])))
        }
      }
      setStatus('ready')
    }
    load()
    return () => { isMounted = false }
  }, [user])

  const filtered = useMemo(() => {
    return topics.filter((t) => {
      if (grade !== 'all' && t.grade !== grade) return false
      if (track !== 'all' && t.track !== track) return false
      if (query.trim() && !t.title.toLowerCase().includes(query.trim().toLowerCase())) return false
      return true
    })
  }, [topics, grade, track, query])

  return (
    <section className="shell section">
      <div className="section-title">
        <h2>Тақырыптар каталогы</h2>
        <span>{status === 'ready' ? `${filtered.length} тақырып` : ''}</span>
      </div>

      <div className="filters">
        <div>
          {(['all', 1, 2, 3, 4] as const).map((g) => (
            <button key={g} type="button" className={grade === g ? 'active' : ''} onClick={() => setGrade(g)}>
              {g === 'all' ? 'Барлық сынып' : `${g}-сынып`}
            </button>
          ))}
        </div>
        <div>
          {(['all', 'base', 'logic'] as const).map((t) => (
            <button key={t} type="button" className={track === t ? 'active' : ''} onClick={() => setTrack(t)}>
              {t === 'all' ? 'Барлық бағыт' : TRACK_LABEL[t]}
            </button>
          ))}
        </div>
      </div>

      <input className="search" type="search" placeholder="Тақырып бойынша іздеу..." aria-label="Тақырып бойынша іздеу" value={query} onChange={(e) => setQuery(e.target.value)} />

      {status === 'loading' && (
        <div className="topic-grid">
          {[0, 1, 2].map((i) => <div key={i} className="skeleton-block" style={{ minHeight: 185, borderRadius: 20 }} />)}
        </div>
      )}

      {status === 'error' && (
        <div className="empty-state">
          <b>Тақырыптар жүктелмеді</b>
          <p>Дерекқормен байланыс орнатылмады. Интернет байланысын тексеріп, қайталап көріңіз.</p>
        </div>
      )}

      {status === 'ready' && filtered.length === 0 && (
        <div className="empty-state">
          <b>Әзірге тақырып жоқ</b>
          <p>Мұғалім тақырыптарды жариялаған соң, олар осында пайда болады.</p>
        </div>
      )}

      {status === 'ready' && filtered.length > 0 && (
        <div className="topic-grid">
          {filtered.map((topic) => {
            const progress = progressByTopic[topic.id]
            const isDemo = topic.id.startsWith('demo-')
            return (
              <article className="topic-card" key={topic.id}>
                <small>{topic.grade}-сынып · {TRACK_LABEL[topic.track]}</small>
                <h3>{topic.title}</h3>
                {topic.description && <p>{topic.description}</p>}
                {isDemo && <span className="status">Демо — сабақ мазмұны қолжетімсіз</span>}
                {!isDemo && progress?.completed && <span className="status">Аяқталды</span>}
                {!isDemo && progress && !progress.completed && <span className="status">Жалғастыру · {progress.percent}%</span>}
                {!isDemo && !progress && <span className="status">Жаңа</span>}
                {isDemo ? (
                  <span className="text-button" aria-disabled style={{ opacity: 0.55, cursor: 'not-allowed' }}>
                    Тақырыпты ашу (Supabase қосылымы қажет)
                  </span>
                ) : (
                  <Link to={`/lesson/${topic.id}`} className="text-button">
                    {progress?.completed ? 'Қайта қарау' : progress ? 'Жалғастыру' : 'Тақырыпты ашу'}
                  </Link>
                )}
                {!isDemo && canManageMedia && (
                  <Link to={`/teacher/media/${topic.id}`} className="text-button">
                    Медиа қосу
                  </Link>
                )}
              </article>
            )
          })}
        </div>
      )}
    </section>
  )
}
