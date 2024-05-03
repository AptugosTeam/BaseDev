/*
path: update.tpl
completePath: elements/Fields/Password/update.tpl
unique_id: ATZb20Br
*/
if(typeof fields.{{ field.column_name | friendly | lower }} !== 'undefined') {{ singleName }}.{{ field.column_name | friendly | lower }} = bcrypt.hashSync(fields.{{ field.column_name | friendly | lower }}, 10)