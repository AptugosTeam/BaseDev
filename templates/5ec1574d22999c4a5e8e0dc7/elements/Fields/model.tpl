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
{% if output.fieldInfo.relationshipType == 'm:1' %}
  {{ add_setting('BackendPackages', '"mongoose-autopopulate" : "latest",') }}
  {% set extraPlugins = friendlyTableName ~ "Schema.plugin(mongooseAutoPopulate)" %}
  {% set extraImports = "const mongooseAutoPopulate = require('mongoose-autopopulate')\n" %}
  {% set relatedFieldInfo = fieldInfo.reference | fieldData %}
  {% set datatype = '{\ntype:' ~ fieldInfo.dataType ~ ',\nref: ' ~ '"' ~ relatedFieldInfo.table.name | friendly ~ '"' ~ ',\nautopopulate: true\n' ~ '}\n' %}
{% endif %}
{% set friendlyColumnName = field.column_name | friendly  %}
{% set rawString = friendlyColumnName ~ ': ' ~  datatype  ~ ',' %}
{% set output = output.merge({
  rawString: rawString,
  extraPlugins: extraPlugins,
  extraImports: extraImports
}) %}
{{output|json_encode()}}