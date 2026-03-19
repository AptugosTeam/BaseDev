/*
path: update.tpl
completePath: elements/Fields/Password/update.tpl
unique_id: ATZb20Br
*/
if (data.{{ field.column_name | friendly }}) updatedData['{{ field.column_name | friendly }}'] = bcrypt.hashSync(data.{{ field.column_name | friendly }}, 10)
