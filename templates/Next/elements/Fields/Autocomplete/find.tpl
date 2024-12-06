/*
path: find.tpl
completePath: elements/Fields/Autocomplete/find.tpl
unique_id: t9Bzg4Oy
*/
{% set referencedField = field.reference | fieldData %}
{% if field.relationshipType == 'm:1' %}
  options.populate.push({ path: '{{ field.column_name | friendly }}' })
{% elseif field.relationshipType == '1:m' %}
  options.populate.push({ path: '{{ field.column_name | friendly }}' })
{% endif %}