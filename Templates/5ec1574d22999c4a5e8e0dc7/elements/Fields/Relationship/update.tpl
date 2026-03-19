/*
path: update.tpl
type: file
unique_id: o6XWyXA6
icon: ico-field
children: []
*/
{% set reference = field.reference | fieldData %}
if (data.{{ reference.table.name | friendly }}) {
  updatedData['{{ reference.table.name | friendly }}'] =  typeof data.{{ reference.table.name | friendly }} === 'string' ? JSON.parse(data.{{ reference.table.name | friendly }}) : data.{{ reference.table.name | friendly }}
}
