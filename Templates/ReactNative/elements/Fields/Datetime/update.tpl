/*
path: update.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/ReactNative/elements/Fields/Datetime/update.tpl
keyPath: elements/Fields/Datetime/update.tpl
unique_id: lgSb4NQS
*/
if (data.{{ field.column_name | friendly }}) updatedData['{{ field.column_name | friendly }}'] = Timestamp.fromDate( new Date(userData.created) )