/*
path: datatable.tpl
keyPath: elements/Fields/Date/datatable.tpl
unique_id: zTNCGNUK
*/
{% if not field %}
{% set field = element.values.Field | fieldData %}
{% endif %}
{% set dateFormat = "${(date.getUTCMonth() + 1).toString().padStart(2, '0')}/${date.getUTCDate().toString().padStart(2, '0')}/${date.getUTCFullYear()}" %}
{% if field.dateFormat == 'DD/MM/YYYY' %}
  {% set dateFormat = "${date.getUTCDate().toString().padStart(2, '0')}/${(date.getUTCMonth() + 1).toString().padStart(2, '0')}/${date.getUTCFullYear()}" %}
{% endif %}
{
  id: '{{ field.column_name | friendly }}',
  header: '{{ field.displaylabel|default(field.column_name) }}',
  type: 'string',
  size: 300,
  renderValue: (cell) => {
    const date = new Date(cell.getValue())
    return `{{ dateFormat }}`
  }
},