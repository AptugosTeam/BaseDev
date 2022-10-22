/*
path: prepareArrayForSelect.tpl
completePath: elements/Programming/Snippets/prepareArrayForSelect.tpl
type: file
unique_id: prepareArrayForSelect
icon: f:script.svg
sourceType: javascript
children: []
options:
  - name: InputVariable
    display: Source Variable
    type: variable
    options: ''
  - name: DestinationVariableName
    display: Destination Variable
    type: variable
    options: ''
    settings:
      default: 'preparedForSelect'
  - name: DisplayField
    display: Field to Display
    type: variable
    options: ''
  - name: FieldForValue
    display: Field for Value
    type: variable
    options: ''
    settings:
      default: '_id'
*/
{% include includeTemplate('useState.tpl') with { element: { values: { 'variableName': element.values.DestinationVariableName|default('preparedForSelect'), 'defaultValue': '[]'}}} %}
set{{ element.values.DestinationVariableName }}({{ element.values.InputVariable }}.map(individualRecord => {
  return { name: individualRecord.{{ element.values.DisplayField }}, value: individualRecord.{{ element.values.FieldForValue|default('_id') }} }
}))