import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'
import type { AuthorProfile } from '@/types/database'

export function AuthorPage() {
  const [author, setAuthor] = useState<AuthorProfile | null>(null)
  const [status, setStatus] = useState<'loading' | 'ready' | 'error'>('loading')

  useEffect(() => {
    let isMounted = true
    supabase.from('author_profile').select('*').limit(1).single().then(({ data, error }) => {
      if (!isMounted) return
      if (error) { setStatus('error'); return }
      setAuthor(data)
      setStatus('ready')
    })
    return () => { isMounted = false }
  }, [])

  return (
    <section className="shell section author">
      {status === 'loading' && (
        <>
          <div className="author-photo"><div className="skeleton-block" style={{ aspectRatio: '4/5', borderRadius: 20 }} /></div>
          <div className="skeleton-block" style={{ height: 220, borderRadius: 20 }} />
        </>
      )}
      {status === 'error' && (
        <div className="empty-state" style={{ gridColumn: '1 / -1' }}>
          <b>Дерек жүктелмеді</b>
          <p>Автор туралы ақпаратты жүктеу кезінде қате шықты. Кейінірек қайталап көріңіз.</p>
        </div>
      )}
      {status === 'ready' && author && (
        <>
          <div className="author-photo">
            <img src={author.photo_url ?? '/authors/author.jpg'} alt={author.full_name} />
          </div>
          <div>
            <span className="eyebrow">Автор туралы</span>
            <h2 style={{ margin: '10px 0 4px' }}>{author.full_name}</h2>
            {author.position && <p style={{ fontWeight: 700, color: '#234356' }}>{author.position}</p>}
            {author.workplace && <p>{author.workplace}</p>}
            <p>
              {[
                author.experience_years != null ? `Педагогикалық еңбек өтілі — ${author.experience_years} жыл` : null,
                author.education ? `Білімі — ${author.education}` : null,
              ].filter(Boolean).join('. ')}
            </p>
            {author.bio && <p>{author.bio}</p>}
          </div>
        </>
      )}
    </section>
  )
}
