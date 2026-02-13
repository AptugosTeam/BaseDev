/*
path: pushToken.tpl
type: file
unique_id: pushToken
icon: ico-disqus
name: Enable Push Notifications
helpText: Add Push messaging capabilities to your app
settings:
  - name: Packages
    value: '"web-push": "3.6.7",'
options:
  - name: Subject
    display: Subject
    helpText: Get from https://vapidkeys.com/
    type: text
  - name: PublicKey
    display: Public Key
    type: text
  - name: PrivateKey
    display: Private Key
    type: text
  - name: Subscribers
    display: Subscribers Table
    type: dropdown
    options: >-
      return aptugo.store.getState().application.tables.map(({ unique_id, name }) => [unique_id, name])
  - name: Filter
    display: Filter Subscribers
    type: code
  - name: Icon
    display: Default ICON
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
{{ add_setting('VAPIDSubject', element.values.Subject) }}
{{ add_setting('VAPIDPrivateKey', element.values.PrivateKey) }}
{{ add_setting('VAPIDPublicKey', element.values.PublicKey) }}
{% set bpr %}
import NotificationSubscriber from '@components/NotificationSubscriber'
{% endset %}
{{save_delayed('bpr',bpr)}}
<NotificationSubscriber />