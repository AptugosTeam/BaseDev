/*
path: sendExpoPush.tpl
keyPath: elements/Programming/sendExpoPush.tpl
unique_id: sendExpoPush
icon: ico-send
options:
  - name: model
    display: Add to model files
    type: dropdown
    options: >-
      return [ ['inPlace','Render in place'],
      ...aptugo.store.getState().application.tables.map(({ unique_id, singleName }) => [
        aptugo.pageUtils.friendly(singleName).toLowerCase(),singleName]) ]
settings:
  - name: Packages
    value: '"expo-server-sdk": "latest",'
extraFiles:
  - source: 'elements/99_ExtraFiles/805_expoPushService.tsx'
    destination: '/src/api-lib/expoPushNotifications.tsx'
*/
{% if element.values.model %}
  {{ add_setting(element.values.model ~ '_File_Start', 'import { sendPushNotification } from "@api-lib/expoPushNotifications"')}}
{% endif %}
