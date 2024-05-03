/*
path: update.tpl
completePath: elements/Fields/update.tpl
unique_id: 1a0ACFGq
*/
if(typeof fields.{{ field.column_name | friendly | lower }} !== 'undefined') {{ singleName }}.{{ field.column_name | friendly | lower }} = fields.{{ field.column_name | friendly | lower }}