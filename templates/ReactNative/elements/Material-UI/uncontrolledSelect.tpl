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
    type: text
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
    value: '"react-native-select-dropdown": "^3.3.3",'
*/
{% set bpr %}
import SelectDropdown from 'react-native-select-dropdown'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<SelectDropdown
  {% if element.values.value %}defaultValue={{ element.values.value | textOrVariable }}{% endif %}
  {% if element.values.buttonText %}defaultButtonText={{ element.values.buttonText | textOrVariable }}{% endif %}
  data={ {{ element.values.options }} }
  buttonStyle={theme.inputSelector}
  buttonTextStyle={theme.inputSelectorText}
  {% if element.values.onChange %}onSelect={ {{ element.values.onChange }} }{% endif %}
  {% if element.values.dropdownStyle %}dropdownStyle={ {{ element.values.dropdownStyle }} }{% endif %}
  {% if element.values.dropdownOverlayColor %}dropdownOverlayColor={{ element.values.dropdownOverlayColor | textOrVariable }}{% endif %}
  {% if element.values.rowStyle %}rowStyle={ {{ element.values.rowStyle }} }{% endif %}
  {% if element.values.rowTextStyle %}rowTextStyle={ {{ element.values.rowTextStyle }} }{% endif %}
/>