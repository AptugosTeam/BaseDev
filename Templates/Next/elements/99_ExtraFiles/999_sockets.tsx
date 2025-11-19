/*
path: 999_sockets.js
unique_id: Wq86Z8m6
internalUse: true
*/
{{ element.values.extraImports | raw }}
import { WebSocket, WebSocketServer } from 'ws'

interface ExtendedWebSocket extends WebSocket {
  readyState: any
  send(arg0: string): unknown
  on(arg0: string, arg1: (msg: any) => void): unknown
  groupId?: string
  studentId?: string
}

// Singleton reference to the WebSocket server
let wssInstance:
  | (WebSocketServer & {
    _listeners: Map<string, (ws: ExtendedWebSocket, data: any) => void>
    onWsEvent: (event: string, callback: (ws: ExtendedWebSocket, data: any) => void) => void
    groupMap: Map<string, Set<ExtendedWebSocket>>
    getDetails: () => any  // ✅ Add this
  })
  | null = null

const groupMap = new Map<string, Set<ExtendedWebSocket>>()

export const withWebSocketServer = (req, res, next) => {
  if (!res.socket.server.wss) {
    console.log('🔌 Initializing WebSocket server...')

    const wss = new WebSocketServer({ noServer: true }) as typeof wssInstance

    wss._listeners = new Map()
    wss.groupMap = groupMap
    wss.onWsEvent = (event, callback) => {
      wss._listeners.set(event, callback)
    }

    res.socket.server.wss = wss
    res.socket.server.groupMap = groupMap

    wssInstance = wss

    wss.getDetails = () => {
      return {
        totalClients: wss.clients.size,
        groups: Array.from(wss.groupMap.entries()).map(([groupId, clients]) => ({
          groupId,
          clientCount: clients.size,
          clients: Array.from(clients).map((client: ExtendedWebSocket) => ({
            readyState: client.readyState,
            groupId: client.groupId || null,
            studentId: client.studentId || null
          })),
        })),
        allClients: Array.from(wss.clients).map((client: ExtendedWebSocket) => ({
          readyState: client.readyState,
          groupId: client.groupId || null,
          studentId: client.studentId || null
        })),
      }
    }

    {{ content | raw }}

    // --- UPGRADE HANDLER ---
    res.socket.server.on('upgrade', (req, socket, head) => {
      if (req.url === '/ws' || req.url === '/api/ws') {
        wss.handleUpgrade(req, socket, head, (ws: ExtendedWebSocket) => {
          wss.emit('connection', ws, req)

          ws.on('message', (msg) => {
            try {
              const data = JSON.parse(msg.toString())
              const listener = wss._listeners.get(data.type)
              if (listener) {
                console.log('got a listener for ', data.type)
                listener(ws, data)
              } else {
                console.log('📦 WS Server parsed data:', JSON.stringify(data, null, 2))
                const clients = groupMap.get('bot-console-room-' + data.data.bot.metadata.sessionID)
                if (clients) {
                  if (data.data.data.action === 'speech_on') {
                    console.log('Got Clients', clients)
                    clients.forEach((c) => {
                      if (c !== ws && c.readyState === WebSocket.OPEN) {
                        console.log('Boradcasting to client', c)
                        c.send(JSON.stringify({ type: 'message', data: JSON.stringify(data, null, 2) }))
                      }
                    })
                  }
                  
                } else {
                  console.log('No clients for group bot-console-room' + + data.data.bot.metadata.sessionID)
                }
              }
            } catch (err) {
              console.error('Error parsing WS message:', err)
            }
          })

          ws.on('close', () => {
            if (ws.groupId && groupMap.has(ws.groupId)) groupMap.get(ws.groupId)!.delete(ws)
          })
        })
      }

    })

    console.log('✅ WebSocket server initialized and attached.')
  }

  next()
}

// --- Helper to retrieve status anywhere ---
export const getWebSocketStatus = (server?: any) => {
  const wss = server?.wss ?? (typeof window === 'undefined' ? null : null)
  if (!wss) return { ok: false, message: 'WebSocket server not initialized yet' }

  return {
    ok: true,
    clients: wss.clients.size,
    groups: wss.groupMap.size,
  }
}
