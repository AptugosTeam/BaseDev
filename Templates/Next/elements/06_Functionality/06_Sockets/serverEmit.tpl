/*
path: serverEmit.tpl
completePath: elements/Experimental/Sockets/serverEmit.tpl
display: Send a message to the client
type: file
unique_id: serveremit
icon: f:emit.svg
children: []
options:
  - name: parameters
    display: Data
    type: text
*/
this.io.sockets.emit({{ element.values.parameters | textOrVariableInCode }})