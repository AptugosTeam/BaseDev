/*
path: quill.tpl
keyPath: elements/Fields/Wysiwyg/quill.tpl
unique_id: R8FIwULL
settings:
  - name: Packages
    value: '"quill": "^1.3.7","react-quill": "2.0.0",'
*/
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
  <InputLabel htmlFor='contentsInput' shrink>{{ field.prompt|default(field.column_name) }}</InputLabel>
  <QuillEditor
    modules={quillModules}
    placeholder="{{ field.placeholder|default(field.prompt)|default(field.column_name) }}"
    value={ {{ tableName }}data.{{ field.column_name | friendly }} || ''} 
    onChange={e => handle{{ tableName }}Change('{{ field.column_name | friendly }}')(e)}
    theme="snow"
  />
</FormControl>