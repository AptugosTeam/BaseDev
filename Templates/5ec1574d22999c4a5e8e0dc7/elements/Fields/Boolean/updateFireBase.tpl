/*
path: updateFireBase.tpl
keyPath: elements/Fields/Datetime/updateFireBase.tpl
unique_id: 53GfRZn9
*/
if(typeof data.{{ field.column_name | friendly }} !== 'undefined') updatedData['{{ field.column_name | friendly }}'] = data.{{ field.column_name | friendly }} === 'true'