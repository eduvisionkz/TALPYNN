import { supabase } from './supabase'
import type { Achievement } from '@/types/database'

// Achievement conditions are small, JSON-encoded rules (see
// supabase/migrations/0005_seed_achievements.sql) evaluated here on the
// client rather than in the database, so a teacher/admin can add a new
// achievement row without writing SQL — they only need a condition shape
// this evaluator already understands.
type AchievementCondition =
  | { type: 'topics_completed'; count: number }
  | { type: 'topic_percent'; percent: number }

function isKnownCondition(value: unknown): value is AchievementCondition {
  if (!value || typeof value !== 'object') return false
  const v = value as Record<string, unknown>
  if (v.type === 'topics_completed') return typeof v.count === 'number'
  if (v.type === 'topic_percent') return typeof v.percent === 'number'
  return false
}

/**
 * Called after a student finishes a topic (percent = 100, completed = true
 * in `progress`). Checks every achievement the student hasn't already
 * earned against their current `progress` history, and inserts a
 * `user_achievements` row for each newly-satisfied one.
 *
 * Returns the achievements newly awarded this call, so the caller can show
 * a small celebratory message — never throws; a failure here should never
 * break the lesson-completion flow.
 */
export async function evaluateAndAwardAchievements(userId: string): Promise<Achievement[]> {
  try {
    const [{ data: achievements }, { data: earned }, { data: progressRows }] = await Promise.all([
      supabase.from('achievements').select('*'),
      supabase.from('user_achievements').select('achievement_id').eq('user_id', userId),
      supabase.from('progress').select('percent, completed').eq('user_id', userId),
    ])
    if (!achievements) return []

    const earnedIds = new Set((earned ?? []).map((r) => r.achievement_id))
    const completedRows = (progressRows ?? []).filter((r) => r.completed)
    const topicsCompleted = completedRows.length
    const bestPercent = completedRows.reduce((max, r) => Math.max(max, r.percent ?? 0), 0)

    const newlyAwarded: Achievement[] = []
    for (const achievement of achievements) {
      if (earnedIds.has(achievement.id)) continue
      const condition = achievement.condition
      if (!isKnownCondition(condition)) continue

      const satisfied =
        (condition.type === 'topics_completed' && topicsCompleted >= condition.count) ||
        (condition.type === 'topic_percent' && bestPercent >= condition.percent)
      if (!satisfied) continue

      const { error } = await supabase
        .from('user_achievements')
        .insert({ user_id: userId, achievement_id: achievement.id })
      if (!error) newlyAwarded.push(achievement)
    }
    return newlyAwarded
  } catch (err) {
    console.error('Talpyn: жетістіктерді бағалау қатесі', err)
    return []
  }
}
