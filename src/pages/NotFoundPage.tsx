import { Link } from 'react-router-dom'

export function NotFoundPage() {
  return (
    <div className="shell section empty-state">
      <b>Бет табылмады</b>
      <p>Сұралған бет жоқ немесе жылжытылған.</p>
      <Link className="button primary" to="/">Басты бетке оралу</Link>
    </div>
  )
}
