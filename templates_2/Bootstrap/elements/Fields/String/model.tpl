/*
path: model.tpl
type: file
unique_id: Naq5o3C5
icon: ico-field
*/
{% set isUnique = attribute(fieldInfo, 'validators.unique') %}
{% set isRequired = attribute(fieldInfo, 'validators.required') %}
{% set datatype = fieldInfo.dataType %}
{% set friendlyColumnName = field.column_name | friendly  %}
{{ friendlyColumnName }}: {
  type: {{ datatype }},
  {% if isUnique %} unique: true,{% endif %}
  {% if isRequired %} required: true{% endif %}
},