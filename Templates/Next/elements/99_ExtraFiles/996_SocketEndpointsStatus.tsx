/*
path: 996_SocketEndpointsStatus.tsx
keyPath: elements/99_ExtraFiles/996_SocketEndpointsStatus.tsx
unique_id: aXHUniqE
*/
import { getWebSocketStatus, withWebSocketServer } from '@api-lib/sockets'
import nc from 'next-connect'

const handler = nc()
handler.use(withWebSocketServer)

handler.get((req: any, res: any) => {
  const wss = res.socket.server.wss

  if (req.query.details === 'true' && wss?.getDetails) {
    return res.status(200).json(wss.getDetails())
  }

  const status = getWebSocketStatus(res.socket.server)
  res.status(200).json(status)
})

export default handler