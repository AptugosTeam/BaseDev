/*
path: update.tpl
completePath: elements/Fields/Computed/update.tpl
unique_id: hcosdddstez
*/
updatedData['{{ field.column_name | friendly }}'] = { type: 'Point', coordinates: JSON.parse(data.{{ field.column_name | friendly }}) }
