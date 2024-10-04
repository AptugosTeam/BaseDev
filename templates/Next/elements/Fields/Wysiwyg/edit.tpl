/*
path: edit.tpl
type: file
unique_id: L9zH85K4
icon: ico-field
sourceType: javascript
settings:
  - name: Packages
    value: '"quill": "^1.3.7","react-quill": "2.0.0",'
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
  {% include includeTemplate('FieldsWysiwygckeditor.tpl') with { 'field': field } %}
{% elseif field.editor == 'jodit' %}
  {% include includeTemplate('FieldsWysiwygjodit.tpl') with { 'field': field } %}
{% else %}
  {% include includeTemplate('FieldsWysiwygAptugo.tpl') with { 'field': field } %}
{% endif %}