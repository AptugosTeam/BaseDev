/*
path: datatable.tpl
completePath: elements/Fields/datatable.tpl
unique_id: 1a0ACEEE
*/
{ id: '{{ field.column_name }}', header: '{{ field.displaylabel|default(field.column_name) }}', type: 'string', size: 300, renderValue: (cell) => { return cell.getValue() || '---'} },