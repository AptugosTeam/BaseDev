/*
path: socketCapabilities.tpl
completePath: elements/Experimental/Sockets/socketCapabilities.tpl
type: file
unique_id: socketCapabilities
helpText: Enables Socket capabilities into your application, both in front and back-end
icon: f:../../z-images/sockets.svg
children: []
usesDelays: [theconstructor,onsendmessage,ongetmessages,onhandlemessage,beforeClassDefinition]
settings:
  - name: Packages
    value: '"socket.io": "^4.8.1","socket.io-client": "^4.8.1",'
options:
  - name: serverurl
    display: Server URL
    type: text
extraFiles:
  - source: 'elements/99_ExtraFiles/999_sockets.tsx'
    destination: 'src/pages/api/socket.tsx'
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