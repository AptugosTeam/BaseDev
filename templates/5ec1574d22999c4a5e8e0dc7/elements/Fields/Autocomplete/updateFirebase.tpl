/*
path: updateFirebase.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Autocomplete/updateFirebase.tpl
keyPath: elements/Fields/Autocomplete/updateFirebase.tpl
unique_id: 0W7xTXSM
*/
if (typeof data.{{ field.column_name | friendly }} !== 'undefined') updatedData['{{ field.column_name | friendly }}'] = !isNaN(data.{{ field.column_name | friendly }}) ? Number(data.{{ field.column_name | friendly }}) : data.{{ field.column_name | friendly }}