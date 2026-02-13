/*
path: 901_openaiTTS.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/Next/elements/99_ExtraFiles/901_openaiTTS.tsx
keyPath: elements/99_ExtraFiles/901_openaiTTS.tsx
unique_id: vnEAqb6q
*/
const openIAKey = '{{ insert_setting('openAIKey') }}'
  

export async function speakWithEchoStream(text, voice = 'echo', speed = 1.1) {
  const response = await fetch('https://api.openai.com/v1/audio/speech', {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${openIAKey}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      model: 'gpt-4o-mini-tts',
      voice: voice,
      input: text,
      speed: speed,
    }),
  })

  const mediaSource = new MediaSource()
  const audio = new Audio(URL.createObjectURL(mediaSource))

  mediaSource.addEventListener('sourceopen', async () => {
    const sourceBuffer = mediaSource.addSourceBuffer('audio/mpeg')
    const reader = response.body!.getReader()

    async function pump() {
      const { done, value } = await reader.read()
      if (done) {
        mediaSource.endOfStream()
        return
      }

      return new Promise<void>((resolve) => {
        sourceBuffer.addEventListener('updateend', () => resolve(), { once: true })
        sourceBuffer.appendBuffer(value)
      }).then(pump)
    }

    pump()
  })

  audio.play()
}
