/*
path: update.tpl
completePath: elements/Fields/Autocomplete/update.tpl
unique_id: zd6mrTlU
*/
{% set referencedField = field.reference | fieldData %}
{% set fieldInfo = field | fieldData %}
{% if field.relationshipType == 'm:1' %}
{% elseif field.relationshipType == '1:1' %}
{% else %}
  {% include includeTemplate('update_1m.tpl') %}
{% endif %}
if( typeof req.body.{{ field.column_name | friendly }} !== 'undefined' && req.body.{{ field.column_name | friendly }}.value )  var {{ field.column_name | friendly }} = req.body.{{ field.column_name | friendly }}.value