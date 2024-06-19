/*
path: edit.tpl
type: file
unique_id: L9zH85K4
icon: ico-field
sourceType: javascript
settings:
  - name: Packages
    value: '"react-quill": "2.0.0",'
children: []
*/


{% set bpr %}
import FormControl from '@mui/material/FormControl'
import InputLabel from '@mui/material/InputLabel'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% if field.editor == 'ckeditor' %}
  {% include includeTemplate('FieldsWysiwygckeditor.tpl') with { 'field': field } %}
{% elseif field.editor == 'jodit' %}
  {% include includeTemplate('FieldsWysiwygjodit.tpl') with { 'field': field } %}
{% else %}
{% set bpr %}
import ReactQuill from 'react-quill'
import 'react-quill/dist/quill.snow.css'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
const quillModules = {
    toolbar: [
        [{ header: [1, 2, 3, 4, 5, 6, false] }],
        ["bold", "italic", "underline", "strike"],
        [{ color: [] }],
        [{ list:  "ordered" }, { list:  "bullet" }]
    ]
}
{% endset %}
{{ save_delayed('ph', ph) }}

<FormControl margin="dense" fullWidth>
  <ReactQuill 
    {% if element.values.ref %}
        ref={ {{element.values.ref}} }
    {% endif %}
    placeholder="{{ field.placeholder|default(field.prompt)|default(field.column_name) }}" theme="snow" 
    {% if element.values.UseCustomQuillModules %}
        modules={ {{element.values.CustomQuillModules}} }
    {% else %}
        modules={quillModules}
    {% endif %}
    value={ {{ tableName }}data.{{ field.column_name | friendly }} || ''} 
    onChange={e => handle{{ tableName }}Change('{{ field.column_name | friendly }}')(e.replace('<p><br></p><p><br></p>', '<p><br></p>'))}
  />
</FormControl>
{% endif %}