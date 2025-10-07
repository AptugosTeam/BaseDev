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
children: []
*/
{% set bpr %}
import * as Device from 'expo-device'
import * as Notifications from 'expo-notifications'
import AsyncStorage from '@react-native-async-storage/async-storage'
{% endset %}
{{ save_delayed('bpr', bpr)}}
{% set ph %}
React.useEffect(() => {
  {% if element.values.WaitFor %}if ({{ element.values.WaitFor }}) { {% endif %}
  registerForPushNotificationsAsync().then(token => {
    AsyncStorage.getItem('mypushtoken').then(currentToken => {
      {{ content | raw }}
    })
  })
  {% if element.values.WaitFor %} } {% endif %}
}, [{% if element.values.WaitFor %}{{ element.values.WaitFor }}{% endif %}])
{% endset %}
{{ save_delayed('ph',ph)}}
async function registerForPushNotificationsAsync() {
  let token;
  if (Device.isDevice) {
    const { status: existingStatus } = await Notifications.getPermissionsAsync();
    let finalStatus = existingStatus;
    if (existingStatus !== 'granted') {
      const { status } = await Notifications.requestPermissionsAsync();
      finalStatus = status;
    }
    if (finalStatus !== 'granted') {
      alert('Failed to get push token for push notification!');
      return;
    }
    token = (await Notifications.getExpoPushTokenAsync({% if element.values.projectId %}{ projectId: '{{ element.values.projectId }}' }{% endif %})).data;
    const currentToken = await AsyncStorage.getItem('mypushtoken')
    if (currentToken !== token) AsyncStorage.setItem('mypushtoken', token)
  {% if not element.values.disableAlert %}
  } else {
    alert('Must use physical device for Push Notifications')
  {% endif %}
  }

  return token
}