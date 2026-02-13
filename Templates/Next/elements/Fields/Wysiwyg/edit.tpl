/*
path: edit.tpl
type: file
unique_id: L9zH85K4
icon: ico-field
sourceType: javascript
children: []
*/
{% set bpr %}
import FormControl from '@mui/material/FormControl'
import InputLabel from '@mui/material/InputLabel'
import Input from '@mui/material/Input'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% if field.editor == 'ckeditor' %}
  {% include includeTemplate('FieldsWysiwygckeditor.tpl') with { 'field': field } %}
{% elseif field.editor == 'quill' %}
  {% include includeTemplate('FieldsWysiwygquill.tpl') with { 'field': field } %}
{% else %}
  {% include includeTemplate('FieldsWysiwygjodit.tpl') with { 'field': field } %}
{% endif %}