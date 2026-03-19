/*
path: model.tpl
type: file
unique_id: Msw6o3C5
icon: ico-field
*/
{% set isRequired = attribute(fieldInfo, 'validators.required') %}
{% set datatype = fieldInfo.dataType %}
{% set friendlyColumnName = field.column_name | friendly  %}
{% set friendlyTableName = table.name | friendly  %}
{% set extraPlugins %}
{{ friendlyTableName }}Schema.methods.toJSON = function () {
  const { __v, {{ friendlyColumnName }}, ...data } = this.toObject()
  return data
}
{% endset %}
{% set rawString %}
{{ friendlyColumnName }}: {
  type: {{ datatype }},
  {% if isRequired %} required: true{% endif %}
},
{% endset %}
{% set output = output.merge({
  rawString: rawString,
  extraPlugins: extraPlugins
}) %}
{{output|json_encode()}}