/*
path: cleanSocket.tpl
display: Clean Socket
completePath: elements/Experimental/Sockets/cleanSocket.tpl
type: file
unique_id: cleanSocket
helpText: Clean the socket when disassembling the component
icon: f:socketCapabilities.svg
children: []
options:
  - name: useCondition
    display: Condition?
    type: checkbox
    settings:
      default: false    
  - name: condition
    display: Condition to clean socket
    type: text
    settings:
      propertyCondition: useCondition
      condition: true
settings:
  - name: Packages
    value: '"socket.io-client": "^4.7.5",'
*/
{% if element.values.useCondition %}
return () => {
    if ({{element.values.condition}}) {
        socketRef.current.disconnect()
    }
}
{% else %}
return () => socketRef.current.disconnect()
{% endif %}