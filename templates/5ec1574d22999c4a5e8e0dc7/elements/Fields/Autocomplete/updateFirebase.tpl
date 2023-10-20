/*
path: updateFirebase.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Autocomplete/updateFirebase.tpl
keyPath: elements/Fields/Autocomplete/updateFirebase.tpl
unique_id: 0W7xTXSM
*/
const datafield = data.{{ field.column_name | friendly }}
if (typeof datafield !== 'undefined') updatedData['{{ field.column_name | friendly }}'] = datafield === 'null' ? null : !isNaN(datafield) ? Number(datafield) : datafield