import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'
import { supabase } from '@/lib/supabase'
import type { Topic } from '@/types/database'

export function TeacherDashboardPage() {
  const { profile } = useAuth()
  const [topics, setTopics] = useState<Topic[]>([])
  const [status, setStatus] = useState<'loading' | 'ready' | 'error'>('loading')
  const [gradeFilter, setGradeFilter] = useState<number | 'all'>('all')

  useEffect(() => {
    if (!profile) return
    let isMounted = true
    supabase.from('topics').select('*').eq('created_by', profile.id).order('updated_at', { ascending: false }).then(({ data, error }) => {
      if (!isMounted) return
      if (error) { setStatus('error'); return }
      setTopics(data ?? [])
      setStatus('ready')
    })
    return () => { isMounted = false }
  }, [profile])

  const filtered = topics.filter((t) => gradeFilter === 'all' || t.grade === gradeFilter)
  const drafts = filtered.filter((t) => t.status === 'draft')
  const published = filtered.filter((t) => t.status === 'published')

  async function exportResultsCsv() {
    const { data, error } = await supabase
      .from('attempts')
      .select('user_id, topic_id, question_id, is_correct, points, created_at')
      .in('topic_id', topics.map((t) => t.id))
    if (error || !data) return
    const header = 'user_id,topic_id,question_id,is_correct,points,created_at\n'
    const rows = data.map((r) => `${r.user_id},${r.topic_id},${r.question_id},${r.is_correct},${r.points},${r.created_at}`).join('\n')
    const blob = new Blob([header + rows], { type: 'text/csv;charset=utf-8;' })
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = 'talpyn-results.csv'
    a.click()
    URL.revokeObjectURL(url)
  }

  return (
    <section className="shell section">
      <span className="eyebrow">Мұғалім кабинеті</span>
      <div className="section-title">
        <h2 style={{ margin: '8px 0 0' }}>Менің тақырыптарым</h2>
        <div style={{ display: 'flex', gap: 10 }}>
          <Link className="button primary" to="/teacher/constructor/new">+ Жаңа тақырып құру</Link>
          <button type="button" className="button secondary" onClick={exportResultsCsv} disabled={topics.length === 0}>
            Нәтижелерді CSV-ке экспорттау
          </button>
        </div>
      </div>

      <div className="filters">
        <div>
          {(['all', 1, 2, 3, 4] as const).map((g) => (
            <button key={g} type="button" className={gradeFilter === g ? 'active' : ''} onClick={() => setGradeFilter(g)}>
              {g === 'all' ? 'Барлық сынып' : `${g}-сынып`}
            </button>
          ))}
        </div>
      </div>

      <div className="teacher-grid">
        <div className="panel">
          <h3>Жарияланған ({status === 'ready' ? published.length : '—'})</h3>
          {status === 'ready' && published.length === 0 && <p className="status">Әзірге жарияланған тақырып жоқ.</p>}
          {published.map((t) => (
            <p key={t.id} className="status" style={{ display: 'flex', justifyContent: 'space-between', gap: 10 }}>
              <span>{t.title}</span>
              <span style={{ display: 'flex', gap: 10 }}>
                <Link className="text-button" style={{ margin: 0 }} to={`/teacher/constructor/${t.id}`}>Өңдеу</Link>
                <Link className="text-button" style={{ margin: 0 }} to={`/teacher/media/${t.id}`}>Медиа</Link>
              </span>
            </p>
          ))}
        </div>
        <div className="panel">
          <h3>Жоба ретінде сақталған ({status === 'ready' ? drafts.length : '—'})</h3>
          {status === 'ready' && drafts.length === 0 && <p className="status">Әзірге жоба жоқ.</p>}
          {drafts.map((t) => (
            <p key={t.id} className="status" style={{ display: 'flex', justifyContent: 'space-between', gap: 10 }}>
              <span>{t.title}</span>
              <span style={{ display: 'flex', gap: 10 }}>
                <Link className="text-button" style={{ margin: 0 }} to={`/teacher/constructor/${t.id}`}>Өңдеу</Link>
                <Link className="text-button" style={{ margin: 0 }} to={`/teacher/media/${t.id}`}>Медиа</Link>
              </span>
            </p>
          ))}
        </div>
      </div>

      <p style={{ marginTop: 30, color: 'var(--muted)' }}>
        Осы бетте мұғалім жаңа тақырып құра алады («+ Жаңа тақырып құру»),
        5 кезеңнің (Көр/Құрастыр/Түсіндір/Қолдан/Бекіт) мазмұнын толтыра алады
        («Өңдеу» сілтемесі — блок қосу/өшіру, Бекіт тапсырмаларын жоғары/төмен
        жылжыту арқылы ретін өзгерту), тақырыпты жариялай/жобаға қайтара алады,
        әр тақырыптың медиа файлдарын жүктей/өшіре алады («Медиа» сілтемесі)
        және оқушылардың нәтижелерін CSV файл түрінде жүктей алады. Платформаның
        дайын 113 тақырыбына (авторы жоқ, жүйелік тақырыптар) видео немесе
        инфографика қосу үшін <Link to="/topics">тақырыптар каталогына</Link>{' '}
        өтіп, керек тақырыптың астындағы «Медиа қосу» сілтемесін басыңыз — мұны
        кез келген мұғалім жасай алады (олардың толық мазмұнын өзгерту әзірге
        тек әкімшіге рұқсат етілген, себебі бұл тақырыптар нақты авторға
        тіркелмеген).
      </p>
      <Link className="text-button" to="/author">Автор бетін өңдеу (әкімші)</Link>
    </section>
  )
}
