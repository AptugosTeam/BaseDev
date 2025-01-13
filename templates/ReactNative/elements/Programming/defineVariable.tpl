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
sourceType: javascript
children: []
*/
{% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}