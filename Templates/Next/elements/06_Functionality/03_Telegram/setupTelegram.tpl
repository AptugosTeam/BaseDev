/*
path: setupTelegram.tpl
keyPath: elements/06_Functionality/03_Telegram/setupTelegram.tpl
unique_id: EudSOQ8G
options:
  - name: apiId
    display: Telegram API ID
    type: text
  - name: apiHash
    display: Telegram API HASH
    type: text
  - name: stringSession
    display: Telegram API String Session
    type: text
settings:
  - name: Packages
    value: '"telegram": "2.26.22",'
extraFiles:
  - source: 'elements/99_ExtraFiles/600_telegramLib.tsx'
    destination: '/src/api-lib/telegram.tsx'
*/
// Telegram Setup