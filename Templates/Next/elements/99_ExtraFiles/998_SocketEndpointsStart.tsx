/*
path: 998_SocketEndpointsStart.tsx
keyPath: elements/99_ExtraFiles/998_SocketEndpointsStart.tsx
unique_id: aXHUniqG
*/
import nc from 'next-connect'
import { NextApiRequest, NextApiResponse } from 'next'
import { withWebSocketServer } from '@/api-lib/sockets'

export const config = { api: { bodyParser: false } }

const handler = nc()
handler.use(withWebSocketServer)

handler.get(async (_req:NextApiRequest, res:NextApiResponse) => {
  res.status(200).json({ ok: true, message: 'WebSocket server running' })
})

export default handler