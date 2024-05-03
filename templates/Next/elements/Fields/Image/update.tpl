/*
path: update.tpl
completePath: elements/Fields/Image/update.tpl
unique_id: hILFvubz
*/
if(typeof fields.{{ field.column_name | friendly | lower }} !== 'undefined') {{ singleName }}.{{ field.column_name | friendly | lower }} = fields.{{ field.column_name | friendly | lower }}