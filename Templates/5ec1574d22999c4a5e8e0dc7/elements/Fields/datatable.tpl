/*
path: datatable.tpl
completePath: elements/Fields/datatable.tpl
unique_id: 1a0ACEEE
*/
{% if not field %}
{% set field = element.values.Field | fieldData %}
{% endif %}
{ id: '{{ field.column_name | friendly }}', header: '{{ field.displaylabel|default(field.column_name) }}', type: 'string', size: 300, renderValue: (cell) => { return cell.getValue() || '---'} },