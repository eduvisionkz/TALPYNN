import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom'
import App from '@/App'
import { AuthProvider } from '@/hooks/useAuth'
import { ErrorBoundary } from '@/components/ErrorBoundary'
import '@/styles/global.css'

// Guard against an unhandled promise rejection (a failed Supabase call
// with no .catch, a bad JSON response, etc.) silently doing nothing —
// at minimum this leaves a clear trace in the console for diagnosis
// instead of a page that just quietly never finishes loading.
window.addEventListener('unhandledrejection', (event) => {
  console.error('Talpyn: өңделмеген promise қатесі', event.reason)
})

const rootElement = document.getElementById('root')
if (!rootElement) {
  throw new Error('Talpyn: #root элементі табылмады.')
}

createRoot(rootElement).render(
  <StrictMode>
    <ErrorBoundary>
      <BrowserRouter>
        <AuthProvider>
          <App />
        </AuthProvider>
      </BrowserRouter>
    </ErrorBoundary>
  </StrictMode>
)
