/*
path: uncontrolledSelect.tpl
type: file
unique_id: KZo70Wel
icon: ico-uncontrolled-select
sourceType: javascript
options:
  - name: value
    display: Value
    type: text
    options: ''
  - name: buttonText
    display: Text when no item is selected 
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: code
    options: ''
  - name: options
    display: Options
    type: text
    options: ''
  - name: dropdownStyle
    display: Dropdown Style
    type: text
    options: ''
  - name: dropdownOverlayColor
    display: Dropdown Overlay Color
    type: text
    options: ''
  - name: rowStyle
    display: Row Style
    type: text
    options: ''
  - name: rowTextStyle
    display: Row Text Style
    type: text
    options: ''
children: []
settings:
  - name: Packages
    value: '"@react-native-picker/picker": "2.11.1",'
*/
{% set bpr %}
import { Picker } from '@react-native-picker/picker'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Picker
  mode='dropdown'
  {% if element.values.value %}selectedValue={{ element.values.value | textOrVariable }}{% endif %}
  {% if element.values.onChange %}
    onValueChange={(itemValue, itemIndex) => {{ element.values.onChange }} }
  {% endif %}
>{ {{ element.values.options }}.map((group) => (
  <Picker.Item label={group.Name} value={group._id} />
))}</Picker>
