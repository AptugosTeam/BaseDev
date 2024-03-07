/*
path: FAIconPicker.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Experimental/FAIconPicker.tpl
icon: f:Skeleton.svg
type: file
unique_id: hFATHDCA
sourceType: javascript
settings:
  - name: Packages
    value: '"@fortawesome/fontawesome-svg-core": "6.3.0","@fortawesome/free-solid-svg-icons": "6.3.0","@fortawesome/react-fontawesome": "0.2.0",'
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
