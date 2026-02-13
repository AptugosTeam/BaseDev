/*
path: 600_telegramLib.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/Next/elements/99_ExtraFiles/600_telegramLib.tsx
keyPath: elements/99_ExtraFiles/600_telegramLib.tsx
unique_id: SesgBM45
*/
import { Api, TelegramClient } from 'telegram'
import { StringSession } from 'telegram/sessions'

const apiId = {{ element.values.apiId }}
const apiHash = "{{ element.values.apiHash }}" 
const stringSession = new StringSession(`{{ element.values.stringSession }}`)

let clientInstance = null

const telegram = async () => {
  if (clientInstance && clientInstance.connected) {
    return clientInstance
  }

  const client = new TelegramClient(stringSession, apiId, apiHash, {
    connectionRetries: 5,
  })

  try {
    console.log('Connecting to Telegram API...')
    await client.connect()
    console.log('Connected to Telegram API.')
    clientInstance = client // Save the connected client instance
    return clientInstance
  } catch (err) {
    console.error('Failed to connect to Telegram:', err)
    // Throw a new error to be caught by the main handler's try/catch block
    throw new Error('Failed to connect to Telegram API')
  }
}

export { Api }
export default telegram