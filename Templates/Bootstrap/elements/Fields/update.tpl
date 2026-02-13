/*
path: update.tpl
completePath: elements/Fields/update.tpl
unique_id: 1a0ACFGq
*/
if(typeof data.{{ field.column_name | friendly }} !== 'undefined') updatedData['{{ field.column_name | friendly }}'] = data.{{ field.column_name | friendly }}
