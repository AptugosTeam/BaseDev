/*
path: 500_openaiMiddleware.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/Next/elements/99_ExtraFiles/500_openaiMiddleware.tsx
keyPath: elements/99_ExtraFiles/500_openaiMiddleware.tsx
unique_id: i6fOXCzd
*/
import { NextApiRequest, NextApiResponse } from 'next'
import { analyzeImagePipeline, analyzeAudioPipeline } from './pipelines'

export function openAIMiddleware() {
  return async (req: NextApiRequest & { ai?: any }, res: NextApiResponse, next: any) => {
    req.ai = {
      analyzeImage: (filePath: string) => analyzeImagePipeline(filePath),
      analyzeAudio: (filePath: string) => analyzeAudioPipeline(filePath),
    }
    next()
  }
}