/*
path: addToModel.tpl
completePath: elements/Programming/Crud/addToModel.tpl
display: Add to model
type: file
unique_id: addToModel
icon: f:prepareForSaving.svg
sourceType: javascript
options:
  - name: table
    display: Table
    type: dropdown
    options: >-
      return [...aptugo.store.getState().application.tables.map(({ unique_id,
      name }) => [unique_id, name])]
  - name: code
    display: Code
    type: function
children: []
*/
{% set table = element.values.table | tableData %}
{% set friendlyTableName = table.name | friendly %}
{% set addToModel %}
  {{ element.values.code | default( content | raw ) }}
{% endset %}

{{ add_setting( 'schema' ~ friendlyTableName  , addToModel) }}
