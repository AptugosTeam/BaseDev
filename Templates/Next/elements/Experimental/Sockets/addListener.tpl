/*
path: addListener.tpl
completePath: elements/Experimental/Sockets/addListener.tpl
type: file
unique_id: addListener
icon: f:addListener.svg
children: []
options:
  - name: listener
    display: Listener Name
    type: text
  - name: parameters
    display: Parameters
    type: text
    options: ''
*/
socketRef.current.on('{{ element.values.listener }}', ({{ element.values.parameters }}) => {
  {{ content | raw }}
})