import { useEffect, useRef, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'
import { supabase } from '@/lib/supabase'
import { deleteMaterial, uploadMaterial, FileValidationError, type StorageFolder } from '@/lib/storage'
import type { Material, Topic } from '@/types/database'

const FOLDER_LABELS: Record<StorageFolder, string> = {
  authors: 'Авторлар',
  topics: 'Тақырып мұқабасы',
  infographics: 'Инфографика',
  videos: 'Видео',
  documents: 'Құжаттар',
  mascot: 'Талпын',
}

function formatSize(bytes: number | null) {
  if (!bytes) return ''
  if (bytes < 1024 * 1024) return `${Math.round(bytes / 1024)} КБ`
  return `${(bytes / (1024 * 1024)).toFixed(1)} МБ`
}

export function TeacherMediaPage() {
  const { topicId } = useParams<{ topicId: string }>()
  const { profile } = useAuth()
  const fileInputRef = useRef<HTMLInputElement>(null)

  const [topic, setTopic] = useState<Topic | null>(null)
  const [materials, setMaterials] = useState<Material[]>([])
  const [status, setStatus] = useState<'loading' | 'ready' | 'error' | 'not-found'>('loading')
  const [folder, setFolder] = useState<StorageFolder>('infographics')
  const [title, setTitle] = useState('')
  const [uploadState, setUploadState] = useState<'idle' | 'uploading' | 'error'>('idle')
  const [uploadError, setUploadError] = useState<string | null>(null)
  const [deletingId, setDeletingId] = useState<string | null>(null)
  const [deleteError, setDeleteError] = useState<{ id: string; message: string } | null>(null)

  async function loadMaterials(currentTopicId: string) {
    const { data, error } = await supabase
      .from('materials')
      .select('*')
      .eq('topic_id', currentTopicId)
      .order('created_at', { ascending: false })
    if (error) { setStatus('error'); return }
    setMaterials(data ?? [])
    setStatus('ready')
  }

  useEffect(() => {
    if (!topicId || !profile) return
    let isMounted = true
    async function load() {
      const { data: topicData, error } = await supabase.from('topics').select('*').eq('id', topicId).single()
      if (!isMounted) return
      if (error || !topicData) { setStatus('not-found'); return }
      // Any teacher (not just the topic's author) may add media to any
      // topic — this matters for the 113 built-in topics, which have no
      // individual owner. Deleting someone else's upload is still
      // restricted below (and by RLS) to its own uploader or an admin.
      setTopic(topicData)
      await loadMaterials(topicData.id)
    }
    load()
    return () => { isMounted = false }
  }, [topicId, profile])

  async function handleUpload(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file || !topic || !profile) return
    setUploadState('uploading')
    setUploadError(null)
    try {
      const result = await uploadMaterial(file, folder)
      const { data, error } = await supabase
        .from('materials')
        .insert({
          topic_id: topic.id,
          title: title.trim() || file.name,
          type: result.materialType,
          file_url: result.publicUrl,
          file_path: result.path,
          file_size: file.size,
          mime_type: file.type,
          uploaded_by: profile.id,
        })
        .select('*')
        .single()
      if (error || !data) {
        // The file already landed in storage but the DB row failed —
        // clean it up so it isn't an orphaned, untracked object.
        await deleteMaterial(result.path).catch(() => {})
        throw error ?? new Error('materials insert failed')
      }
      setMaterials((prev) => [data, ...prev])
      setTitle('')
      setUploadState('idle')
      if (fileInputRef.current) fileInputRef.current.value = ''
    } catch (err) {
      setUploadState('error')
      setUploadError(err instanceof FileValidationError ? err.message : 'Файлды жүктеу кезінде қате шықты.')
    }
  }

  async function handleDelete(material: Material) {
    if (!window.confirm(`«${material.title}» файлын өшіруді растайсыз ба? Бұл әрекетті қайтару мүмкін емес.`)) return
    setDeletingId(material.id)
    setDeleteError(null)
    try {
      await deleteMaterial(material.file_path)
      const { error } = await supabase.from('materials').delete().eq('id', material.id)
      if (error) throw error
      setMaterials((prev) => prev.filter((m) => m.id !== material.id))
    } catch {
      setDeleteError({ id: material.id, message: 'Файлды өшіру кезінде қате шықты.' })
    } finally {
      setDeletingId(null)
    }
  }

  if (status === 'not-found') {
    return (
      <section className="shell section">
        <div className="empty-state">
          <b>Тақырып табылмады</b>
          <p>Бұл тақырыпқа медиа файлдарды басқаруға рұқсатыңыз жоқ немесе ол жойылған.</p>
          <Link className="text-button" to="/teacher">Мұғалім кабинетіне оралу</Link>
        </div>
      </section>
    )
  }

  return (
    <section className="shell section">
      <span className="eyebrow">Мұғалім кабинеті</span>
      <div className="section-title">
        <h2 style={{ margin: '8px 0 0' }}>Медиа файлдар — {topic?.title ?? '...'}</h2>
        <Link className="text-button" to="/teacher">← Тақырыптарыма оралу</Link>
      </div>

      {status === 'loading' && <div className="skeleton-block" style={{ height: 200, borderRadius: 20 }} />}
      {status === 'error' && <div className="empty-state"><b>Дерек жүктелмеді</b><p>Медиа файлдар тізімін жүктеу кезінде қате шықты.</p></div>}

      {(status === 'ready') && (
        <>
          <div className="panel" style={{ marginBottom: 24 }}>
            <h3>Жаңа файл жүктеу</h3>
            <label>
              Файл атауы (міндетті емес)
              <input type="text" value={title} onChange={(e) => setTitle(e.target.value)} placeholder="Мысалы: 2-кезеңнің инфографикасы" />
            </label>
            <label>
              Бума
              <select value={folder} onChange={(e) => setFolder(e.target.value as StorageFolder)}>
                {(Object.keys(FOLDER_LABELS) as StorageFolder[]).map((f) => (
                  <option key={f} value={f}>{FOLDER_LABELS[f]}</option>
                ))}
              </select>
            </label>
            <label>
              Файл (JPG, PNG, WebP, SVG, MP4, WebM, MP3 немесе PDF, 25 МБ-қа дейін)
              <input
                ref={fileInputRef}
                type="file"
                accept="image/jpeg,image/png,image/webp,image/svg+xml,video/mp4,video/webm,audio/mpeg,application/pdf"
                disabled={uploadState === 'uploading'}
                onChange={handleUpload}
              />
            </label>
            {uploadState === 'uploading' && <p className="status">Жүктелуде...</p>}
            {uploadState === 'error' && uploadError && <p className="form-error" role="status">{uploadError}</p>}
          </div>

          <h3>Жүктелген файлдар ({materials.length})</h3>
          {materials.length === 0 && <p className="status">Бұл тақырыпта әзірге медиа файл жоқ.</p>}

          {materials.length > 0 && (
            <div className="admin-user-list">
              {materials.map((m) => {
                const canDelete = m.uploaded_by === profile?.id || profile?.role === 'admin'
                return (
                  <div key={m.id} className="admin-user-row panel">
                    <div className="admin-user-info">
                      <b>{m.title}</b>
                      <span className="status" style={{ fontWeight: 400 }}>
                        {m.type} · {formatSize(m.file_size)} · {new Date(m.created_at).toLocaleDateString('kk-KZ')}
                        {!canDelete && ' · басқа мұғалім жүктеген'}
                      </span>
                      <a href={m.file_url} target="_blank" rel="noreferrer" className="text-button">Файлды ашу</a>
                    </div>
                    <div className="admin-user-controls">
                      <button
                        type="button"
                        className="button secondary"
                        disabled={deletingId === m.id || !canDelete}
                        title={canDelete ? undefined : 'Тек жүктеген мұғалім немесе әкімші өшіре алады'}
                        onClick={() => handleDelete(m)}
                      >
                        {deletingId === m.id ? 'Өшірілуде...' : 'Өшіру'}
                      </button>
                    </div>
                    {deleteError?.id === m.id && <p className="form-error" role="status">{deleteError.message}</p>}
                  </div>
                )
              })}
            </div>
          )}
        </>
      )}
    </section>
  )
}
