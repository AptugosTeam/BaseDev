/*
path: prepareForSaving.tpl
completePath: elements/Programming/Crud/prepareForSaving.tpl
display: Prepare Data for Saving
type: file
unique_id: prepareforsaving
icon: f:prepareForSaving.svg
sourceType: javascript
options:
  - name: table
    display: Table
    type: dropdown
    options: >-
      return [...aptugo.store.getState().application.tables.map(({ unique_id,
      name }) => [unique_id, name])]
  - name: field
    display: field
    type: dropdown
    options: return [...aptugo.tableUtils.getAllFields()]
  - name: value
    display: Value
    type: variable
children: []
*/
{% set theField = element.values.field | fieldData %}
data.{{ theField.column_name | friendly }} = {{ element.values.value | default( content | raw ) }}
