import { Link, NavLink, Outlet, useLocation } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'
import { DemoModeBanner } from '@/components/DemoModeBanner'

const NAV_ITEMS = [
  { to: '/topics', label: 'Тақырыптар' },
  { to: '/methodology', label: 'Әдістеме' },
  { to: '/author', label: 'Автор туралы' },
]

// Mirrors the desktop topbar nav for small screens, where the topbar's
// own <nav> is hidden (см. @media(max-width:900px) in global.css) —
// without this, mobile users previously had no way to navigate at all
// besides the browser back button.
const MOBILE_NAV_ITEMS = [
  { to: '/', icon: '🏠', label: 'Басты', end: true },
  { to: '/topics', icon: '📚', label: 'Тақырып' },
  { to: '/methodology', icon: '🧭', label: 'Әдістеме' },
]

export function MainLayout() {
  const { session, profile, signOut } = useAuth()
  const location = useLocation()

  const profileMobileItem =
    profile?.role === 'teacher' ? { to: '/teacher', icon: '🧑‍🏫', label: 'Мұғалім' } :
    profile?.role === 'admin' ? { to: '/admin', icon: '⚙️', label: 'Басқару' } :
    profile?.role === 'student' ? { to: '/profile', icon: '👤', label: 'Кабинетім' } :
    { to: '/login', icon: '🔑', label: 'Кіру' }

  return (
    <>
      <DemoModeBanner />
      <header className="topbar">
        <Link to="/" className="brand">
          <span className="brand-mark" aria-hidden="true">T</span>
          Talpyn
        </Link>
        <nav aria-label="Негізгі шарлау">
          {NAV_ITEMS.map((item) => (
            <NavLink key={item.to} to={item.to}>{item.label}</NavLink>
          ))}
          {profile?.role === 'teacher' && <NavLink to="/teacher">Мұғалім кабинеті</NavLink>}
          {profile?.role === 'admin' && <NavLink to="/admin">Басқару</NavLink>}
          {profile?.role === 'student' && <NavLink to="/profile">Кабинетім</NavLink>}
        </nav>
        {session ? (
          <button className="user-button" onClick={() => signOut()}>Шығу</button>
        ) : (
          <Link className="user-button" to="/login">Кіру</Link>
        )}
      </header>

      <main id="main-content">
        <div key={location.pathname} className="page-transition">
          <Outlet />
        </div>
      </main>

      <nav className="mobile-bottom-nav" aria-label="Мобильді шарлау">
        {MOBILE_NAV_ITEMS.map((item) => (
          <NavLink key={item.to} to={item.to} end={item.end}>
            <span aria-hidden>{item.icon}</span>
            <span>{item.label}</span>
          </NavLink>
        ))}
        <NavLink to={profileMobileItem.to}>
          <span aria-hidden>{profileMobileItem.icon}</span>
          <span>{profileMobileItem.label}</span>
        </NavLink>
      </nav>

      <footer>
        <div className="shell">
          <span><b>Talpyn</b> — бастауыш сынып математикасына арналған авторлық білім беру платформасы</span>
          <span>© {new Date().getFullYear()}</span>
        </div>
      </footer>
    </>
  )
}
