/*
path: datatable.tpl
completePath: elements/Fields/Datetime/datatable.tpl
unique_id: rrnXr6Eu
*/
{% if not field %}
{% set field = element.values.Field | fieldData %}
{% endif %}
{ id: '{{ field.column_name }}', header: '{{ field.displaylabel|default(field.column_name) }}', type: 'string', size: 300, renderValue: (cell) => { return new Date(cell.getValue()).toString()}},