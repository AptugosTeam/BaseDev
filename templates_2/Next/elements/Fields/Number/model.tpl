/*
path: model.tpl
completePath: >-
  /Users/ari/Aptugo/BaseDev/templates/templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Number/model.tpl
keyPath: elements/Fields/Number/model.tpl
unique_id: SPWHx7vM
*/
{% set datatype = fieldInfo.dataType %}
{% set friendlyColumnName = field.column_name | friendly  %}
{{ friendlyColumnName }}: {
  type: {{ datatype }}
},