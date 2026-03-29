/*
path: selectDropdown.tpl
type: file
unique_id: unfNSeLd
icon: ico-uncontrolled-select
sourceType: javascript
options:
  - name: options
    display: Options
    type: text
    options: ''
  - name: buttonText
    display: Text when no item is selected 
    type: text
    options: ''
  - name: onChange
    display: On Select
    type: code
    options: ''
  - name: buttonTextAfterSelection
    display: Button Text After Selection
    type: code
    options: ''
  - name: rowTextForSelection
    display: Row Text For Selection
    type: code
    options: ''
  - name: disabled
    display: Disabled
    type: variable
    options: ''
  - name: buttonStyle
    display: Button Style
    type: styles
    options: ''
  - name: buttonTextStyle
    display: Button Text Style
    type: styles
    options: ''
  - name: dropdownStyle
    display: Dropdown Style
    type: styles
    options: ''
  - name: dropdownOverlayColor
    display: Dropdown Overlay Color
    type: text
    options: ''
  - name: rowStyle
    display: Row Style
    type: styles
    options: ''
  - name: rowTextStyle
    display: Row Text Style
    type: styles
    options: ''
  - name: renderDropdownIcon
    display: Custom Dropdown Icon
    type: code
    options: ''
  - name: dropdownIconColor
    display: Dropdown Icon Color
    type: text
    options: ''
  - name: dropdownIconPosition
    display: Dropdown Icon Position
    type: dropdown
    options: left;right
  - name: search
    display: Enable Search
    type: checkbox
    settings:
      default: false
  - name: searchPlaceHolder
    display: Search Placeholder Text
    type: text
    options: ''
    settings:
      propertyCondition: search
      condition: true
  - name: customRow
    display: Render Customized Row Child
    type: code
    options: ''
children: []
settings:
  - name: Packages
    value: '"react-native-select-dropdown": "^3.3.3", "lodash": "^4.17.23",'
*/
{% set bpr %}
import SelectDropdown from 'react-native-select-dropdown'
{% endset %}
{{ save_delayed('bpr', bpr) }}

{% set iconColor = element.values.dropdownIconColor | default('white') %}

<SelectDropdown
  data={ {{ element.values.options }} }
  onSelect={(selectedItem, index) => {
    {{ element.values.onChange }}
  }}
  buttonTextAfterSelection={(selectedItem, index) => {
    {% if element.values.buttonTextAfterSelection %}
    {{ element.values.buttonTextAfterSelection }}
    {% else %}
    return selectedItem?.Name || selectedItem?.name || selectedItem?.label || selectedItem
    {% endif %}
  }}
  rowTextForSelection={(item, index) => {
    {% if element.values.rowTextForSelection %}
    {{ element.values.rowTextForSelection }}
    {% else %}
    return item?.Name || item?.name || item?.label || item
    {% endif %}
  }}
  {% if element.values.buttonText %}defaultButtonText={{ element.values.buttonText | textOrVariable }}{% endif %}
  {% if element.values.disabled %}disabled={ {{ element.values.disabled }} }{% endif %}
  {% if element.values.buttonStyle %}buttonStyle={ {{ element.values.buttonStyle }} }{% endif %}
  {% if element.values.buttonTextStyle %}buttonTextStyle={ {{ element.values.buttonTextStyle }} }{% endif %}
  {% if element.values.dropdownStyle %}dropdownStyle={ {{ element.values.dropdownStyle }} }{% endif %}
  {% if element.values.dropdownOverlayColor %}dropdownOverlayColor={{ element.values.dropdownOverlayColor | textOrVariable }}{% endif %}
  {% if element.values.rowStyle %}rowStyle={ {{ element.values.rowStyle }} }{% endif %}
  {% if element.values.rowTextStyle %}rowTextStyle={ {{ element.values.rowTextStyle }} }{% endif %}
  renderDropdownIcon={(isOpened) => {
    {% if element.values.renderDropdownIcon %}
      {{ element.values.renderDropdownIcon }}
    {% else %}
      return isOpened ? (
        <Iconify icon="mdi:chevron-up" color={{ iconColor | textOrVariable }} size={24} />
      ) : (
        <Iconify icon="mdi:chevron-down" color={{ iconColor | textOrVariable }} size={24} />
      )
    {% endif %}
  }}
  {% if element.values.dropdownIconPosition %}dropdownIconPosition={{ element.values.dropdownIconPosition | textOrVariable }}{% endif %}
  {% if element.values.search %}search{% endif %}
  {% if element.values.searchPlaceHolder %}searchPlaceHolder={{ element.values.searchPlaceHolder | textOrVariable }}{% endif %}
  {% if element.values.customRow %}renderCustomizedRowChild={(item, index) => {
    {{ element.values.customRow }}
    } }
  {% endif %}
/>
