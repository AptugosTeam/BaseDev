/*
path: model.tpl
type: file
unique_id: uuidmodel
icon: ico-field
*/
{% set isUnique = attribute(fieldInfo, 'validators.unique') %}
{{ add_setting('BackendPackages', '"uuid": "9.0.0",') }}
{% set friendlyColumnName = field.column_name | friendly  %}
{% set rawString %}{{ friendlyColumnName }}: { type: String, default: uuidv4{% if isUnique %}, unique: true{% endif %} },{% endset %}
{% set output = output.merge({
  rawString: rawString,
  extraImports: "const { v4: uuidv4 } = require('uuid')\n"
}) %}
{{output|json_encode()}}