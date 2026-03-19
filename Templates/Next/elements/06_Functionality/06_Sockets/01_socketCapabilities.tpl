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
  - name: model
    display: Add to model files
    type: dropdown
    options: >-
      return [ ['inPlace','Render in place'],
      ...aptugo.store.getState().application.tables.map(({ unique_id, singleName }) => [
        aptugo.pageUtils.friendly(singleName).toLowerCase(),singleName]) ]
    advanced: true
  - name: extraImports
    display: Extra Imports in lib
    type: code
    advanced: true
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
{% if element.values.model %}
  {{ add_setting(element.values.model ~ '_File_Start', 'import { withWebSocketServer } from "@api-lib/sockets"')}}
  {{ add_setting(element.values.model ~ '_Middlewares', 'handler.use(withWebSocketServer)')}}
{% endif %}
// App has Socket capabilities
// /api/ws/start
// /api/ws/stop
// /api/ws/status
//