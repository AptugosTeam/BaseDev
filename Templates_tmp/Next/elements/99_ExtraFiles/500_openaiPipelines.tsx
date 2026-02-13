/*
path: 500_openaiPipelines.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/Next/elements/99_ExtraFiles/500_openaiPipelines.tsx
keyPath: elements/99_ExtraFiles/500_openaiPipelines.tsx
unique_id: 0XuPWTiK
*/
// api-lib/openai/pipelines.ts
import { moderateImage, transcribeAudio, moderateText, ModerationResult } from './tasks'

export async function analyzeImagePipeline(filePath: string): Promise<ModerationResult> {
  // returns result with verdict: safe | unsafe | needs_review etc.
  return moderateImage(filePath)
}

export async function analyzeAudioPipeline(filePath: string): Promise<{ moderation: ModerationResult; transcription?: string; error?: string }> {
  try {
    const { text } = await transcribeAudio(filePath)
    const moderation = await moderateText(text.toLowerCase())
    return { moderation, transcription: text }
  } catch (err: any) {
    // If transcription failed, escalate to needs_review
    return { moderation: { verdict: 'needs_review', reason: 'Transcription failed', error: err?.message ?? String(err) }, error: err?.message }
  }
}