/*
path: datatable.tpl
completePath: elements/Fields/Boolean/datatable.tpl
unique_id: 9yJvweWR
*/
{% if not field %}
{% set field = element.values.Field | fieldData %}
{% endif %}
{ id: '{{ field.column_name | friendly }}', header: '{{ field.displaylabel|default(field.column_name) }}', type: 'string', size: 300, renderValue: (cell) => { return cell.getValue() ? '✓' : '---'} },