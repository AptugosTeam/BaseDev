/*
path: wysiwyg.tpl
keyPath: elements/Interact/wysiwyg.tpl
unique_id: DamI0dlO
icon: ico-field
sourceType: javascript
options:
  - name: placeholder
    display: Placeholder 
    type: text
  - name: value
    display: Value 
    type: text
    required: true
  - name: onChangeWysiwyg
    display: On Change Wysiwyg
    type: function
    required: true
    advanced: true
  - name: onSaveData
    display: On Save Data 
    type: function
    required: true
    advanced: true
settings:
  - name: Packages
    value: '"react-quill": "2.0.0",'
*/
{% set bpr %}
import FormControl from '@mui/material/FormControl'
import InputLabel from '@mui/material/InputLabel'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set bpr %}
import ReactQuill from 'react-quill'
import 'react-quill/dist/quill.snow.css'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
const {{ element.unique_id }}quillModules = {
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
<FormControl margin="dense" fullWidth>
  <ReactQuill
    placeholder={{ element.values.placeholder | textOrVariable }}
    theme="snow"
    modules={ {{element.unique_id}}quillModules}
    value={ {{element.values.value | default('') }} }
    onChange={(e) => {
        e.replace('<p><br></p><p><br></p>', '<p><br></p>')
        {{ element.values.onChangeWysiwyg }}
        {{ element.values.onSaveData }}
      } 
    }
  />
</FormControl>