/*
path: FAIconPicker.tpl
type: file
unique_id: hFATHDCA
sourceType: javascript
options:
  - name: value
    display: Value
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: function
    options: ''
children: []
*/
{% set bpr %}
import FontAwesomeIconPicker from '@components/IconPicker/IconPicker'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<FontAwesomeIconPicker 
    {% if element.values.value %}value={{ element.values.value }}{% endif %}
    {% if element.values.onChange %}onChange={ {{ element.values.onChange }} }{% endif %}
/>
