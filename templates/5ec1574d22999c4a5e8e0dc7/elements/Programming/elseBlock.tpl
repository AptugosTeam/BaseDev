/*
path: elseBlock.tpl
type: file
unique_id: zT1b1904
icon: ico-condition
sourceType: javascript
options: [
  {
    name: "checkboxElseIf",
    display: "Use as else if",
    type: "checkbox",
    default: false,
    advanced: true
  },
  {
    name: "condition",
    display: "Condition",
    type: "text",
    default: "",
    advanced: true
  }
]
helpText: Define el bloque de código para el else
children: []
*/
{% if element.values.checkboxElseIf %}
  else if ({{ element.values.condition }}){
{% else %}
  } else {
{% endif %}
  {% if children %}
    {{ include('elseBlock.tpl') | raw }}
  {% else %}
    {{ content | raw }}
  {% endif %}
}