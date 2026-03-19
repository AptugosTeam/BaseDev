/*
path: 802_sendNotification.tsx
keyPath: elements/99_ExtraFiles/802_sendNotification.tsx
unique_id: mUuHGC8q
*/
{% set table = element.values.Subscribers | tableData %}
import { NextApiRequest, NextApiResponse } from 'next'
import webpush from 'web-push'
import { {{ table.name | friendly }}Model } from '@/models'

webpush.setVapidDetails(
  "{{ insert_setting('VAPIDSubject') }}",
  "{{ insert_setting('VAPIDPublicKey') }}",
  "{{ insert_setting('VAPIDPrivateKey') }}"
)

export default async function handler(req, res) {
  if (req.method === 'POST') {

    const payload = JSON.stringify({
      title: req.body.title,
      body: req.body.body,
      url: req.body.url,
    })

    const subscriptions = await {{ table.name | friendly }}Model.find({{ element.values.filter }})
    let subscribers = subscriptions.length
    for (var subscription of subscriptions) {
      const subscriptionData = JSON.parse(subscription.SubscriptionData)
      try {
        await webpush.sendNotification(subscriptionData, payload)
        subscribers = subscribers - 1
        
      } catch (error) {
        console.error('Error sending push notification:', error);
      }
    }

    if (subscribers === 0) {
      res.status(200).json({ message: 'Notification sent successfully to all subscribers.' })
    } else {
      res.status(500).json({ message: 'Failed to send notification.' })
    }
  } else {
    res.status(405).json({ message: 'Method Not Allowed' })
  }
}