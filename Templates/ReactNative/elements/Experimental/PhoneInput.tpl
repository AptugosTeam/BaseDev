/*
path: PhoneInput.tpl
type: file
unique_id: PHCiOSrD
icon: ico-uncontrolled-input
options:
  - name: countryCode
    display: Default Country Code (e.g., US)
    type: text
    options: ''
  - name: callingCode
    display: Default Calling Code (e.g., +1)
    type: text
    options: ''
  - name: phoneNumber
    display: Default Phone Number
    type: text
    options: ''
  - name: hideDropdownIcon
    display: Hide Dropdown Icon
    type: checkbox
    options: ''
  - name: onChange
    display: On Change
    type: code
  - name: onChangeCountry
    display: On Change (Country)
    type: code
    options: ''
  - name: containerStyle
    display: Theme Container Style
    type: text
    options: ''
  - name: textInputStyle
    display: Theme Text Input Style
    type: text
    options: ''
  - name: flagButtonStyle
    display: Theme Flag Button Style
    type: text
    options: ''
  - name: codeTextStyle
    display: Theme Code Text Style
    type: text
    options: ''
  - name: dropDownImageStyle
    display: Theme Dropdown Image Style
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-native-phone-entry": "^0.2.3",'
*/

{% set bpr %}
import { PhoneInput, isValidNumber } from 'react-native-phone-entry'
{% endset %}
{{ save_delayed('bpr',bpr)}}

{% set hasDefaultValues = element.values.countryCode or element.values.callingCode or element.values.phoneNumber %}
{% set hasTheme = element.values.containerStyle or element.values.textInputStyle or element.values.flagButtonStyle or element.values.codeTextStyle or element.values.dropDownImageStyle %}

<PhoneInput
  {% if hasDefaultValues %}
  defaultValues={ {
    {% if element.values.countryCode %}countryCode: {{ element.values.countryCode | textOrVariable }},{% endif %}
    {% if element.values.callingCode %}callingCode: {{ element.values.callingCode | textOrVariable }},{% endif %}
    {% if element.values.phoneNumber %}phoneNumber: {{ element.values.phoneNumber | textOrVariable }},{% endif %}
  } }
  {% endif %}
  {% if element.values.onChange %}
  onChangeText={(text) => {
    {{ element.values.onChange }}
  } }
  {% endif %}
  {% if element.values.onChangeCountry %}
  onChangeCountry={(country) => {
    {{ element.values.onChangeCountry }}
  } }
  {% endif %}
  {% if element.values.hideDropdownIcon %}hideDropdownIcon{% endif %}
  {% if hasTheme %}
  theme={ {
    {% if element.values.containerStyle %}containerStyle: {{ element.values.containerStyle }},{% endif %}
    {% if element.values.textInputStyle %}textInputStyle: {{ element.values.textInputStyle }},{% endif %}
    {% if element.values.flagButtonStyle %}flagButtonStyle: {{ element.values.flagButtonStyle }},{% endif %}
    {% if element.values.codeTextStyle %}codeTextStyle: {{ element.values.codeTextStyle }},{% endif %}
    {% if element.values.dropDownImageStyle %}dropDownImageStyle: {{ element.values.dropDownImageStyle }},{% endif %}
  } }
  {% endif %}
/>