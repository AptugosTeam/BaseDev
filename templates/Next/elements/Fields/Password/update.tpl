/*
path: update.tpl
completePath: elements/Fields/Password/update.tpl
unique_id: ATZb20Br
*/
if(typeof fields.{{ field.column_name | friendly }} !== 'undefined') {{ singleName }}.{{ field.column_name | friendly }} = bcrypt.hashSync(fields.{{ field.column_name | friendly }}, 10)