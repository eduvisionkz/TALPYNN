import type { Progress } from '@/types/database'

// --- Sound effects -----------------------------------------------------
// Short tones synthesized in the browser with the Web Audio API — no
// external audio files are generated or shipped, only a couple of
// oscillator beeps triggered on a genuine user action (clicking
// "Тексеру"/"Аяқтау"), which satisfies browsers' autoplay rules.

const SOUND_PREF_KEY = 'talpyn_sound_enabled'

export function isSoundEnabled(): boolean {
  try {
    return localStorage.getItem(SOUND_PREF_KEY) !== 'off'
  } catch {
    return true
  }
}

export function setSoundEnabled(enabled: boolean): void {
  try {
    localStorage.setItem(SOUND_PREF_KEY, enabled ? 'on' : 'off')
  } catch {
    // localStorage may be unavailable (private mode) — sound preference just won't persist.
  }
}

let sharedAudioContext: AudioContext | null = null
function getAudioContext(): AudioContext | null {
  if (typeof window === 'undefined') return null
  const Ctor = window.AudioContext ?? (window as unknown as { webkitAudioContext?: typeof AudioContext }).webkitAudioContext
  if (!Ctor) return null
  if (!sharedAudioContext) sharedAudioContext = new Ctor()
  if (sharedAudioContext.state === 'suspended') sharedAudioContext.resume().catch(() => {})
  return sharedAudioContext
}

function playTone(frequencies: number[], durationMs: number, type: OscillatorType = 'sine') {
  if (!isSoundEnabled()) return
  const ctx = getAudioContext()
  if (!ctx) return
  const now = ctx.currentTime
  frequencies.forEach((freq, i) => {
    const osc = ctx.createOscillator()
    const gain = ctx.createGain()
    osc.type = type
    osc.frequency.value = freq
    const start = now + i * (durationMs / 1000)
    gain.gain.setValueAtTime(0.0001, start)
    gain.gain.exponentialRampToValueAtTime(0.18, start + 0.02)
    gain.gain.exponentialRampToValueAtTime(0.0001, start + durationMs / 1000)
    osc.connect(gain)
    gain.connect(ctx.destination)
    osc.start(start)
    osc.stop(start + durationMs / 1000 + 0.02)
  })
}

/** A short, bright blip for a correct answer. */
export function playCorrectSound(): void {
  playTone([880, 1175], 130)
}

/** A gentle low tone for a wrong answer — not harsh, just a nudge to try again. */
export function playIncorrectSound(): void {
  playTone([220], 160, 'triangle')
}

/** A short ascending chime for finishing a whole topic. */
export function playSuccessFanfare(): void {
  playTone([523, 659, 784, 1046], 150)
}

/** A slightly brighter chime for reaching a new level. */
export function playLevelUpFanfare(): void {
  playTone([659, 784, 988, 1318, 1568], 130)
}

// --- Streak --------------------------------------------------------------

function toLocalDateKey(iso: string): string {
  const d = new Date(iso)
  return `${d.getFullYear()}-${d.getMonth()}-${d.getDate()}`
}

/**
 * Counts consecutive calendar days (up to and including today or
 * yesterday) on which the student completed at least one topic, based on
 * `progress.completed_at`. Purely derived from existing data — no extra
 * table is needed to track streaks.
 */
export function computeStreak(progressRows: Pick<Progress, 'completed' | 'completed_at'>[]): number {
  const completedDates = progressRows.filter((p) => p.completed && p.completed_at).map((p) => new Date(p.completed_at as string))
  if (completedDates.length === 0) return 0

  const dateKeys = new Set(completedDates.map((d) => `${d.getFullYear()}-${d.getMonth()}-${d.getDate()}`))
  const today = new Date()
  const cursor = new Date(today.getFullYear(), today.getMonth(), today.getDate())

  // The streak can start today or, if nothing was done today yet, yesterday.
  if (!dateKeys.has(toLocalDateKey(cursor.toISOString()))) {
    cursor.setDate(cursor.getDate() - 1)
    if (!dateKeys.has(toLocalDateKey(cursor.toISOString()))) return 0
  }

  let streak = 0
  while (dateKeys.has(`${cursor.getFullYear()}-${cursor.getMonth()}-${cursor.getDate()}`)) {
    streak += 1
    cursor.setDate(cursor.getDate() - 1)
  }
  return streak
}

// --- Levels ----------------------------------------------------------------

export interface LevelInfo {
  level: number
  title: string
  completedForCurrent: number
  completedForNext: number | null
}

const LEVEL_TITLES = ['Іздеуші', 'Талпынушы', 'Жас барыс', 'Шебер барыс', 'Тау патшасы']
const TOPICS_PER_LEVEL = 5

/** A simple, honest level ladder driven by completed-topic count — five named levels, then numbered ones. */
export function computeLevel(completedCount: number): LevelInfo {
  const levelIndex = Math.floor(completedCount / TOPICS_PER_LEVEL)
  const level = levelIndex + 1
  const title = LEVEL_TITLES[levelIndex] ?? `${level}-деңгей барыс`
  return {
    level,
    title,
    completedForCurrent: levelIndex * TOPICS_PER_LEVEL,
    completedForNext: (levelIndex + 1) * TOPICS_PER_LEVEL,
  }
}
