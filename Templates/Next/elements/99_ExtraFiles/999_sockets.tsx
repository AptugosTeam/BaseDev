/*
path: 999_sockets.js
unique_id: Wq86Z8m6
internalUse: true
*/
import { WebSocketServer } from 'ws'
import { IncomingMessage } from 'http'
import { Socket } from 'net'

declare global {
  var wss: WebSocketServer | undefined
}

export const getWsServerInstance = (): WebSocketServer => {
  if (global.wss) {
    console.log("WebSocket server instance already exists. Returning it.")
    return global.wss
  }

  console.log("Creating new WebSocket Server instance...")
  
  global.wss = new WebSocketServer({ noServer: true })

  global.wss.on('connection', (ws: WebSocket, req: IncomingMessage) => {
    console.log('Client connected!')
    // Handle events here
    ws.on('message', (data: any) => {
      console.log(`Received message from client: ${data}`)
    })

    ws.on('close', () => {
      console.log('Client disconnected.')
    })
  })

  return global.wss
}

export const withWsServer = (handler: any) => async (req: IncomingMessage, res: any) => {
  if (!res.socket.server.ws) {
    const wss = getWsServerInstance()
    res.socket.server.ws = wss

    res.socket.server.on('upgrade', (request: IncomingMessage, socket: Socket, head: Buffer) => {
      if (request.url.startsWith('/_next/')) {
        console.log(`Ignoring HMR WebSocket request for: ${request.url}`)
        return
      }
      
      console.log(`WebSocket upgrade request for URL: ${request.url}`)

      wss.handleUpgrade(request, socket, head, (websocket) => {
        wss.emit('connection', websocket, request)
      })
    })
  }
  
  return handler(req, res)
}

export const broadcast = (data: any) => {
  const wss = getWsServerInstance()
  if (!wss) return

  wss.clients.forEach((client: WebSocket) => {
    if (client.readyState === WebSocket.OPEN) {
      client.send(JSON.stringify(data))
    }
  })
}

export const stop = () => {
    const wss = getWsServerInstance()
    if (!wss) return false

    wss.clients.forEach((client: WebSocket) => client.close())
    wss.close()
    delete global.wss
    console.log('WebSocket server stopped')
    return true
}

export const status = () => {
  const wss = getWsServerInstance()
  if (!wss) return { running: false }
  return { running: true, clients: wss.clients.size }
}