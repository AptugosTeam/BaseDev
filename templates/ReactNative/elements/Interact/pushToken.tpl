/*
path: pushToken.tpl
type: file
unique_id: pushToken
icon: ico-disqus
helpText: Add Push messaging capabilities to your app
settings:
  - name: Packages
    value: '"expo-notifications": "~0.32.12","expo-device": "~8.0.9",'
options:
  - name: WaitFor
    display: Wait for variable to be set
    type: text
  - name: projectId
    display: ProjectID
    type: text
  - name: disableAlert
    display: Disable Development Alert
    type: checkbox
  - name: endpoint
    display: Endpoint
    type: url
children: []
extraFiles:
  - source: 'elements/99_ExtraFiles/pushTokenNotificationHook.tsx'
    destination: 'front-end/components/NotificationsHook/index.tsx'
*/
{% set url = element.values.endpoint %}
{% if element.values.urlFULL %}
  {% set url = settings.apiURL ~ element.values.endpoint %}
{% endif %}
{% set bpr %}
import { usePushTokenRegister } from '@components/NotificationsHook'
{% endset %}
{{ save_delayed('bpr', bpr)}}
usePushTokenRegister({
  userId: userInfo?._id,
  endpoint: {{ url | textOrVariableInCode }},
})