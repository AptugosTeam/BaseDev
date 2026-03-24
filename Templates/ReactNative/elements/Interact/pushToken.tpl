/*
path: pushToken.tpl
type: file
unique_id: pushToken
icon: ico-disqus
helpText: Add Push messaging capabilities to your app
settings:
  - name: Packages
    value: '"expo-device": "~8.0.9",'
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
{% set AppJsonAndroid %}"googleServicesFile": "./google-services.json",{% endset %}
{{ add_setting('AppJsonAndroid', AppJsonAndroid)}}
{% set bpr %}
import { usePushTokenRegister } from '@components/NotificationsHook'
{% endset %}
{{ save_delayed('bpr', bpr)}}
{% if element.values.urlFULL %}
{% set bpr %}
import { resolveApiUrl } from '@services/api'
{% endset %}
{{ save_delayed('bpr', bpr)}}
{% endif %}
usePushTokenRegister({
  userId: userInfo?._id,
  endpoint: {% if element.values.urlFULL %}resolveApiUrl({{ element.values.endpoint | textOrVariableInCode }}){% else %}{{ element.values.endpoint | textOrVariableInCode }}{% endif %},
})
