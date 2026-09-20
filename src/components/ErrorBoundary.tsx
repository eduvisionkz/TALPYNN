import { Component, type ReactNode } from 'react'

interface ErrorBoundaryProps {
  children: ReactNode
}

interface ErrorBoundaryState {
  error: Error | null
}

/**
 * Catches render-time exceptions anywhere in the tree so a bug in one
 * page (a bad Supabase response shape, a null-pointer in a lesson
 * renderer, etc.) shows a clear Kazakh-language error screen instead of
 * an unexplained blank/white page.
 */
export class ErrorBoundary extends Component<ErrorBoundaryProps, ErrorBoundaryState> {
  state: ErrorBoundaryState = { error: null }

  static getDerivedStateFromError(error: Error): ErrorBoundaryState {
    return { error }
  }

  componentDidCatch(error: Error, info: { componentStack: string }) {
    console.error('Talpyn: күтпеген қате', error, info.componentStack)
  }

  render() {
    if (this.state.error) {
      return (
        <div
          style={{
            minHeight: '100vh',
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            justifyContent: 'center',
            textAlign: 'center',
            padding: '32px 20px',
            gap: 16,
            fontFamily: 'system-ui, sans-serif',
            background: '#f4f9f9',
          }}
        >
          <div style={{ fontSize: 48 }} aria-hidden>⚠️</div>
          <h1 style={{ margin: 0, fontSize: 22, color: '#123b61' }}>Қате шықты</h1>
          <p style={{ maxWidth: 480, color: '#3a5568' }}>
            Бетті көрсету кезінде күтпеген қате шықты. Бұл уақытша ақау болуы мүмкін — бетті
            қайта жүктеп көріңіз. Қате қайталанса, әкімшіге хабарласыңыз.
          </p>
          <button
            type="button"
            onClick={() => { this.setState({ error: null }); window.location.reload() }}
            style={{
              padding: '10px 20px',
              borderRadius: 12,
              border: 'none',
              background: '#0f9aa4',
              color: '#fff',
              fontWeight: 700,
              cursor: 'pointer',
            }}
          >
            Бетті қайта жүктеу
          </button>
        </div>
      )
    }
    return this.props.children
  }
}
