/*
path: update.tpl
completePath: elements/Fields/GeoPoints/update.tpl
unique_id: hcosdddstez
*/

var {{ field.column_name | friendly }} = { type: 'Point', coordinates: [0, 0] }
if (req.body.{{ field.column_name | friendly }} && typeof req.body.{{ field.column_name | friendly }} !== 'object') req.body.{{ field.column_name | friendly }} = JSON.parse(req.body.{{ field.column_name | friendly }})
if (req.body.{{ field.column_name | friendly }}?.coordinates) req.body.{{ field.column_name | friendly }} = req.body.{{ field.column_name | friendly }}.coordinates
if (req.body.{{ field.column_name | friendly }} && req.body.{{ field.column_name | friendly }}.coordinates) {{ field.column_name | friendly }} = { type: 'Point', coordinates:  req.body.{{ field.column_name | friendly }}.coordinates || [] }