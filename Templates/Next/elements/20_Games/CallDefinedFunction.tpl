/*
path: CallDefinedFunction.tpl
display: Call Scene Function
keyPath: elements/Games/CallDefinedFunction.tpl
unique_id: U50GzEbN
icon: ico-no-es-una-teta
options:
  - name: function
    display: Function to Call
    type: text
    options: ''
  - name: arguments
    display: Arguments
    type: text
    options: ''
  - name: withoutThis
    display: Do not use "This"
    type: checkbox
    advanced: true
  - name: othersClasses
    display: Others Classes
    type: text
    advanced: true
    options: ''
*/
{% if element.values.withoutThis %}{{ element.values.function }}{% if element.values.othersClasses %}.{{ element.values.othersClasses }}{% endif %}({% if element.values.arguments %}{{ element.values.arguments }}{% endif %}){% else %}
this.{{ element.values.function }}{% if element.values.othersClasses %}.{{ element.values.othersClasses }}{% endif %}({% if element.values.arguments %}{{ element.values.arguments }}{% endif %}){% endif %}