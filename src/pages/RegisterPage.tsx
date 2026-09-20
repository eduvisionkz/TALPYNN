import { SignUpForm } from '@/features/auth/SignUpForm'

export function RegisterPage() {
  return (
    <div className="auth-page">
      <div className="auth-card">
        <h1>Тіркелу</h1>
        <p>Жаңа аккаунт ашып, сыныбыңызды таңдаңыз.</p>
        <SignUpForm />
      </div>
    </div>
  )
}
