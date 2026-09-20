import { supabase } from '@/lib/supabase'
import type { MaterialType } from '@/types/database'

const BUCKET = 'materials'
const MAX_FILE_SIZE = 25 * 1024 * 1024 // 25 MB, matches the storage bucket limit

const ALLOWED_MIME: Record<string, MaterialType> = {
  'image/jpeg': 'image',
  'image/png': 'image',
  'image/webp': 'image',
  'image/svg+xml': 'image',
  'video/mp4': 'video',
  'video/webm': 'video',
  'audio/mpeg': 'audio',
  'application/pdf': 'pdf',
}

export type StorageFolder = 'authors' | 'topics' | 'infographics' | 'videos' | 'documents' | 'mascot'

export interface UploadResult {
  path: string
  publicUrl: string
  materialType: MaterialType
}

export class FileValidationError extends Error {}

/** Validates type/size, then uploads to the given folder with a cache-busting name. */
export async function uploadMaterial(file: File, folder: StorageFolder): Promise<UploadResult> {
  const materialType = ALLOWED_MIME[file.type]
  if (!materialType) {
    throw new FileValidationError('Бұл файл түріне рұқсат жоқ. JPG, PNG, WebP, SVG, MP4, WebM, MP3 немесе PDF жүктеңіз.')
  }
  if (file.size > MAX_FILE_SIZE) {
    throw new FileValidationError('Файл өлшемі 25 МБ-тан аспауы керек.')
  }

  // A random, content-independent suffix guarantees a new public URL each
  // time — this is what stops a replaced author photo from being served
  // from the browser or CDN cache under the old URL.
  const ext = file.name.split('.').pop() ?? 'bin'
  const uniqueName = `${crypto.randomUUID()}.${ext}`
  const path = `${folder}/${uniqueName}`

  const { error } = await supabase.storage.from(BUCKET).upload(path, file, {
    cacheControl: '3600',
    upsert: false,
  })
  if (error) throw error

  const { data } = supabase.storage.from(BUCKET).getPublicUrl(path)
  return { path, publicUrl: data.publicUrl, materialType }
}

export async function deleteMaterial(path: string): Promise<void> {
  const { error } = await supabase.storage.from(BUCKET).remove([path])
  if (error) throw error
}
