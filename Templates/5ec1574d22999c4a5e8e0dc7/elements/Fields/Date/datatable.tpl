/*
path: datatable.tpl
completePath: elements/Fields/Date/datatable.tpl
unique_id: rrkkwdEu
*/
{ id: '{{ field.column_name }}', type: 'string', size: 300, renderValue: (cell) => { return new Date( new Date(cell.getValue()).valueOf() + new Date().getTimezoneOffset() * 60000 ).toLocaleDateString('en-CA') }},