import { useState } from 'react'
import { TalpynGuide } from './TalpynGuide'

interface ClockStageProps {
  hour: number // 1–12
  minute: 0 | 15 | 30 | 45
  prompt: string
  onDone: () => void
}

const MINUTE_LABEL: Record<number, string> = { 0: '00', 15: '15', 30: '30', 45: '45' }

/**
 * "Сағат циферблаты": the student first clicks the correct hour position on
 * an SVG clock face, then the correct quarter-hour minute mark — two real
 * clicks on the dial rather than a single multiple-choice guess.
 */
export function ClockStage({ hour, minute, prompt, onDone }: ClockStageProps) {
  const [pickedHour, setPickedHour] = useState<number | null>(null)
  const [pickedMinute, setPickedMinute] = useState<number | null>(null)
  const [checked, setChecked] = useState(false)

  const hourDone = pickedHour !== null
  const isCorrect = pickedHour === hour && pickedMinute === minute
  const canCheck = pickedHour !== null && pickedMinute !== null

  const cx = 100
  const cy = 100
  const r = 82

  const hourHandAngle = ((hour % 12) + minute / 60) * 30 - 90
  const minuteHandAngle = (minute / 60) * 360 - 90

  return (
    <div>
      <TalpynGuide state={checked && isCorrect ? 'success' : 'thinking'} />
      <h3>{prompt}</h3>
      <p className="status">Сағат тілдері {hour}:{MINUTE_LABEL[minute]} уақытын көрсетеді.</p>

      <div style={{ display: 'flex', gap: 30, flexWrap: 'wrap', alignItems: 'center', justifyContent: 'center' }}>
        <svg viewBox="0 0 200 200" width={200} height={200} role="img" aria-label="Сағат циферблаты">
          <circle cx={cx} cy={cy} r={r} fill="#fff" stroke="#dbe7e9" strokeWidth={4} />
          {Array.from({ length: 12 }, (_, i) => i + 1).map((h) => {
            const angle = (h * 30 - 90) * (Math.PI / 180)
            const x = cx + Math.cos(angle) * (r - 20)
            const y = cy + Math.sin(angle) * (r - 20)
            return (
              <text key={h} x={x} y={y + 5} textAnchor="middle" fontSize={13} fontWeight={800} fill="#123b61">{h}</text>
            )
          })}
          <line
            x1={cx} y1={cy}
            x2={cx + Math.cos((hourHandAngle * Math.PI) / 180) * (r - 42)}
            y2={cy + Math.sin((hourHandAngle * Math.PI) / 180) * (r - 42)}
            stroke="#123b61" strokeWidth={5} strokeLinecap="round"
          />
          <line
            x1={cx} y1={cy}
            x2={cx + Math.cos((minuteHandAngle * Math.PI) / 180) * (r - 16)}
            y2={cy + Math.sin((minuteHandAngle * Math.PI) / 180) * (r - 16)}
            stroke="#18b5ba" strokeWidth={3} strokeLinecap="round"
          />
          <circle cx={cx} cy={cy} r={4} fill="#123b61" />
        </svg>

        <div>
          <p style={{ fontWeight: 800, fontSize: 13, margin: '0 0 8px' }}>1. Сағатын таңда</p>
          <div className="answers" style={{ flexWrap: 'wrap', maxWidth: 260 }}>
            {Array.from({ length: 12 }, (_, i) => i + 1).map((h) => (
              <button
                key={h}
                type="button"
                disabled={checked && isCorrect}
                onClick={() => { setPickedHour(h); setChecked(false) }}
                style={{
                  width: 40, height: 40,
                  background: pickedHour === h ? 'var(--cyan)' : undefined,
                  color: pickedHour === h ? '#fff' : undefined,
                }}
              >
                {h}
              </button>
            ))}
          </div>

          {hourDone && (
            <>
              <p style={{ fontWeight: 800, fontSize: 13, margin: '16px 0 8px' }}>2. Минутын таңда</p>
              <div className="answers">
                {[0, 15, 30, 45].map((m) => (
                  <button
                    key={m}
                    type="button"
                    disabled={checked && isCorrect}
                    onClick={() => { setPickedMinute(m); setChecked(false) }}
                    style={{
                      background: pickedMinute === m ? 'var(--cyan)' : undefined,
                      color: pickedMinute === m ? '#fff' : undefined,
                    }}
                  >
                    {MINUTE_LABEL[m]}
                  </button>
                ))}
              </div>
            </>
          )}
        </div>
      </div>

      {checked && (
        <p className={isCorrect ? 'form-success' : 'form-error'} role="status">
          {isCorrect ? 'Дұрыс!' : 'Әлі дұрыс емес — сағат тілдерін қайта қара.'}
        </p>
      )}

      <div className="actions">
        {!isCorrect ? (
          <button type="button" className="button primary" disabled={!canCheck} onClick={() => setChecked(true)}>
            Тексеру
          </button>
        ) : (
          <button type="button" className="button primary" onClick={onDone}>
            Келесі кезеңге өту
          </button>
        )}
      </div>
    </div>
  )
}
