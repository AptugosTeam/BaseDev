/*
path: datatable.tpl
completePath: elements/Fields/Password/datatable.tpl
unique_id: rrnimgEu
*/
{% set path = '/img/${cell.getValue()}' %}
{% if field.gcloud == '1' %}{% set path = '${cell.getValue()}' %}{% endif %}
{ id: '{{ field.column_name }}', type: 'string', size: 300, renderValue: (cell) => <img src={`{{ path }}`} /> },
