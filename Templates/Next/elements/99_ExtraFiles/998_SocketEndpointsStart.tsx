/*
path: 998_SocketEndpointsStart.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/Next/elements/99_ExtraFiles/998_SocketEndpointsStart.tsx
keyPath: elements/99_ExtraFiles/998_SocketEndpointsStart.tsx
unique_id: aXHUniqG
*/
import { NextApiRequest, NextApiResponse } from 'next'
import wsServer from '@api-lib/sockets'

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  wsServer.start()
  res.status(200).json(wsServer.status())
}