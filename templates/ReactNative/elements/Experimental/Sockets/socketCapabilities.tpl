/*
path: socketCapabilities.tpl
completePath: elements/Experimental/Sockets/socketCapabilities.tpl
type: file
unique_id: socketCapabilities
helpText: Enables Socket capabilities into your application, both in front and back-end
icon: f:socketCapabilities.svg
children: []
options:
  - name: serverurl
    display: Server URL
    type: text
  - name: WaitFor
    display: Wait for variable to be set
    type: text
  - name: noconsole
    display: Hide debugging information
    type: checkbox
*/
const [ws, setWs] = React.useState<WebSocket | null>(null)
const reconnectAttempts = React.useRef(0)
const reconnectTimeout = React.useRef<any>(null)

const connectWebSocket = React.useCallback(() => {
  {% if not element.values.noconsole %}console.log('🔌 Connecting WebSocket...'){% endif %}

  const socket = new WebSocket('{{ element.values.serverurl }}')

  socket.onopen = () => {
    {% if not element.values.noconsole %}console.log('✅ WS connected'){% endif %}

    reconnectAttempts.current = 0
  }

  socket.onmessage = (event) => {
    {% if not element.values.noconsole %}console.log('📩 Received message:', event.data){% endif %}

    {{ content | raw }}
  }

  socket.onclose = (event) => {
    {% if not element.values.noconsole %}console.log('❌ WS closed', event.code, event.reason){% endif %}

    if (event.code !== 1000) attemptReconnect()
  }

  socket.onerror = (error) => {
    {% if not element.values.noconsole %}console.log('⚠️ WS Error:', error){% endif %}

    socket.close()
  }

  setWs(socket)
}, [{% if element.values.WaitFor %}{{ element.values.WaitFor }}{% endif %}])

const attemptReconnect = React.useCallback(() => {
  if (reconnectTimeout.current) return
  reconnectAttempts.current += 1
  const delay = Math.min(1000 * 2 ** reconnectAttempts.current, 30000)
  {% if not element.values.noconsole %}console.log(`⏳ Attempting reconnect in ${delay / 1000}s...`){% endif %}

  reconnectTimeout.current = setTimeout(() => {
    reconnectTimeout.current = null
    connectWebSocket()
  }, delay)
}, [connectWebSocket])

React.useEffect(() => {
  connectWebSocket()
  return () => {
    {% if not element.values.noconsole %}console.log('🔒 Cleanup WS'){% endif %}

    if (reconnectTimeout.current) clearTimeout(reconnectTimeout.current)
    ws?.close()
  }
}, [connectWebSocket])
