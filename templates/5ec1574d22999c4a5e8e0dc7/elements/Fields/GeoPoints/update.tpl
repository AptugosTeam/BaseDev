/*
path: update.tpl
completePath: elements/Fields/Computed/update.tpl
unique_id: hcosdddstez
*/
if (data.{{ field.column_name | friendly }}) data.{{ field.column_name | friendly }} = JSON.parse(data.{{ field.column_name | friendly }})
if (data.{{ field.column_name | friendly }}.coordinates) data.{{ field.column_name | friendly }} = data.{{ field.column_name | friendly }}.coordinates
updatedData['{{ field.column_name | friendly }}'] = { type: 'Point', coordinates: {{ field.column_name | friendly }} || [] }
