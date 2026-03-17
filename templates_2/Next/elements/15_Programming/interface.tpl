/*
path: interface.tpl
completePath: elements/Programming/interface.tpl
type: file
unique_id: btWAGhLx
icon: ico-use-state
options:
  - name: interfaceName
    display: Interface Name
    type: text
    options: ''
  - name: interfaceValue
    display: Interface Value
    type: function
    options: ''
children: []
*/
{% set ph %}
interface {{ element.values.interfaceName }} {{ element.values.interfaceValue }}
{% endset %}
{{ save_delayed('ph',ph) }}