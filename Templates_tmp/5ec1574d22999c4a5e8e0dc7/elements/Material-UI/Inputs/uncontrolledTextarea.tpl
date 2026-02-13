/*
path: uncontrolledTextarea.tpl
type: file
unique_id: txareaOrrq
icon: f:../../Z-Icons/uncontrolledTextArea.svg
sourceType: javascript
order: 51
options:
  - name: label
    display: Label
    type: text
    options: ''
  - name: value
    display: Value
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: text
    options: ''
  - name: placeholder
    display: Placeholder
    type: text
    options: ''
  - name: minRows
    display: Minimum Rows
    type: text
    options: ''
  - name: maxRows
    display: Maximum Rows
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
children: []
*/
{% set bpr %}
import TextareaAutosize from '@mui/material/TextareaAutosize'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<TextareaAutosize
  {% if element.values.minRows %}minRows="{{ element.values.minRows }}"{% endif %}
  {% if element.values.maxRows %}maxRows="{{ element.values.maxRows }}"{% endif %}
  {% if element.values.label %}label="{{ element.values.label }}"{% endif %}
  {% if element.values.label %}aria-label="{{ element.values.label }}"{% endif %}
  {% if element.values.placeholder %}placeholder="{{ element.values.placeholder }}"{% endif %}
  {% if element.values.value %}defaultValue={{ element.values.value }}{% endif %}
  {% if element.values.style %}style={ {{element.values.style}} }{% endif %}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  {% if element.values.onChange %}onChange={ {{ element.values.onChange }} }{% endif %}
/>
