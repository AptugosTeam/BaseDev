/*
path: datatable.tpl
completePath: elements/Fields/Image/datatable.tpl
unique_id: rrnimgEu
*/
{% if field.autogeneratethumbnail and field.thumbnailField %}
  {% set thumbnailField = field.thumbnailField | fieldData %}
  {% set thumbnailFieldName = thumbnailField.column_name | friendly %}
  {% if field.values.storage != 'Local' %}
    {% set path = '${cell.row.original.' ~ thumbnailFieldName ~ '}' %}
  {% else %}
    {% set path = '/img/${cell.row.original.' ~ thumbnailFieldName ~ '}' %}
  {% endif %}
{% else %}
  {% if field.values.storage != 'Local' %}
    {% set path = '${cell.getValue()}' %}
  {% else %}
    {% set path = '/img/${cell.getValue()}' %}
  {% endif %}
{% endif %}

{ id: '{{ field.column_name | friendly }}', type: 'string', size: 300, renderValue: (cell) => <img src={`{{ path }}`} /> },
