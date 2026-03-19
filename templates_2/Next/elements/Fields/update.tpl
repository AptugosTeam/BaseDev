/*
path: update.tpl
completePath: elements/Fields/update.tpl
unique_id: 1a0ACFGq
*/
if( typeof req.body.{{ field.column_name | friendly }} !== 'undefined') var { {{ field.column_name | friendly }} } = req.body