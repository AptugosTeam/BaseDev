/*
path: model.tpl
type: file
unique_id: comput3C5
icon: ico-field
*/
{% set isUnique = attribute(fieldInfo, 'validators.unique') %}
{% set isRequired = attribute(fieldInfo, 'validators.required') %}
{% set datatype = fieldInfo.datatype %}
{% set friendlyColumnName = field.column_name | friendly  %}
{{ friendlyColumnName }}: {
  type: {{ datatype }},
  {% if isUnique %} unique: true,{% endif %}
  {% if isRequired %} required: true{% endif %}
},