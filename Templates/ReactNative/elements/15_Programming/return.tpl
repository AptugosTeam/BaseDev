/*
path: return.tpl
keyPath: elements/Programming/return.tpl
unique_id: pUt3Vptf
options:
  - name: returnValue
    display: Return Value
    type: text
    options: ''
*/
{% if not content %}return {{ element.values.returnValue }}{% else %}return ({{ content | raw }}){% endif %}