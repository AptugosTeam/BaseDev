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
  - name: emitBody
    display: Body Event
    type: code
  - name: resultVar
    display: Result Variable Name
    type: text
    advanced: true
*/
socketRef.current?.emit('{{ element.values.event }}',{% if element.values.parameters %} {{ element.values.parameters }},{% endif %} {% if element.values.async%}async{% endif %} ({{ element.values.resultVar|default('response') }}) => {
  {{ element.values.emitBody | raw }}
  {{ content|raw }}
})