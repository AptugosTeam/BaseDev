/*
path: datatable.tpl
completePath: elements/Fields/Datetime/datatable.tpl
unique_id: rrnXr6Eu
*/
{ id: 'When', type: 'string', size: 300, renderValue: (cell) => new Date(cell.getValue()).toString()},