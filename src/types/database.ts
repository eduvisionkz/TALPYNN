// Mirrors supabase/migrations/0001_schema.sql. Regenerate from a live
// project with the Supabase CLI once one exists:
//   npx supabase gen types typescript --project-id <id> > src/types/database.ts

export type UserRole = 'student' | 'teacher' | 'admin'
export type Track = 'base' | 'logic'
export type TopicStatus = 'draft' | 'published' | 'archived'
export type LessonStage = 'kor' | 'qurastyr' | 'tusindir' | 'qoldan' | 'bekit'

export type BlockType =
  | 'text' | 'image' | 'infographic' | 'video' | 'audio' | 'pdf'
  | 'question' | 'multiple_choice' | 'matching' | 'ordering' | 'drag_drop'
  | 'number_builder' | 'short_answer' | 'explanation' | 'hint'

export type QuestionType =
  | 'multiple_choice' | 'matching' | 'ordering' | 'drag_drop'
  | 'number_builder' | 'short_answer' | 'number_line' | 'balance_scale'
  | 'clock' | 'money' | 'measurement' | 'expression_builder' | 'find_error'

export type MaterialType = 'image' | 'video' | 'audio' | 'pdf' | 'other'

export interface Profile {
  id: string
  full_name: string
  role: UserRole
  grade: number | null
  avatar_url: string | null
  school: string | null
  is_blocked: boolean
  created_at: string
  updated_at: string
}

export interface Section {
  id: string
  grade: number
  track: Track
  title: string
  description: string | null
  sort_order: number
  published: boolean
  created_by: string | null
  created_at: string
  updated_at: string
}

export interface Topic {
  id: string
  section_id: string | null
  grade: number
  track: Track
  title: string
  description: string | null
  learning_objective: string | null
  cover_url: string | null
  status: TopicStatus
  sort_order: number
  created_by: string | null
  created_at: string
  updated_at: string
}

export interface LessonBlock {
  id: string
  topic_id: string
  stage: LessonStage
  block_type: BlockType
  title: string | null
  content: string | null
  media_url: string | null
  configuration: Record<string, unknown>
  sort_order: number
  created_at: string
  updated_at: string
}

export interface Question {
  id: string
  lesson_block_id: string
  question_text: string
  question_type: QuestionType
  correct_answer: unknown
  explanation: string | null
  hint: string | null
  points: number
  created_at: string
}

export interface QuestionOption {
  id: string
  question_id: string
  option_text: string | null
  option_media_url: string | null
  is_correct: boolean
  sort_order: number
}

export interface Progress {
  id: string
  user_id: string
  topic_id: string
  current_stage: LessonStage
  percent: number
  score: number
  completed: boolean
  started_at: string
  completed_at: string | null
  updated_at: string
}

export interface Attempt {
  id: string
  user_id: string
  topic_id: string
  question_id: string
  answer: unknown
  is_correct: boolean
  points: number
  created_at: string
}

export interface Material {
  id: string
  topic_id: string
  title: string
  type: MaterialType
  file_url: string
  file_path: string
  file_size: number | null
  mime_type: string | null
  uploaded_by: string | null
  created_at: string
}

export interface Achievement {
  id: string
  code: string
  title: string
  description: string | null
  icon_url: string | null
  condition: Record<string, unknown>
}

export interface UserAchievement {
  id: string
  user_id: string
  achievement_id: string
  awarded_at: string
}

export interface Favorite {
  user_id: string
  topic_id: string
  created_at: string
}

export interface AuthorProfile {
  id: string
  full_name: string
  bio: string | null
  workplace: string | null
  position: string | null
  category: string | null
  experience_years: number | null
  education: string | null
  photo_url: string | null
  updated_at: string
}

// supabase-js's generic client requires each table entry to carry a
// `Relationships` array (even if empty) or its type inference for
// .insert()/.update()/.select() silently collapses to `never`.
type Rel = { foreignKeyName: string; columns: string[]; referencedRelation: string; referencedColumns: string[] }[]

export interface Database {
  public: {
    Tables: {
      profiles: { Row: Profile; Insert: Partial<Profile> & { id: string }; Update: Partial<Profile>; Relationships: Rel }
      sections: { Row: Section; Insert: Partial<Section>; Update: Partial<Section>; Relationships: Rel }
      topics: { Row: Topic; Insert: Partial<Topic>; Update: Partial<Topic>; Relationships: Rel }
      lesson_blocks: { Row: LessonBlock; Insert: Partial<LessonBlock>; Update: Partial<LessonBlock>; Relationships: Rel }
      questions: { Row: Question; Insert: Partial<Question>; Update: Partial<Question>; Relationships: Rel }
      question_options: { Row: QuestionOption; Insert: Partial<QuestionOption>; Update: Partial<QuestionOption>; Relationships: Rel }
      progress: { Row: Progress; Insert: Partial<Progress>; Update: Partial<Progress>; Relationships: Rel }
      attempts: { Row: Attempt; Insert: Partial<Attempt>; Update: Partial<Attempt>; Relationships: Rel }
      materials: { Row: Material; Insert: Partial<Material>; Update: Partial<Material>; Relationships: Rel }
      achievements: { Row: Achievement; Insert: Partial<Achievement>; Update: Partial<Achievement>; Relationships: Rel }
      user_achievements: { Row: UserAchievement; Insert: Partial<UserAchievement>; Update: Partial<UserAchievement>; Relationships: Rel }
      favorites: { Row: Favorite; Insert: Partial<Favorite>; Update: Partial<Favorite>; Relationships: Rel }
      author_profile: { Row: AuthorProfile; Insert: Partial<AuthorProfile>; Update: Partial<AuthorProfile>; Relationships: Rel }
    }
    Views: Record<string, never>
    Functions: Record<string, never>
    Enums: Record<string, never>
    CompositeTypes: Record<string, never>
  }
}
