import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { supabase, isSupabaseConfigured } from '@/lib/supabase'
import { TOTAL_TOPIC_COUNT } from '@/data/topics'
import type { Topic } from '@/types/database'

const STAGES = [
  { code: 'Көр', text: 'Оқушы суреттен, схемадан немесе санды модельден заңдылықты көреді.' },
  { code: 'Құрастыр', text: 'Оқушы затты, санды немесе фигураны өзі жылжытып, модель құрайды.' },
  { code: 'Түсіндір', text: 'Оқушы шешімнің неге дұрыс екенін өз сөзімен түсіндіреді.' },
  { code: 'Қолдан', text: 'Оқушы білімін өмірлік жағдаятта қолданады.' },
  { code: 'Бекіт', text: 'Оқушы қысқа тапсырмаларды орындап, нәтижесін көреді.' },
]

export function HomePage() {
  const [topicCount, setTopicCount] = useState<number | null>(null)
  const [popular, setPopular] = useState<Topic[]>([])

  useEffect(() => {
    if (!isSupabaseConfigured) {
      // Demo mode: no cloud project connected, so show the local topic
      // count/titles instead of the (unreachable) published catalog.
      setTopicCount(TOTAL_TOPIC_COUNT)
      setPopular([])
      return
    }
    let isMounted = true
    supabase
      .from('topics')
      .select('*', { count: 'exact' })
      .eq('status', 'published')
      .order('sort_order', { ascending: true })
      .limit(3)
      .then(
        ({ data, count }) => {
          if (!isMounted) return
          setTopicCount(count ?? 0)
          setPopular(data ?? [])
        },
        (err: unknown) => console.error('Talpyn: тақырыптарды жүктеу қатесі', err)
      )
    return () => { isMounted = false }
  }, [])

  return (
    <>
      <section className="shell hero">
        <div>
          <span className="eyebrow">Бастауыш сынып математикасы</span>
          <h1>Talpyn — санды көру, құрастыру және түсіну платформасы</h1>
          <p className="lead">
            1–4 сынып оқушыларына арналған интерактивті математика платформасы. Әр тақырып
            бес қадаммен өтеді: көру, құрастыру, түсіндіру, қолдану және бекіту.
          </p>
          <div className="actions">
            <Link className="button primary" to="/topics">Оқуды бастау</Link>
            <Link className="button secondary" to="/methodology">Әдістемені көру</Link>
          </div>
          <div className="stats">
            <span><b>4</b>сынып</span>
            <span><b>113</b>тақырып</span>
            <span><b>2</b>бағыт</span>
          </div>
        </div>
        <div className="mascot-stage">
          <div className="halo" aria-hidden="true" />
          <img src="/mascot/talpyn-greeting.png" alt="Талпын — платформаның кейіпкері, қар барысы" />
        </div>
      </section>

      <section className="method-wrap">
        <div className="shell">
          <h2>Авторлық педагогикалық модель</h2>
          <div className="method-grid">
            {STAGES.map((stage, i) => (
              <article key={stage.code}>
                <span>{String(i + 1).padStart(2, '0')}</span>
                <h3>{stage.code}</h3>
                <p>{stage.text}</p>
              </article>
            ))}
          </div>
        </div>
      </section>

      {popular.length > 0 && (
        <section className="shell section">
          <div className="section-title">
            <h2>Танымал тақырыптар</h2>
            <span>{topicCount !== null ? `Барлығы ${topicCount} тақырып` : ''}</span>
          </div>
          <div className="topic-grid">
            {popular.map((topic) => (
              <article className="topic-card" key={topic.id}>
                <small>{topic.grade}-сынып</small>
                <h3>{topic.title}</h3>
                {topic.description && <p>{topic.description}</p>}
                <Link to={`/lesson/${topic.id}`} className="text-button">Тақырыпты ашу</Link>
              </article>
            ))}
          </div>
        </section>
      )}

      <section className="shell section author">
        <div className="author-photo">
          <img src="/authors/author.jpg" alt="Байбатырова Назым Серикболатовна" />
        </div>
        <div>
          <span className="eyebrow">Автор туралы</span>
          <h2 style={{ margin: '10px 0 16px' }}>Платформаны құрастырған педагог</h2>
          <p>
            Байбатырова Назым Серикболатовна — Шығыс Қазақстан облысы білім басқармасы
            Катонқарағай ауданы бойынша білім бөлімінің «Қалихан Ысқақов атындағы орта
            мектебі» КММ бастауыш сынып мұғалімі, педагог-зерттеуші.
          </p>
          <Link className="text-button" to="/author">Толық ақпаратты көру</Link>
        </div>
      </section>
    </>
  )
}
