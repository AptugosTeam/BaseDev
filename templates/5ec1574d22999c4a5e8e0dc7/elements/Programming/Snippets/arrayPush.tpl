/*
path: arrayPush.tpl
completePath: elements/Programming/Snippets/arrayPush.tpl
type: file
unique_id: arraypush34
icon: f:arrayPush.svg
sourceType: javascript
helpText: Inserts a value into an existing array
options:
  - name: variableName
    display: Array Variable Name
    type: text
    options: ''
  - name: variableValue
    display: Value
    type: text
    options: ''
children: []
*/
{{ element.values.variableName }}.push({{ element.values.variableValue|default(content | raw)}})
