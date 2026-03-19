/*
path: datatable.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Currency/datatable.tpl
keyPath: elements/Fields/Currency/datatable.tpl
unique_id: pFBZqtsn
*/
{ id: '{{ field.column_name | friendly }}', header: '{{ field.displaylabel|default(field.column_name) }}', type: 'string', size: 300, renderValue: (cell) => { return new Intl.NumberFormat('{{ field.locale|default('en-US') }}', { style: 'currency', currency: '{{ field.currency|default('USD') }}' }).format(cell.getValue()) || '---'} },