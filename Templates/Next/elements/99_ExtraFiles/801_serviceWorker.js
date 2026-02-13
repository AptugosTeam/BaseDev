/*
path: 801_serviceWorker.js
keyPath: elements/99_ExtraFiles/801_serviceWorker.js
unique_id: 0OGESeNt
*/
self.addEventListener('push', event => {
  const data = event.data.json()
  const title = data.title
  const options = {
    body: data.body,
    icon: data.icon || '{{ element.values.Icon|default("https://www.aptugo.com/img/favicon.png")}}',
    data: {
      url: data.url,
    },
  }

  self.registration.showNotification(title, options)
})

self.addEventListener('notificationclick', event => {
  event.notification.close()
  event.waitUntil(clients.openWindow(event.notification.data.url))
})