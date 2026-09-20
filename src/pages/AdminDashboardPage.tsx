import { useEffect, useRef, useState } from 'react'
import { supabase } from '@/lib/supabase'
import { useAuth } from '@/hooks/useAuth'
import { uploadMaterial, FileValidationError } from '@/lib/storage'
import type { AuthorProfile, Profile, UserRole } from '@/types/database'

const ROLE_LABELS: Record<UserRole, string> = {
  student: 'Оқушы',
  teacher: 'Мұғалім',
  admin: 'Әкімші',
}

function AuthorProfileEditor() {
  const [author, setAuthor] = useState<AuthorProfile | null>(null)
  const [status, setStatus] = useState<'loading' | 'ready' | 'error'>('loading')
  const [saveState, setSaveState] = useState<'idle' | 'saving' | 'saved' | 'error'>('idle')
  const [uploadError, setUploadError] = useState<string | null>(null)
  const fileRef = useRef<HTMLInputElement>(null)

  useEffect(() => {
    let isMounted = true
    supabase.from('author_profile').select('*').limit(1).single().then(({ data, error }) => {
      if (!isMounted) return
      if (error || !data) { setStatus('error'); return }
      setAuthor(data)
      setStatus('ready')
    })
    return () => { isMounted = false }
  }, [])

  function update<K extends keyof AuthorProfile>(key: K, value: AuthorProfile[K]) {
    setAuthor((prev) => (prev ? { ...prev, [key]: value } : prev))
  }

  async function handlePhotoUpload(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file || !author) return
    setUploadError(null)
    try {
      const result = await uploadMaterial(file, 'authors')
      update('photo_url', result.publicUrl)
    } catch (err) {
      setUploadError(err instanceof FileValidationError ? err.message : 'Суретті жүктеу кезінде қате шықты.')
    }
  }

  async function save() {
    if (!author) return
    setSaveState('saving')
    const { error } = await supabase
      .from('author_profile')
      .update({
        full_name: author.full_name,
        bio: author.bio,
        workplace: author.workplace,
        position: author.position,
        category: author.category,
        experience_years: author.experience_years,
        education: author.education,
        photo_url: author.photo_url,
      })
      .eq('id', author.id)
    setSaveState(error ? 'error' : 'saved')
  }

  if (status === 'loading') return <div className="skeleton-block" style={{ height: 200, borderRadius: 20 }} />
  if (status === 'error' || !author) {
    return <div className="empty-state"><b>Дерек жүктелмеді</b><p>Автор профилін жүктеу кезінде қате шықты.</p></div>
  }

  return (
    <div className="panel">
      <label>
        Аты-жөні
        <input type="text" value={author.full_name} onChange={(e) => update('full_name', e.target.value)} />
      </label>
      <label>
        Лауазымы
        <input type="text" value={author.position ?? ''} onChange={(e) => update('position', e.target.value)} />
      </label>
      <label>
        Жұмыс орны
        <input type="text" value={author.workplace ?? ''} onChange={(e) => update('workplace', e.target.value)} />
      </label>
      <div className="two">
        <label>
          Санаты
          <input type="text" value={author.category ?? ''} onChange={(e) => update('category', e.target.value)} />
        </label>
        <label>
          Еңбек өтілі (жыл)
          <input
            type="number"
            value={author.experience_years ?? ''}
            onChange={(e) => update('experience_years', e.target.value === '' ? null : Number(e.target.value))}
          />
        </label>
      </div>
      <label>
        Білімі
        <input type="text" value={author.education ?? ''} onChange={(e) => update('education', e.target.value)} />
      </label>
      <label>
        Өзі туралы қысқаша
        <textarea value={author.bio ?? ''} onChange={(e) => update('bio', e.target.value)} rows={3} />
      </label>
      <label>
        Фото (міндетті емес)
        <input ref={fileRef} type="file" accept="image/jpeg,image/png,image/webp,image/svg+xml" onChange={handlePhotoUpload} />
      </label>
      {author.photo_url && <p className="status">Ағымдағы фото: <a href={author.photo_url} target="_blank" rel="noreferrer">ашу</a></p>}
      {uploadError && <p className="form-error">{uploadError}</p>}
      <button type="button" className="button primary" onClick={save} disabled={author.full_name.trim() === ''}>Сақтау</button>
      {saveState === 'saving' && <p className="status">Сақталуда...</p>}
      {saveState === 'saved' && <p className="form-success">Сақталды.</p>}
      {saveState === 'error' && <p className="form-error">Сақтау кезінде қате шықты.</p>}
    </div>
  )
}

