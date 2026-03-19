/*
path: CallDefinedFunction.tpl
keyPath: elements/Games/Snippets/CallDefinedFunction.tpl
unique_id: U50GzEbN
icon: f:phone_forwarded.svg
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
    display: Not Use This
    type: checkbox
  - name: othersClasses
    display: Others Classes
    type: text
    advanced: true
    required: true
    options: ''
*/
{% if element.values.withoutThis %}{{ element.values.function }}{% if element.values.othersClasses %}.{{ element.values.othersClasses }}{% endif %}({% if element.values.arguments %}{{ element.values.arguments }}{% endif %}){% else %}
this.{{ element.values.function }}{% if element.values.othersClasses %}.{{ element.values.othersClasses }}{% endif %}({% if element.values.arguments %}{{ element.values.arguments }}{% endif %}){% endif %}