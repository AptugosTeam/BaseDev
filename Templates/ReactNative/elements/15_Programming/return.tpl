/*
path: return.tpl
keyPath: elements/Programming/return.tpl
unique_id: pUt3Vptf
helpText: Return a value or JSX block from the current function, hook, or component
options:
  - name: returnValue
    display: Return Value
    helpText: Expression returned when the element has no child content
    type: text
    options: ''
*/
{% if not content %}return {{ element.values.returnValue }}{% else %}return ({{ content | raw }}){% endif %}
