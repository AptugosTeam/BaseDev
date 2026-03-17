/*
path: model.tpl
type: file
unique_id: 9TTs5yhr
icon: ico-field
*/
{% if output.fieldInfo %}{% set fieldInfo = output.fieldInfo %}{% endif %}
{% if fieldInfo.relationshipType == '1:m' %}
  {% set fieldInfo = fieldInfo|merge({'dataType': '[' ~ fieldInfo.dataType ~ ']'}) %}
{% endif %}
{% set datatype = fieldInfo.dataType %}
{% set friendlyColumnName = field.column_name | friendly  %}
{% set rawString = friendlyColumnName ~ ': ' ~  datatype  ~ ',' %}
{% set output = output.merge({
  rawString: rawString,
}) %}
{{output|json_encode()}}