/*
path: defineVariable.tpl
type: file
unique_id: E3aMS2PI
icon: ico-define-variable
helpText: Allows you to define a variable that will be used later
options:
  - name: variableName
    display: Name
    type: text
    options: ''
  - name: variableValue
    display: Value
    type: text
    options: ''
  - name: willbeModified
    display: Will it be modified?
    type: checkbox
    options: ''
  - name: serverSide
    display: Back-End Variable
    type: checkbox
settings:
  - name: ServerAddenum
    value: |-
      {% if element.values.serverSide %}
        {% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}
      {% endif %}
sourceType: javascript
children: []
*/
{% if not element.values.serverSide %}
  {% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}
{% endif %}