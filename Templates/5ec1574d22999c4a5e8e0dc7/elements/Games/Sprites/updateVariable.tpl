/*
path: updateVariable.tpl
keyPath: elements/Games/Sprites/updateVariable.tpl
unique_id: DUBMD30m
icon: f:rotate_auto.svg
options:
  - name: variableName
    display: Variable Name
    type: text
    options: ''
  - name: newValue
    display: New Value
    type: text
    options: ''
  - name: withoutThis
    display: Not Use This
    type: checkbox
*/
{% set variablePrefix = element.values.withoutThis == true ? '' : 'this.' %}

{{ variablePrefix }}{{ element.values.variableName }}={{ element.values.newValue }}