/*
path: interface.tpl
type: file
unique_id: IwxtPt4d
icon: ico-watch-variable
options:
  - name: interface
    display: Interface Name
    type: text
    options: ''
  - name: props
    display: Interface Props
    type: code
    options: ''
helpText: Creates an interface object
children: []
*/

interface {{ element.values.interface|default('AptugoInterface') }} {
  {{ element.values.props }}
}