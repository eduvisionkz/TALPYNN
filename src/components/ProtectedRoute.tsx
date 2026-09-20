import { Navigate, useLocation } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'
import type { UserRole } from '@/types/database'

const ROLE_RANK: Record<UserRole, number> = { student: 0, teacher: 1, admin: 2 }

interface ProtectedRouteProps {
  children: React.ReactNode
  requiredRole?: UserRole
}

export function ProtectedRoute({ children, requiredRole = 'student' }: ProtectedRouteProps) {
  const { session, profile, loading } = useAuth()
  const location = useLocation()

  if (loading) {
    return (
      <div className="shell section" aria-busy="true">
        <div className="skeleton-block" style={{ height: 220, borderRadius: 20 }} />
      </div>
    )
  }

  if (!session) {
    return <Navigate to="/login" state={{ from: location.pathname }} replace />
  }

  if (profile?.is_blocked) {
    return (
      <div className="shell section empty-state">
        <b>Аккаунт бұғатталған</b>
        <p>Толығырақ ақпарат алу үшін әкімшіге хабарласыңыз.</p>
      </div>
    )
  }

  if (profile && ROLE_RANK[profile.role] < ROLE_RANK[requiredRole]) {
    return <Navigate to="/" replace />
  }

  return <>{children}</>
}
