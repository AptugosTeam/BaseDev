/*
path: 999_sockets.js
unique_id: Wq86Z8m6
internalUse: true
*/
import { WebSocketServer, WebSocket } from "ws"
import { EventEmitter } from "events"

type Listener = (ws: WebSocket, data?: any) => void

class WSServer extends EventEmitter {
  private wss: WebSocketServer | null = null

  start(port: number = {{ element.values.port|default('3000') }}) {
    if (this.wss) return this.wss

    this.wss = new WebSocketServer({ port })

    this.wss.on("connection", (ws) => {
      console.log("Client connected")

      this.emit("connection", ws)

      ws.on("message", (data) => {
        this.emit("message", ws, data)
      })

      ws.on("close", () => {
        this.emit("disconnect", ws)
      })
    })

    console.log(`WebSocket server started on port ${port}`)
    return this.wss
  }

  stop() {
    if (!this.wss) return false

    this.wss.clients.forEach((client) => client.close())
    this.wss.close()
    this.wss = null
    this.removeAllListeners()
    console.log("WebSocket server stopped")
    return true
  }

  restart(port: number = 3000) {
    this.stop()
    return this.start(port)
  }

  status() {
    if (!this.wss) return { running: false }
    return { running: true, clients: this.wss.clients.size }
  }

  broadcast(data: any) {
    if (!this.wss) return
    this.wss.clients.forEach((client) => {
      if (client.readyState === client.OPEN) client.send(JSON.stringify(data))
    })
  }
}

// Singleton instance
const wsServer = new WSServer()
export default wsServer