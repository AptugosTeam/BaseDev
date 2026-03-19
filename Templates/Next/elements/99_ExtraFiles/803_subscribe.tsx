/*
path: 803_subscribe.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/Next/elements/99_ExtraFiles/803_subscribe.tsx
keyPath: elements/99_ExtraFiles/803_subscribe.tsx
unique_id: EbrGTXDB
*/
{% set table = element.values.Subscribers | tableData %}
import { NextApiRequest, NextApiResponse } from 'next'
import { {{ table.name | friendly }}Model } from '@/models'

let subscriptions = []

export default async function handler(req, res) {
  if (req.method === 'POST') {
    const subscription = req.body
    {{ table.name | friendly }}Model.insertMany([subscription])
    res.status(201).json({ message: 'Subscription saved.' })
  } else {
    res.status(405).json({ message: 'Method Not Allowed' })
  }
}