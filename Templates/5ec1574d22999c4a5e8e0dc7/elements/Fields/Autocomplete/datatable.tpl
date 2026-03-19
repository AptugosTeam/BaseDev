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
  {% elseif field.relationshipType == '1:m' %}
    {% set referencedString = referencedString %}
  {% else %}
    {% set referencedString = referencedString ~ '.' ~ (referencedField.column_name | friendly) %}
  {% endif %}
{% endif %}
{
  id: '{{ referencedString }}',
  header: '{{ field.displaylabel|default(field.column_name) }}',
  type: 'string',
  size: 300,
  renderValue: (cell) => {
    let value = cell.getValue()
    {% if field.relationshipType == '1:m' %}
      value = value?.map(x=>x.{{ referencedField.column_name | friendly }}).join(", ")
      return value || '---'
    {% else %}
      if (typeof value === 'object') return value.{{ referencedField.column_name | friendly }}
      else return value || '---'
    {% endif %}
  }
},