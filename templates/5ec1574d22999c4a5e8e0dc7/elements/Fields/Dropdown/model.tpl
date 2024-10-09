/*
path: model.tpl
type: file
unique_id: dropd30n
icon: ico-field
*/
{% set onlyAllowed = attribute(fieldInfo, 'validators.onlyAllowed') %}
{% set datatype = fieldInfo.dataType %}
{% set friendlyColumnName = field.column_name | friendly  %}
{{ friendlyColumnName }}: {
  type: {{ datatype }},
  {% if onlyAllowed %}enum: [ {% for item in fieldInfo.options|split(';') %}'{{ item }}',{% endfor %}],{% endif %}
},