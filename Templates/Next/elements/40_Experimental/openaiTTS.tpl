/*
path: openaiTTS.tpl
keyPath: elements/40_Experimental/openaiTTS.tpl
name: OpenAI Text-To-Speech
unique_id: rPrUCVig
options:
  - name: openAIKey
    display: OpenAI Key
    type: text
extraFiles:
  - source: 'elements/99_ExtraFiles/901_openaiTTS.tsx'
    destination: 'src/lib/openaiTTS.tsx'
*/
import { speakWithEchoStream } from '@lib/openaiTTS'