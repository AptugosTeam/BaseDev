/*
path: 500_openaiIndex.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/Next/elements/99_ExtraFiles/500_openaiIndex.tsx
keyPath: elements/99_ExtraFiles/500_openaiIndex.tsx
unique_id: Nc4Ese1F
*/
import OpenAI from 'openai'

let client: OpenAI | null = null

export function getOpenAI(): OpenAI {
  if (!client) {
    const apiKey = '{{ element.values.openAIKey }}'
    if (!apiKey) throw new Error('OPENAI_API_KEY not set')
    client = new OpenAI({ apiKey })
  }
  return client
}

export async function retry<T>(
  fn: () => Promise<T>,
  attempts = 3,
  initialDelayMs = 250
): Promise<T> {
  let attempt = 0
  let delay = initialDelayMs
  while (true) {
    try {
      return await fn()
    } catch (err) {
      attempt++
      if (attempt >= attempts) throw err
      // eslint-disable-next-line no-await-in-loop
      await new Promise((r) => setTimeout(r, delay))
      delay *= 2
    }
  }
}