/*
path: updateFireBase.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Datetime/updateFireBase.tpl
keyPath: elements/Fields/Datetime/updateFireBase.tpl
unique_id: 52GfUZn9
*/
if(typeof data.{{ field.column_name | friendly }} !== 'undefined') updatedData['{{ field.column_name | friendly }}'] = Timestamp.fromDate(new Date( data.{{ field.column_name | friendly }} ))