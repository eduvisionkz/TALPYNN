import { isSupabaseConfigured } from '@/lib/supabase'

/**
 * Shown across the app whenever no Supabase project is connected
 * (VITE_SUPABASE_URL / VITE_SUPABASE_ANON_KEY missing at build/deploy
 * time). The app still renders — the topic catalog falls back to the
 * local `src/data/topics.ts` list — but cloud-dependent features
 * (accounts, saved progress, lesson content itself) are unavailable,
 * and this banner says so plainly instead of failing silently.
 */
export function DemoModeBanner() {
  if (isSupabaseConfigured) return null
  return (
    <div
      role="status"
      style={{
        background: '#fff4d6',
        borderBottom: '1px solid #f0dca0',
        color: '#6b4e00',
        fontSize: 14,
        padding: '10px 20px',
        textAlign: 'center',
      }}
    >
      Демо режим: Supabase қосылымы теңшелмеген. Тақырыптар каталогы жергілікті деректен
      көрсетілуде, бірақ кіру, тіркелу және сабақ мазмұны қолжетімсіз. Толық жұмыс үшін{' '}
      <code>.env</code> файлына <code>VITE_SUPABASE_URL</code> мен{' '}
      <code>VITE_SUPABASE_ANON_KEY</code> қосыңыз.
    </div>
  )
}
