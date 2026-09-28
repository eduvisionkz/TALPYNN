import { TalpynGuide } from './TalpynGuide'

interface VideoStageProps {
  videoUrl: string
  caption: string
  onDone: () => void
}

/**
 * Extracts a YouTube video id from any common URL shape (watch, youtu.be,
 * shorts, embed) so we can build a privacy-friendly embed src. Returns
 * null if the URL isn't a recognisable YouTube link — the caller then
 * falls back to a plain link instead of trying to embed it.
 */
function youtubeEmbedUrl(url: string): string | null {
  try {
    const u = new URL(url)
    let id: string | null = null
    if (u.hostname.includes('youtu.be')) {
      id = u.pathname.slice(1)
    } else if (u.pathname.startsWith('/shorts/')) {
      id = u.pathname.replace('/shorts/', '')
    } else if (u.pathname.startsWith('/embed/')) {
      id = u.pathname.replace('/embed/', '')
    } else if (u.searchParams.has('v')) {
      id = u.searchParams.get('v')
    }
    id = id?.split('?')[0]?.split('/')[0] ?? null
    return id ? `https://www.youtube-nocookie.com/embed/${id}` : null
  } catch {
    return null
  }
}

/** A short educational video embedded in the Көр (explore) stage. */
export function VideoStage({ videoUrl, caption, onDone }: VideoStageProps) {
  const embedUrl = youtubeEmbedUrl(videoUrl)

  return (
    <div>
      <TalpynGuide state="greeting" className="talpyn-guide--story" />
      {embedUrl ? (
        <div style={{ position: 'relative', width: '100%', maxWidth: 420, aspectRatio: '9 / 16', margin: '0 auto', borderRadius: 16, overflow: 'hidden', background: '#000' }}>
          <iframe
            src={embedUrl}
            title={caption}
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowFullScreen
            style={{ position: 'absolute', inset: 0, width: '100%', height: '100%', border: 0 }}
          />
        </div>
      ) : (
        <p className="status">Видео сілтемесі жарамсыз: <a href={videoUrl} target="_blank" rel="noreferrer">{videoUrl}</a></p>
      )}
      <p style={{ fontSize: 16, lineHeight: 1.5, marginTop: 12 }}>{caption}</p>
      <div className="actions">
        <button type="button" className="button primary" onClick={onDone}>Келесі кезеңге өту</button>
      </div>
    </div>
  )
}
