/*
path: datatable.tpl
type: file
unique_id: asda67654
icon: ico-field
sourceType: javascript
children: []
*/
{% set referencedField = field.reference | fieldData %}
{% set referencedString = field.column_name | friendly  %}
{% if referencedField.table.subtype == 'Aptugo' %}
  {% if field.relationshipType == '1:1' %}
    {% set referencedString = referencedString ~ '.' ~ (referencedField.column_name | friendly) %}
  {% else %}
    {% set referencedString = referencedString ~ '.' ~ (referencedField.column_name | friendly) %}
  {% endif %}
{% endif %}
{ id: '{{ referencedString }}', header: '{{ field.column_name }}', type: 'string', size: 300 },