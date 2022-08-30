/*
path: UploadMultipleImages.tpl
completePath: elements/Experimental/UploadMultipleImages.tpl
type: file
unique_id: AcXumHAq
icon: file.svg
helpText: Allows you to upload multiple image files by selection or drag and drop
options:
  - name: classname
    display: ClassName
    type: styles
    options: ''
  - name: value
    display: Initial Value
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: text
    options: ''
  - name: innerText
    display: Text for dropzone
    type: text
    options: ''
    default: "Drag 'n' drop some files here, or click to select files"
settings:
  - name: Packages
    value: '"react-dropzone": "^11.4.2",'
children: []
*/
{% set bpr %}
import MultipleFileUpload from '../components/MultipleFileUpload'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<MultipleFileUpload
  {% if element.values.value %}files={{ element.values.value | textOrVariable }}{% endif %}
  {% if element.values.innerText %}innerText={{ element.values.innerText | textOrVariable }}{% endif %}
  {% if element.values.classname %}className={ {{ element.values.classname }} }{% endif %}
  {% if element.values.onChange %}onChange={
    (files) => {
      {{ element.values.onChange }}
    }
  }{% endif %}
/>