export function AdminDashboardPage() {
  const { profile: myProfile } = useAuth()
  const [counts, setCounts] = useState<Record<UserRole, number> | null>(null)
  const [topicCounts, setTopicCounts] = useState<{ draft: number; published: number; archived: number } | null>(null)
  const [status, setStatus] = useState<'loading' | 'ready' | 'error'>('loading')

  const [users, setUsers] = useState<Profile[]>([])
  const [usersStatus, setUsersStatus] = useState<'loading' | 'ready' | 'error'>('loading')
  const [search, setSearch] = useState('')
  const [rowBusy, setRowBusy] = useState<string | null>(null)
  const [rowError, setRowError] = useState<{ id: string; message: string } | null>(null)

  async function loadUsers() {
    setUsersStatus('loading')
    const { data, error } = await supabase.from('profiles').select('*').order('created_at', { ascending: false })
    if (error) { setUsersStatus('error'); return }
    setUsers(data ?? [])
    setUsersStatus('ready')
  }

  useEffect(() => {
    let isMounted = true
    async function load() {
      const { data: profileRows, error: profileError } = await supabase.from('profiles').select('role')
      const { data: topicRows, error: topicError } = await supabase.from('topics').select('status')
      if (!isMounted) return
      if (profileError || topicError) { setStatus('error'); return }

      const roleTally: Record<UserRole, number> = { student: 0, teacher: 0, admin: 0 }
      for (const row of profileRows ?? []) roleTally[row.role as UserRole] += 1
      setCounts(roleTally)

      const statusTally: Record<'draft' | 'published' | 'archived', number> = { draft: 0, published: 0, archived: 0 }
      for (const row of topicRows ?? []) statusTally[row.status as 'draft' | 'published' | 'archived'] += 1
      setTopicCounts(statusTally)

      setStatus('ready')
    }
    load()
    loadUsers()
    return () => { isMounted = false }
  }, [])

  async function changeRole(user: Profile, role: UserRole) {
    if (user.id === myProfile?.id) return
    setRowBusy(user.id)
    setRowError(null)
    const { error } = await supabase.from('profiles').update({ role }).eq('id', user.id)
    setRowBusy(null)
    if (error) { setRowError({ id: user.id, message: 'Рөлді өзгерту сәтсіз аяқталды.' }); return }
    setUsers((prev) => prev.map((u) => (u.id === user.id ? { ...u, role } : u)))
  }

  async function toggleBlocked(user: Profile) {
    if (user.id === myProfile?.id) return
    const nextBlocked = !user.is_blocked
    const message = nextBlocked
      ? `«${user.full_name}» пайдаланушысын бұғаттауды растайсыз ба? Ол жүйеге кіре алмайды.`
      : `«${user.full_name}» пайдаланушысының бұғатын алуды растайсыз ба?`
    if (!window.confirm(message)) return

    setRowBusy(user.id)
    setRowError(null)
    const { error } = await supabase.from('profiles').update({ is_blocked: nextBlocked }).eq('id', user.id)
    setRowBusy(null)
    if (error) { setRowError({ id: user.id, message: 'Бұғаттау күйін өзгерту сәтсіз аяқталды.' }); return }
    setUsers((prev) => prev.map((u) => (u.id === user.id ? { ...u, is_blocked: nextBlocked } : u)))
  }

  const filteredUsers = users.filter((u) => u.full_name.toLowerCase().includes(search.trim().toLowerCase()))

  return (
    <section className="shell section">
      <span className="eyebrow">Басқару</span>
      <h2 style={{ margin: '8px 0 30px' }}>Платформа статистикасы</h2>

      {status === 'loading' && <div className="skeleton-block" style={{ height: 120, borderRadius: 20 }} />}
      {status === 'error' && <div className="empty-state"><b>Дерек жүктелмеді</b><p>Статистиканы жүктеу кезінде қате шықты.</p></div>}

      {status === 'ready' && counts && (
        <div className="stats" style={{ marginBottom: 30 }}>
          <span><b>{counts.student}</b>Оқушы</span>
          <span><b>{counts.teacher}</b>Мұғалім</span>
          <span><b>{counts.admin}</b>Әкімші</span>
        </div>
      )}

      {status === 'ready' && topicCounts && (
        <div className="stats">
          <span><b>{topicCounts.published}</b>Жарияланған тақырып</span>
          <span><b>{topicCounts.draft}</b>Жоба</span>
          <span><b>{topicCounts.archived}</b>Мұрағатталған</span>
        </div>
      )}

      <div className="section-title" style={{ marginTop: 50 }}>
        <h2 style={{ margin: '8px 0 0' }}>Пайдаланушылар</h2>
        <span>{usersStatus === 'ready' ? `${filteredUsers.length} / ${users.length}` : '—'}</span>
      </div>

      <input
        type="search"
        className="search"
        placeholder="Аты бойынша іздеу..."
        value={search}
        onChange={(e) => setSearch(e.target.value)}
      />

      {usersStatus === 'loading' && <div className="skeleton-block" style={{ height: 200, borderRadius: 20 }} />}
      {usersStatus === 'error' && (
        <div className="empty-state">
          <b>Дерек жүктелмеді</b>
          <p>Пайдаланушылар тізімін жүктеу кезінде қате шықты.</p>
        </div>
      )}
      {usersStatus === 'ready' && filteredUsers.length === 0 && (
        <p className="status">Іздеуге сәйкес пайдаланушы табылмады.</p>
      )}

      {usersStatus === 'ready' && filteredUsers.length > 0 && (
        <div className="admin-user-list">
          {filteredUsers.map((u) => {
            const isMe = u.id === myProfile?.id
            const busy = rowBusy === u.id
            return (
              <div key={u.id} className="admin-user-row panel">
                <div className="admin-user-info">
                  <b>{u.full_name || '(аты көрсетілмеген)'}</b>
                  <span className="status" style={{ fontWeight: 400 }}>
                    {u.grade ? `${u.grade}-сынып · ` : ''}{u.school ?? 'мектеп көрсетілмеген'}
                  </span>
                  {u.is_blocked && <span className="badge-blocked">Бұғатталған</span>}
                  {isMe && <span className="status">(бұл — сіз)</span>}
                </div>

                <div className="admin-user-controls">
                  <select
                    value={u.role}
                    disabled={isMe || busy}
                    onChange={(e) => changeRole(u, e.target.value as UserRole)}
                    aria-label={`${u.full_name} рөлі`}
                  >
                    {(Object.keys(ROLE_LABELS) as UserRole[]).map((r) => (
                      <option key={r} value={r}>{ROLE_LABELS[r]}</option>
                    ))}
                  </select>

                  <button
                    type="button"
                    className={u.is_blocked ? 'button secondary' : 'button primary'}
                    disabled={isMe || busy}
                    onClick={() => toggleBlocked(u)}
                  >
                    {u.is_blocked ? 'Бұғатты алу' : 'Бұғаттау'}
                  </button>
                </div>

                {rowError?.id === u.id && <p className="form-error" role="status">{rowError.message}</p>}
              </div>
            )
          })}
        </div>
      )}

      <div className="section-title" style={{ marginTop: 50 }}>
        <h2 style={{ margin: '8px 0 0' }}>Автор профилі</h2>
      </div>
      <AuthorProfileEditor />

      <p style={{ marginTop: 30, color: 'var(--muted)' }}>
        Рөл өзгерту, бұғаттау және автор профилін өңдеу — жоғарыдағы формалар
        арқылы, нақты Supabase-ке жазады. Қауіпсіздік үшін әкімші өз рөлін
        немесе бұғаттау күйін осы жерден өзгерте алмайды — мұны деректер
        базасындағы триггер де тыйым салады.
      </p>
    </section>
  )
}
