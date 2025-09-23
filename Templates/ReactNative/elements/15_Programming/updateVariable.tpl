/*
path: updateVariable.tpl
unique_id: DUBMD30m
icon: ico-update-variable
order: 3
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
{{ variablePrefix }}{{ element.values.variableName }} ={% if element.children %}{{ content | raw }}{% else %} {{ element.values.newValue }}{% endif %}