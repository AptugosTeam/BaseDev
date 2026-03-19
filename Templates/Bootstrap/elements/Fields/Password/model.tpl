/*
path: model.tpl
type: file
unique_id: Msw6o3C5
icon: ico-field
*/
{% set isRequired = attribute(fieldInfo, 'validators.required') %}
{% set datatype = fieldInfo.dataType %}
{% set friendlyColumnName = field.column_name | friendly  %}
{{ friendlyColumnName }}: {
  type: {{ datatype }},
  {% if isRequired %} required: true{% endif %}
},