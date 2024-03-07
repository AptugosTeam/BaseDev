/*
path: datatable.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Boolean/datatable.tpl
keyPath: elements/Fields/Boolean/datatable.tpl
unique_id: 9yJvweWR
*/
{ id: '{{ field.column_name | friendly }}', header: '{{ field.displaylabel|default(field.column_name) }}', type: 'string', size: 300, renderValue: (cell) => { return cell.getValue() ? '✓' : '---'} },