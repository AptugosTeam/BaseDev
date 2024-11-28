/*
path: emit.tpl
completePath: elements/Experimental/Sockets/emit.tpl
display: Send a message to the server
type: file
unique_id: emit
icon: f:emit.svg
children: []
options:
  - name: event
    display: Event Name
    type: text
  - name: parameters
    display: Handler Parameters
    type: text
  - name: async
    display: Async
    type: checkbox
    settings:
      default: false
*/
socketRef.current?.emit('{{ element.values.event }}',{% if element.values.parameters %} {{ element.values.parameters }},{% endif %} {% if element.values.async%}async{% endif %} (response) => {
  {{ content|raw }}
})