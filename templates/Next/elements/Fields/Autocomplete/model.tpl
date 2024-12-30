/*
path: model.tpl
type: file
unique_id: 9TTs5aut
icon: ico-field
*/
{% if output.fieldInfo %}{% set fieldInfo = output.fieldInfo %}{% endif %}
{% set friendlyColumnName = field.column_name | friendly  %}
{% if fieldInfo.table.subtype == 'Firebase' %}
  {% set datatype = 'String' %}
  {% set rawString = friendlyColumnName ~ ': ' ~  datatype  ~ ',' %}
{% else %}
  {{ add_setting('BackendPackages', '"mongoose-autopopulate" : "latest",') }}
  {% set extraPlugins = friendlyTableName ~ "Schema.plugin(mongooseAutoPopulate)" %}
  {% set extraImports = "const mongooseAutoPopulate = require('mongoose-autopopulate')\n" %}
  {% set relatedFieldInfo = fieldInfo.reference | fieldData %}
  {% set datatype = fieldInfo.dataType %}
  {% if fieldInfo.relationshipType == '1:1' %}
    {% set fieldInfo = fieldInfo|merge({'dataType': fieldInfo.dataType}) %}
  {% elseif fieldInfo.relationshipType == '1:m' %}
    {% set datatype = '[{\ntype:' ~ fieldInfo.dataType ~ ',\nref: ' ~ '"' ~ relatedFieldInfo.table.name | friendly ~ '"' ~ ',\nautopopulate: true\n' ~ '}]\n' %}
  {% elseif output.fieldInfo.relationshipType == 'm:1' %}
    {% set datatype = '{\ntype:' ~ fieldInfo.dataType ~ ',\nref: ' ~ '"' ~ relatedFieldInfo.table.name | friendly ~ '"' ~ ',\nautopopulate: true\n' ~ '}\n' %}
  {% endif %}
  {% set rawString = friendlyColumnName ~ ': ' ~  datatype ~ ',' %}
{% endif %}
{% set output = output.merge({
  rawString: rawString,
}) %}
{{output|json_encode()}}