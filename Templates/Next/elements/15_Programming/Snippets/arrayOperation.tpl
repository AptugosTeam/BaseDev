/*
path: arrayOperation.tpl
completePath: elements/Programming/Snippets/arrayOperation.tpl
type: file
unique_id: arrayoperation
icon: f:arrayOperation.svg
sourceType: javascript
helpText: Performs different operations in Arrays
options:
  - name: operation
    display: Operation to perform
    type: dropdown
    options: 'Filter matching values;Shuffle;Push'
  - name: variableName
    display: Array Variable Name
    type: text
    options: ''
  - name: variableValue
    display: Value
    type: text
    options: ''
    settings:
      propertyCondition: operation
      condition: Push
  - name: helperVariable
    display: Helper Variable
    type: text
    options: ''
children: []
*/
{% if element.values.operation == 'Push' %}
  {{ element.values.variableName }}.push({{ element.values.variableValue|default(content | raw)}})
{% elseif element.values.operation == 'Shuffle' %}
  {{ element.values.variableName }}.sort(() => Math.random() - 0.5)
{% else %}
  {{ element.values.variableName }} = {{ element.values.variableName }}.filter(function (el) {
    return !{{ element.values.helperVariable }}.includes(el)
  })
{% endif %}



