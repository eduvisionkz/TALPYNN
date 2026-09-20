import { createContext, useContext, useEffect, useMemo, useState, type ReactNode } from 'react'
import type { Session, User } from '@supabase/supabase-js'
import { supabase, isSupabaseConfigured } from '@/lib/supabase'
import type { Profile } from '@/types/database'

interface AuthState {
  session: Session | null
  user: User | null
  profile: Profile | null
  loading: boolean
  signUp: (params: { email: string; password: string; fullName: string; grade: number }) => Promise<{ error: string | null; needsEmailConfirmation: boolean }>
  signIn: (params: { email: string; password: string }) => Promise<{ error: string | null }>
  signOut: () => Promise<void>
  refreshProfile: () => Promise<void>
}

const AuthContext = createContext<AuthState | undefined>(undefined)

export function AuthProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null>(null)
  const [profile, setProfile] = useState<Profile | null>(null)
  const [loading, setLoading] = useState(true)

  async function loadProfile(userId: string) {
    const { data, error } = await supabase.from('profiles').select('*').eq('id', userId).single()
    if (error) {
      console.error('Talpyn: профильді жүктеу қатесі', error)
      setProfile(null)
      return
    }
    setProfile(data)
  }

  useEffect(() => {
    // No Supabase project connected (demo/offline mode): never attempt a
    // network call against the placeholder host — auth stays permanently
    // signed-out and the rest of the app falls back to local demo data.
    if (!isSupabaseConfigured) {
      setLoading(false)
      return
    }

    let isMounted = true

    supabase.auth.getSession()
      .then(({ data }) => {
        if (!isMounted) return
        setSession(data.session)
        if (data.session?.user) {
          loadProfile(data.session.user.id).finally(() => isMounted && setLoading(false))
        } else {
          setLoading(false)
        }
      })
      .catch((err) => {
        console.error('Talpyn: сессияны жүктеу қатесі', err)
        if (isMounted) setLoading(false)
      })

    const { data: listener } = supabase.auth.onAuthStateChange((_event, newSession) => {
      setSession(newSession)
      if (newSession?.user) {
        loadProfile(newSession.user.id)
      } else {
        setProfile(null)
      }
    })

    return () => {
      isMounted = false
      listener.subscription.unsubscribe()
    }
  }, [])

  const value = useMemo<AuthState>(
    () => ({
      session,
      user: session?.user ?? null,
      profile,
      loading,
      async signUp({ email, password, fullName, grade }) {
        if (!isSupabaseConfigured) {
          return { error: 'Бұлттық тіркелу өшірулі: Supabase қосылымы теңшелмеген (демо режим).', needsEmailConfirmation: false }
        }
        const { data, error } = await supabase.auth.signUp({
          email,
          password,
          options: { data: { full_name: fullName } },
        })
        if (error) return { error: error.message, needsEmailConfirmation: false }

        // The DB trigger creates the profile with role='student'; we still
        // need to record the grade chosen at sign-up. A user may always
        // update their own profile row, so this is allowed by RLS.
        if (data.user) {
          await supabase.from('profiles').update({ grade }).eq('id', data.user.id)
        }
        return { error: null, needsEmailConfirmation: !data.session }
      },
      async signIn({ email, password }) {
        if (!isSupabaseConfigured) {
          return { error: 'Кіру өшірулі: Supabase қосылымы теңшелмеген (демо режим).' }
        }
        const { error } = await supabase.auth.signInWithPassword({ email, password })
        return { error: error?.message ?? null }
      },
      async signOut() {
        await supabase.auth.signOut()
      },
      async refreshProfile() {
        if (session?.user) await loadProfile(session.user.id)
      },
    }),
    [session, profile, loading]
  )

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

export function useAuth(): AuthState {
  const ctx = useContext(AuthContext)
  if (!ctx) throw new Error('useAuth() must be used inside <AuthProvider>')
  return ctx
}
