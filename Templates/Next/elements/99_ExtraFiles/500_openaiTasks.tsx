/*
path: 500_openaiTasks.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/Next/elements/99_ExtraFiles/500_openaiTasks.tsx
keyPath: elements/99_ExtraFiles/500_openaiTasks.tsx
unique_id: 66iHABNA
*/
// api-lib/openai/tasks.ts
import fs from 'fs'
import path from 'path'
import { getOpenAI, retry } from './index'

type Verdict = 'safe' | 'unsafe' | 'bad' | 'needs_review' | 'error'

export interface ModerationResult {
  verdict: Verdict
  raw?: string // raw model text
  score?: number // optional numeric safety score 0-100
  reason?: string
  fallback?: boolean
  error?: string
}

/**
 * Basic local heuristic fallback for text moderation:
 * if the text contains obvious slurs/urls or "forbidden" words, mark as 'bad'.
 * Keep this minimal — it is only a fallback.
 */
function localTextHeuristic(text: string): ModerationResult {
  const lower = text.toLowerCase()
  const banned = ['fuck', 'pedo', 'terror', 'kill', 'rape', 'child', 'porn']
  if (banned.some((b) => lower.includes(b))) {
    return { verdict: 'bad', reason: 'Local heuristic matched banned word', fallback: true }
  }
  // otherwise unknown -> needs review
  return { verdict: 'needs_review', reason: 'Local heuristic: no obvious match', fallback: true }
}

/**
 * Parse expected model reply like "safe 87% — breve justificación..."
 * This is permissive: will try to extract 'safe'/'unsafe' and percentage.
 */
function parseModelDecision(text: string | undefined): { verdict: Verdict; score?: number; raw?: string; reason?: string } {
  if (!text) return { verdict: 'needs_review', raw: '' }
  const raw = text.trim()
  const lower = raw.toLowerCase()
  const verdict: Verdict = lower.includes('unsafe') || lower.includes('bad') ? 'unsafe' : lower.includes('safe') ? 'safe' : 'needs_review'
  const pctMatch = raw.match(/(\d{1,3})\s*%/)
  const score = pctMatch ? Math.max(0, Math.min(100, Number(pctMatch[1]))) : undefined
  // attempt to capture trailing Spanish justification (short)
  const reason = raw.split(/\r?\n/).slice(0, 2).join(' ').slice(0, 200)
  return { verdict, score, raw, reason }
}

/**
 * moderateImage - Attempts to get a moderation decision from OpenAI.
 * Failover strategy:
 * - Try primary model(s) with retries
 * - If fails, try fallback model name(s)
 * - If still fails, use local heuristic and return needs_review fallback
 */
export async function moderateImage(filePath: string): Promise<ModerationResult> {
  const openai = getOpenAI()
  const b64 = fs.readFileSync(filePath, { encoding: 'base64' })

  const promptText =
    'Analyze the image for nudity, violence, hate speech, smoking, or other sensitive content. Respond with only "safe" or "unsafe" and the percentage of safety you consider (e.g. "safe 98%"). If the score is >= 50% consider it safe. Add a very short, funny Spanish justification after the score.'

  const tryModels = ['gpt-4o-mini', 'gpt-4o-mini-2024', 'gpt-4o', 'gpt-4o-mini-instruct'] // order: preferred -> fallback

  for (let i = 0; i < tryModels.length; i++) {
    const model = tryModels[i]
    try {
      const res = await retry(
        () =>
          openai.chat.completions.create({
            model,
            messages: [
              {
                role: 'user',
                content: [
                  { type: 'text', text: promptText },
                  { type: 'image_url', image_url: { url: `data:image/jpeg;base64,${b64}` } },
                ],
              },
            ],
            max_tokens: 80,
          }),
        3,
        250
      )

      const raw = res.choices?.[0]?.message?.content
      const parsed = parseModelDecision(raw)
      return { verdict: parsed.verdict, raw: parsed.raw, score: parsed.score, reason: parsed.reason, fallback: i > 0 }
    } catch (err: any) {
      // try next model
      // if last model, break to fallback
      if (i === tryModels.length - 1) {
        // continue to fallback below
      }
    }
  }

  // final fallback: local heuristic needs_review
  const heuristic = localTextHeuristic(path.basename(filePath))
  return { ...heuristic, raw: heuristic.reason, error: 'OpenAI image moderation failed; used local heuristic' }
}

/**
 * transcribeAudio - Attempts transcription with retry and fallback model
 */
export async function transcribeAudio(filePath: string, models: string[] = ['gpt-4o-transcribe', 'whisper-1']): Promise<{ text: string; raw?: any }> {
  const openai = getOpenAI()
  for (let i = 0; i < models.length; i++) {
    const model = models[i]
    try {
      const res = await retry(
        () =>
          openai.audio.transcriptions.create({
            model,
            file: fs.createReadStream(filePath),
          }),
        3,
        250
      )
      const text = (res as any).text ?? ''
      return { text, raw: res }
    } catch (err) {
      if (i === models.length - 1) throw err // bubble up — caller will handle fallback
    }
  }
  // unreachable
  throw new Error('transcription failed (unexpected)')
}

/**
 * moderateText - ask model to respond "safe" or "bad"
 * Failover: retry, then local heuristic
 */
export async function moderateText(text: string): Promise<ModerationResult> {
  const openai = getOpenAI()
  const models = ['gpt-4o-mini', 'gpt-4o', 'gpt-4o-mini-2024']
  for (let i = 0; i < models.length; i++) {
    const model = models[i]
    try {
      const res = await retry(
        () =>
          openai.chat.completions.create({
            model,
            messages: [
              { role: 'system', content: 'You are a moderation filter. Reply only "safe" or "bad".' },
              { role: 'user', content: `Evaluate this message: "${text}"` },
            ],
            max_tokens: 3,
          }),
        3,
        200
      )
      const raw = res.choices?.[0]?.message?.content
      const parsed = parseModelDecision(raw)
      // convert "unsafe" -> "bad" for parity with earlier routes
      const verdict = parsed.verdict === 'unsafe' ? 'bad' : parsed.verdict
      return { verdict, raw: parsed.raw, score: parsed.score, reason: parsed.reason, fallback: i > 0 }
    } catch (err) {
      if (i === models.length - 1) {
        // final fallback -> local heuristic
        const heuristic = localTextHeuristic(text)
        return { ...heuristic, error: 'OpenAI text moderation failed; used local heuristic' }
      }
    }
  }
  // safety net
  return { verdict: 'needs_review', reason: 'Unknown error in moderation' }
}