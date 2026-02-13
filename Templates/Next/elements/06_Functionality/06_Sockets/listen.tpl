/*
path: listen.tpl
completePath: elements/Experimental/Sockets/listen.tpl
display: Reacts to messages from server
type: file
unique_id: socketlisten
icon: f:listen.svg
children: []
options:
  - name: event
    display: Event Name
    type: text
  - name: Action
    display: Action
    type: text
*/
socketRef.current?.on('{{ element.values.event }}', {{ element.values.Action | functionOrCall }})