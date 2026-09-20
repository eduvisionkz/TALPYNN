import { useState, type FormEvent } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'

export function SignUpForm() {
  const { signUp } = useAuth()
  const [fullName, setFullName] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [grade, setGrade] = useState<'1' | '2' | '3' | '4'>('1')
  const [status, setStatus] = useState<'idle' | 'loading' | 'error' | 'success'>('idle')
  const [errorMessage, setErrorMessage] = useState('')
  const [needsEmailConfirmation, setNeedsEmailConfirmation] = useState(false)

  async function handleSubmit(e: FormEvent) {
    e.preventDefault()
    setStatus('loading')
    const { error, needsEmailConfirmation: needsConfirm } = await signUp({ email, password, fullName, grade: Number(grade) })
    if (error) {
      setStatus('error')
      setErrorMessage(error === 'User already registered' ? 'Бұл электрондық пошта бұрын тіркелген.' : error)
      return
    }
    setStatus('success')
    setNeedsEmailConfirmation(needsConfirm)
  }

  if (status === 'success') {
    return (
      <p className="form-success">
        {needsEmailConfirmation
          ? 'Тіркелу сәтті өтті. Электрондық поштаңызды растаңыз, содан кейін жүйеге кіре аласыз.'
          : 'Тіркелу сәтті өтті. Енді жүйеге кіре аласыз.'}
      </p>
    )
  }

  return (
    <form className="modal-form" onSubmit={handleSubmit} noValidate>
      <label htmlFor="signup-name">
        Аты-жөні
        <input id="signup-name" type="text" autoComplete="name" required value={fullName} onChange={(e) => setFullName(e.target.value)} />
      </label>
      <label htmlFor="signup-email">
        Электрондық пошта
        <input id="signup-email" type="email" autoComplete="email" required value={email} onChange={(e) => setEmail(e.target.value)} />
      </label>
      <label htmlFor="signup-password">
        Құпия сөз
        <input id="signup-password" type="password" autoComplete="new-password" required minLength={6} value={password} onChange={(e) => setPassword(e.target.value)} />
      </label>
      <label htmlFor="signup-grade">
        Сынып
        <select id="signup-grade" value={grade} onChange={(e) => setGrade(e.target.value as typeof grade)}>
          <option value="1">1-сынып</option>
          <option value="2">2-сынып</option>
          <option value="3">3-сынып</option>
          <option value="4">4-сынып</option>
        </select>
      </label>
      {status === 'error' && <p role="alert" className="form-error">{errorMessage}</p>}
      <button className="button primary" type="submit" disabled={status === 'loading'}>
        {status === 'loading' ? 'Тіркелу...' : 'Тіркелу'}
      </button>
      <p className="form-switch">
        Тіркелгіңіз бар ма? <Link to="/login">Кіру</Link>
      </p>
    </form>
  )
}
