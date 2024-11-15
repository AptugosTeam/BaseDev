/*
path: SocketEventListener.tpl
type: file
unique_id: sketCili
icon: ico-function
sourceType: javascript
helpText: Listens and handles custom Socket.io events with configurable names, async handlers, and socket references
options:
  - name: socketListener
    display: Socket Reference (without on)
    type: text
    options: ''
  - name: event
    display: Event Name
    type: text
    options: ''
  - name: parameters
    display: Handler Parameters
    type: text
    options: ''
  - name: code
    display: Body
    type: function
    options: ''
  - name: async
    display: Async
    type: checkbox
    advanced: true
    settings:
      default: false
children: []
*/
{{element.values.socketListener |default('socketRef.current')}}.on('{{element.values.event}}', {% if element.values.async%}async{% endif %} ({{ element.values.parameters }}) => {
    {{ element.values.code | raw }}
    {{ content | raw }}
})