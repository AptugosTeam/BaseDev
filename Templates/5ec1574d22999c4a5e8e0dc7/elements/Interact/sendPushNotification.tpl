/*
path: sendPushNotification.tpl
type: file
unique_id: sendPushNotification
icon: ico-disqus
helpText: Sends a notification to the push service (Expo)
options:
  - name: pushToken
    display: Push Token
    type: text
  - name: title
    display: Notification Title
    type: text
  - name: body
    display: Notification Body
    type: text
  - name: data
    display: Notification data
    type: text
children: []
*/
{% set beforeClassDefinition %}
const axios = require('axios')

async function sendPushNotification(expoPushToken, { title, body, data }) {
  if (!expoPushToken) return
  const message = {
    to: expoPushToken,
    sound: 'default',
    title: title,
    body: body,
    data: data
  }

  await axios('{{ settings.apiURL }}/api/sendPush', {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Accept-encoding': 'gzip, deflate',
      'Content-Type': 'application/json',
    },
    data: JSON.stringify(message),
  })
}
{% endset %}
{{ save_delayed('beforeClassDefinition',beforeClassDefinition) }}
{{ save_delayed('ph',beforeClassDefinition) }}
sendPushNotification(
  {{element.values.pushToken | textOrVariableInCode }},
  {
    title: {{element.values.title | textOrVariableInCode }},
    body: {{element.values.body | textOrVariableInCode }},
    data: {{element.values.data | textOrVariableInCode }}
  }
)