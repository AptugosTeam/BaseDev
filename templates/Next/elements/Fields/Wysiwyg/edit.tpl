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
  {% include includeTemplate('FieldsWysiwygckeditor.tpl') with { 'field': field } %}
{% elseif field.editor == 'jodit' %}
  {% include includeTemplate('FieldsWysiwygjodit.tpl') with { 'field': field } %}
{% else %}
  {% set bpr %}
  import dynamic from 'next/dynamic'
  import 'react-quill/dist/quill.snow.css'
  const QuillEditor = dynamic(() => import('react-quill'), { ssr: false })
  {% endset %}
  {{ save_delayed('bpr', bpr) }}
  {% set ph %}
  const quillModules = {
    toolbar: [
        [{ font: [] }],
        [{ header: [1, 2, 3, 4, 5, 6, false] }],
        ["bold", "italic", "underline", "strike"],
        [{ color: [] }, { background: [] }],
        [{ script:  "sub" }, { script:  "super" }],
        ["blockquote", "code-block"],
        [{ list:  "ordered" }, { list:  "bullet" }],
        [{ indent:  "-1" }, { indent:  "+1" }, { align: [] }],
        ["link", "image", "video"],
        ["clean"],
    ]
  }
  {% endset %}
  {{ save_delayed('ph', ph) }}
  <FormControl margin="normal" size="medium" variant='standard' fullWidth>
    <InputLabel htmlFor='contentsInput' shrink>Contents</InputLabel>
    <QuillEditor
      modules={quillModules}
      placeholder="{{ field.placeholder|default(field.prompt)|default(field.column_name) }}"
      value={ {{ tableName }}data.{{ field.column_name | friendly | lower }} || ''} 
      onChange={e => handle{{ tableName }}Change('{{ field.column_name | friendly | lower }}')(e)}
      theme="snow"
    />
  </FormControl>
{% endif %}