/*
path: updateFireBase.tpl
keyPath: elements/Fields/Datetime/updateFireBase.tpl
unique_id: 52GfRZn9
*/
if(typeof data.{{ field.column_name | friendly }} !== 'undefined') updatedData['{{ field.column_name | friendly }}'] = !isNaN(data.{{ field.column_name | friendly }}) ? Number(data.{{ field.column_name | friendly }}) : data.{{ field.column_name | friendly }}