/*
path: sendWhatsApp.tpl
type: file
unique_id: sendWhatsApp
icon: ico-disqus
name: Send WhatsApp Message
settings:
  - name: Packages
    value: '"web-push": "3.6.7",'
options:
  - name: AppID
    display: Facebook APP ID
    type: text
  - name: AccessToken
    display: WhatsApp Access Token
    type: text
  - name: PhoneNumber
    display: Phone Number
    type: text
  - name: Message
    display: Message to Send
    type: text
children: []
extraFiles:
  - source: 'elements/99_ExtraFiles/800_notificationsSubscriber.tsx'
    destination: '/src/components/NotificationSubscriber/index.tsx'
  - source: 'elements/99_ExtraFiles/801_serviceWorker.js'
    destination: '/public/service-worker.js'
  - source: 'elements/99_ExtraFiles/802_sendNotification.tsx'
    destination: '/src/pages/api/sendNotification/index.tsx'
  - source: 'elements/99_ExtraFiles/803_subscribe.tsx'
    destination: '/src/pages/api/subscribeToNotifications/index.tsx'
*/
const apiUrl = `https://graph.facebook.com/v23.0/{{ element.values.AppID }}/messages`
try {
  const response = await fetch(apiUrl, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer {{ element.values.AccessToken }}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      messaging_product: 'whatsapp',
      to: {{ element.values.PhoneNumber | textOrVariableInCode }},
      type: 'text',
      text: {
        body: {{ element.values.Message | textOrVariableInCode }}
      }
    })
  })

  const data = await response.json()

  console.log('WhatsApp API response:', data)
} catch (error) {
  console.error('Error sending WhatsApp message:', error.message, error)
}