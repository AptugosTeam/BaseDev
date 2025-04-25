/*
path: updateFireBase.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Number/updateFireBase.tpl
keyPath: elements/Fields/Number/updateFireBase.tpl
unique_id: yEO43LIE
*/
if(typeof data.{{ field.column_name | friendly }} !== 'undefined') updatedData['{{ field.column_name | friendly }}'] = Number(data.{{ field.column_name | friendly }})