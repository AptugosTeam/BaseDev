/*
path: 800_notificationsSubscriber.tsx
keyPath: elements/99_ExtraFiles/800_notificationsSubscriber.tsx
unique_id: y8GiLaHz
*/
"use client"

import { useEffect, useState } from 'react'

const NotificationSubscriber = () => {
  const [isSubscribed, setIsSubscribed] = useState(false)

  const urlBase64ToUint8Array = (base64String) => {
    const padding = '='.repeat((4 - (base64String.length % 4)) % 4)
    const base64 = (base64String + padding).replace(/-/g, '+').replace(/_/g, '/')
    const rawData = window.atob(base64)
    const outputArray = new Uint8Array(rawData.length)

    for (let i = 0; i < rawData.length; i++) {
      outputArray[i] = rawData.charCodeAt(i)
    }
    return outputArray
  }

  const subscribeUser = async () => {
    if (!('serviceWorker' in navigator)) {
      console.error('Service workers are not supported.')
      return
    } else {
      navigator.serviceWorker.register('/service-worker.js')
    }

    try {
      const registration = await navigator.serviceWorker.ready
      const subscription = JSON.stringify(await registration.pushManager.subscribe({
        userVisibleOnly: true,
        applicationServerKey: urlBase64ToUint8Array("{{ insert_setting('VAPIDPublicKey') }}"),
      }))

      await fetch('/api/subscribeToNotifications', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ SubscriptionData: subscription, SubscriptionType: 'Administrator' }),
      })

      setIsSubscribed(true)
      console.log('User subscribed successfully.')
    } catch (error) {
      console.error('Failed to subscribe the user:', error)
    }
  }

  useEffect(() => {
    if ('Notification' in window) {
      Notification.requestPermission().then(permission => {
        if (permission === 'granted') {
          subscribeUser()
        }
      })
    }
  }, [])

  const sendNotification = async () => {
    if (!isSubscribed) {
      console.info('You must be subscribed to send a notification.')
      return
    }

    try {
      const response = await fetch('/api/sendnotification', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          title: 'Aptugo Notification',
          body: 'Hello from your Aptugo dashboard!',
          url: '/',
        }),
      })

      if (response.ok) {
        console.info('Notification request sent successfully!')
      } else {
        console.info('Failed to send notification.')
      }
    } catch (error) {
      console.error('Error sending notification:', error)
      console.info('Error sending notification.')
    }
  }

  return <></>
}

export default NotificationSubscriber