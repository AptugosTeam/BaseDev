/*
path: uncontrolledSelect.tpl
type: file
unique_id: KZo70Wel
icon: ico-uncontrolled-select
sourceType: javascript
options:
  - name: label
    display: Label
    type: text
    options: ''
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
  - name: showall
    display: Show "All" for empty
    type: checkbox
  - name: margin
    display: Margin
    type: dropdown
    options: none;normal;dense
  - name: fullwidth
    display: Use full width?
    type: checkbox
  - name: className
    display: ClassName
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
  {% if element.values.value %}defaultValue={{ element.values.value }}{% endif %}
  {% if element.values.buttonText %}defaultButtonText="{{ element.values.buttonText }}"{% endif %}
  data={ {{ element.values.options }} }
  buttonStyle={theme.inputSelector}
  buttonTextStyle={theme.inputSelectorText}
  {% if element.values.onChange %}onSelect={ {{ element.values.onChange }} }{% endif %}
/>
