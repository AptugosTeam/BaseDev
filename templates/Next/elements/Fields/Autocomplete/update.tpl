/*
path: update.tpl
completePath: elements/Fields/Autocomplete/update.tpl
unique_id: zd6mrTlU
*/
{% set referencedField = field.reference | fieldData %}
{% set fieldInfo = field | fieldData %}

{% if field.relationshipType == '1:m' %}
  if( typeof req.body.{{ field.column_name | friendly }} !== 'undefined' && req.body.{{ field.column_name | friendly }}.length )  var {{ field.column_name | friendly }} = req.body.{{ field.column_name | friendly }}.map(item => item.value)
{% else %}
  if( typeof req.body.{{ field.column_name | friendly }} !== 'undefined' && req.body.{{ field.column_name | friendly }}.value )  var {{ field.column_name | friendly }} = req.body.{{ field.column_name | friendly }}.value
{% endif %}
