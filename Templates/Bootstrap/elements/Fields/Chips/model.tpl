/*
path: model.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Chips/model.tpl
keyPath: elements/Fields/Chips/model.tpl
unique_id: oqNBwQVM
*/
{% set isUnique = attribute(fieldInfo, 'validators.unique') %}
{% set isRequired = attribute(fieldInfo, 'validators.required') %}
{% set datatype = fieldInfo.dataType %}
{% set friendlyColumnName = field.column_name | friendly  %}
{{ friendlyColumnName }}: [{
  type: {{ datatype }},
  {% if isUnique %} unique: true,{% endif %}
  {% if isRequired %} required: true{% endif %}
}],