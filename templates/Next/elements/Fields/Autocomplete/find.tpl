/*
path: find.tpl
completePath: elements/Fields/Autocomplete/find.tpl
unique_id: t9Bzg4Oy
*/
{% set referencedField = field.reference | fieldData %}
{% if field.relationshipType == 'm:1' %}
  aggregate.push({ $lookup: {
    from: '{{ referencedField.table.name | friendly | lower }}',
    localField: '{{ field.column_name | friendly }}',
    foreignField: '_id',
    as: '{{ field.column_name | friendly }}'
  } }, { $unwind: { path: '${{ field.column_name | friendly }}' } })
{% elseif field.relationshipType == '1:m' %}
  aggregate.push({ $lookup: {
    from: '{{ referencedField.table.name | friendly | lower }}',
    localField: '{{ field.column_name | friendly }}',
    foreignField: '_id',
    as: '{{ field.column_name | friendly }}'
  } })
{% endif %}