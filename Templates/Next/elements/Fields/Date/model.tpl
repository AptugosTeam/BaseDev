/*
path: model.tpl
keyPath: elements/Fields/Date/model.tpl
unique_id: cQlpmFt1
*/
{% set datatype = fieldInfo.dataType %}
{% set friendlyColumnName = field.column_name | friendly  %}
{{ friendlyColumnName }}: {
  type: {{ datatype }}
  {% if field.defaultToToday %}, default: Date.now{% endif %}
},