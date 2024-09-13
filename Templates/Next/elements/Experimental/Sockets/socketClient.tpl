/*
path: socketClient.tpl
display: Socket io Client
completePath: elements/Experimental/Sockets/socketClient.tpl
type: file
unique_id: socketClient
helpText: Enables Socket capabilities into your application
icon: f:socketCapabilities.svg
children: []
usesDelays: [theconstructor,onsendmessage,ongetmessages,onhandlemessage,beforeClassDefinition]
options:
  - name: serverurl
    display: Server URL
    type: text
  - name: cleanSocket
    display: Clean the socket?
    type: checkbox
    settings:
      default: false
settings:
  - name: Packages
    value: '"socket.io-client": "^4.7.5",'
*/
{% set ph %}
const socketRef = React.useRef(null)
{% endset %}
{{ save_delayed('ph',ph)}}
const io = (await import('socket.io-client')).default
socketRef.current = io('{{ element.values.serverurl }}')
{% if element.values.cleanSocket %}
  return () => socketRef.current.disconnect()
{% endif %}