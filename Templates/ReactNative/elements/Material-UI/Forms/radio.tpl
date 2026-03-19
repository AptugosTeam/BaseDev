/*
path: radio.tpl
type: file
unique_id: Qeq87CZJ
icon: ico-radio
children: []
options:
  - name: checked
    display: Checked
    type: text
    options: ''
  - name: onchange
    display: On Change
    type: text
    options: ''
  - name: value
    display: Value
    type: text
    options: ''
  - name: name
    display: Name
    type: text
    options: ''
  - name: label
    display: label
    type: text
    options: ''
*/
{% set bpr %}
import { RadioButton } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<RadioButton
  value={{ element.values.value | textOrVariable }}
  status={{ element.values.checked | textOrVariable }}
  {% if element.values.Action %}onPress={ {{ element.values.Action | functionOrCall }} }{% endif %}
/>