import { SignInForm } from '@/features/auth/SignInForm'

export function LoginPage() {
  return (
    <div className="auth-page">
      <div className="auth-card">
        <h1>Жүйеге кіру</h1>
        <p>Оқуды жалғастыру үшін аккаунтыңызға кіріңіз.</p>
        <SignInForm />
      </div>
    </div>
  )
}
