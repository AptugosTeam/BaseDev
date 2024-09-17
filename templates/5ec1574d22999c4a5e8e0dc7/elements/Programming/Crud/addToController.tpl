/*
path: addToController.tpl
completePath: elements/Programming/Crud/addToController.tpl
display: Add to Controller
type: file
unique_id: addToController
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
{% set addToController %}
  {{ element.values.code | default( content | raw ) }}
{% endset %}

{{ add_setting( 'controller' ~ friendlyTableName  , addToController) }}
