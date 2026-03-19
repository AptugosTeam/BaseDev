/*
path: model.tpl
type: file
unique_id: 9TTs5yhr
icon: ico-field
*/
{% if fieldInfo.relationshipType == '1:m' %}
  {% set fieldInfo = fieldInfo|merge({'dataType': '[' ~ fieldInfo.dataType ~ ']'}) %}
{% endif %}
{% set datatype = fieldInfo.dataType %}
{% if fieldInfo.relationshipType == 'm:1' %}
  {{ add_setting('BackendPackages', '"mongoose-autopopulate" : "latest",') }}
  {% set extraPlugins = friendlyTableName ~ "Schema.plugin(mongooseAutoPopulate)" %}
  {% set extraImports = "const mongooseAutoPopulate = require('mongoose-autopopulate')\n" %}
  {% set relatedFieldInfo = fieldInfo.reference | fieldData %}
  {% set datatype = '{\ntype:' ~ fieldInfo.dataType ~ ',\nref: ' ~ '"' ~ relatedFieldInfo.table.name | friendly ~ '"' ~ ',\nautopopulate: true\n' ~ '}\n' %}
{% endif %}
{% set friendlyColumnName = field.column_name | friendly  %}
{{ friendlyColumnName ~ ': ' ~  datatype  ~ ',' }}