import { useState } from 'react'
import { NumberBuilder } from './NumberBuilder'
import { TalpynGuide } from './TalpynGuide'

interface QurastyrStageProps {
  total: number
  startLeft: number
  onDone: () => void
}

export function QurastyrStage({ total, startLeft, onDone }: QurastyrStageProps) {
  const [touched, setTouched] = useState(false)

  return (
    <div>
      <TalpynGuide state={touched ? 'success' : 'pointing'} />
      <NumberBuilder total={total} startLeft={startLeft} onChange={() => setTouched(true)} />
      <div className="actions">
        <button type="button" className="button primary" onClick={onDone} disabled={!touched}>
          {touched ? 'Келесі кезеңге өту' : 'Алдымен санды өзгертіп көр'}
        </button>
      </div>
    </div>
  )
}
