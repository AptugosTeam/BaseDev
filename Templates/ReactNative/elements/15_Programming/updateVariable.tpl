/*
path: updateVariable.tpl
unique_id: DUBMD30m
icon: ico-update-variable
helpText: Assign a new value to an existing variable or instance property
order: 3
options:
  - name: variableName
    display: Variable Name
    helpText: Target variable or property name that will receive the new value
    type: text
    options: ''
  - name: newValue
    display: New Value
    helpText: Expression assigned when the element has no child content
    type: text
    options: ''
  - name: withoutThis
    display: Not Use This
    helpText: Generate a plain variable assignment instead of prefixing the target with this.
    type: checkbox
*/
{% set variablePrefix = element.values.withoutThis == true ? '' : 'this.' %}
{{ variablePrefix }}{{ element.values.variableName }}={% if element.children %}{{ content | raw }}{% else %}{{ element.values.newValue }}{% endif %}
