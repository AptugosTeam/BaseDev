/*
path: update.tpl
completePath: elements/Fields/GeoPoints/update.tpl
unique_id: hcosdddstez
*/
updatedData['{{ field.column_name | friendly }}'] = { type: 'Point', coordinates: [0, 0] }
if (data.{{ field.column_name | friendly }} && typeof data.{{ field.column_name | friendly }} !== 'object') data.{{ field.column_name | friendly }} = JSON.parse(data.{{ field.column_name | friendly }})
if (data.{{ field.column_name | friendly }}?.coordinates) data.{{ field.column_name | friendly }} = data.{{ field.column_name | friendly }}.coordinates
if (data.{{ field.column_name | friendly }}) updatedData['{{ field.column_name | friendly }}'] = { type: 'Point', coordinates:  data.{{ field.column_name | friendly }} || [] }
