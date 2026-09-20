import { useState, type FormEvent } from 'react'
import { useNavigate, useLocation, Link } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'

export function SignInForm() {
  const { signIn } = useAuth()
  const navigate = useNavigate()
  const location = useLocation()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [status, setStatus] = useState<'idle' | 'loading' | 'error'>('idle')
  const [errorMessage, setErrorMessage] = useState('')

  async function handleSubmit(e: FormEvent) {
    e.preventDefault()
    setStatus('loading')
    const { error } = await signIn({ email, password })
    if (error) {
      setStatus('error')
      setErrorMessage(error === 'Invalid login credentials' ? 'Электрондық пошта немесе құпия сөз қате.' : error)
      return
    }
    setStatus('idle')
    const from = (location.state as { from?: string })?.from
    navigate(from ?? '/', { replace: true })
  }

  return (
    <form className="modal-form" onSubmit={handleSubmit} noValidate>
      <label htmlFor="signin-email">
        Электрондық пошта
        <input id="signin-email" type="email" autoComplete="email" required value={email} onChange={(e) => setEmail(e.target.value)} />
      </label>
      <label htmlFor="signin-password">
        Құпия сөз
        <input id="signin-password" type="password" autoComplete="current-password" required minLength={6} value={password} onChange={(e) => setPassword(e.target.value)} />
      </label>
      {status === 'error' && <p role="alert" className="form-error">{errorMessage}</p>}
      <button className="button primary" type="submit" disabled={status === 'loading'}>
        {status === 'loading' ? 'Кіру...' : 'Кіру'}
      </button>
      <p className="form-switch">
        Тіркелгіңіз жоқ па? <Link to="/register">Тіркелу</Link>
      </p>
    </form>
  )
}
