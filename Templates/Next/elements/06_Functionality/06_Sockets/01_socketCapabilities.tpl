/*
path: socketCapabilities.tpl
type: file
unique_id: socketCapabilities
helpText: Enables Socket capabilities into your application, both in front and back-end
icon: ico-plug
children: []
settings:
  - name: Packages
    value: '"ws": "^8.18.0",'
options:
  - name: port
    display: Server PORT
    type: text
extraFiles:
  - source: 'elements/99_ExtraFiles/999_sockets.tsx'
    destination: 'src/api-lib/sockets.tsx'
  - source: 'elements/99_ExtraFiles/998_SocketEndpointsStart.tsx'
    destination: 'src/pages/api/ws/start.tsx'
  - source: 'elements/99_ExtraFiles/997_SocketEndpointsStop.tsx'
    destination: 'src/pages/api/ws/stop.tsx'
  - source: 'elements/99_ExtraFiles/996_SocketEndpointsStatus.tsx'
    destination: 'src/pages/api/ws/status.tsx'
*/
//https://90f55a73f27d.ngrok-free.app/?wss=https://c2728be29a7c.ngrok-free.app