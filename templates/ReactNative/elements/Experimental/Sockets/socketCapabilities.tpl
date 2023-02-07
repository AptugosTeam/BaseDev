/*
path: socketCapabilities.tpl
completePath: elements/Experimental/Sockets/socketCapabilities.tpl
type: file
unique_id: socketCapabilities
helpText: Enables Socket capabilities into your application, both in front and back-end
icon: f:socketCapabilities.svg
children: []
usesDelays: [theconstructor,onsendmessage,ongetmessages,onhandlemessage]
options:
  - name: serverurl
    display: Server URL
    type: text
extraFiles:
  - source: 'elements/Experimental/Sockets/999_sockets.js'
    destination: 'back-end/app/services/sockets.js'
settings:
  - name: Packages
    value: '"socket.io-client": "^4.4.0",'
  - name: BackendPackages
    value: '"socket.io": "latest",'
  - name: ServerAddenum
    value: |-
      var sockets = require('./app/services/sockets')
      var socketio = require('socket.io')
  - name: ServerAddenumAfterUp
    value: |-
      var io = socketio(server,{
        cors: {
          origin: '*',
          methods: ['GET', 'POST']
        }
      })
      sockets(io)
*/
{% set bpr %}
import io from 'socket.io-client'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}
const socketRef = React.useRef(null)
const socket = socketRef.current
React.useEffect(() => {
  socketRef.current = io('{{ element.values.serverurl }}')
  return () => socketRef.current.disconnect();
}, [])
{% endset %}
{{ save_delayed('ph',ph)}}