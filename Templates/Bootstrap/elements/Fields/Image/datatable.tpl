/*
path: datatable.tpl
completePath: elements/Fields/Password/datatable.tpl
unique_id: rrnimgEu
*/
{ id: '{{ field.column_name }}', type: 'string', size: 300, renderValue: (cell) => <img src={`/img/${cell.getValue()}`} /> },
