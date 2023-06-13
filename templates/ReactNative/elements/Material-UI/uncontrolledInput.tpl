/*
path: uncontrolledInput.tpl
type: file
unique_id: EECbOrrq
icon: ico-uncontrolled-input
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
  - name: onChange
    display: On Change
    type: text
    options: ''
  - name: placeholder
    display: Placeholder
    type: text
    options: ''
  - name: variant
    display: Variant
    type: dropdown
    options: flat;outlined
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: theme
    display: Theme
    type: text
    options: ''
  - name: fieldname
    display: fieldname
    type: text
    options: ''
  - name: type
    display: Type
    type: dropdown
    options: text;password;date;number;textarea
  - name: leftIcon
    display: Icon (left size)
    type: dropdown
    options: email-outline;eye
  - name: underlineColor
    display: Underline Color
    type: text
  - name: activeUnderlineColor
    display: Underline Color (Active)
    type: text
  - name: placeholderTextColor
    display: PlaceHolder Text Color
    type: text
children: []
*/
{% set bpr %}
import { TextInput } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<TextInput
    mode="{{ element.values.variant|default('flat') }}"
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.placeholder %}placeholder="{{ element.values.placeholder }}"{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    {% if element.values.label %}label="{{ element.values.label }}"{% endif %}
    {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
    {% if element.values.theme %}theme={ {{ element.values.theme }} }{% endif %}
    {% if element.values.fieldname %}name={{ element.values.fieldname | textOrVariable}} {% endif %}
    {% if element.values.type == 'number' %}keyboardType='numeric'{% endif %}
    {% if element.values.type == 'password' %}secureTextEntry={true}{% endif %}
    {% if element.values.type == 'textarea' %}
      multiline
    {% endif %}
    outlineColor='transparent'
    activeOutlineColor='#3A528A'
    {% if element.values.value %}value={{ element.values.value }}{% endif %}
    {% if element.values.onChange %}onChangeText={ {{ element.values.onChange | replace({ '.target.value': '' }) | functionOrCall }} }{% endif %}
    {% if element.values.underlineColor %}underlineColor={ {{ element.values.underlineColor | textOrVariable }}}{% endif %}
    {% if element.values.activeUnderlineColor %}activeUnderlineColor={ {{ element.values.activeUnderlineColor | textOrVariable }}}{% endif %}
    {% if element.values.placeholderTextColor %}placeholderTextColor={ {{ element.values.placeholderTextColor | textOrVariable }}}{% endif %}
    {% if element.values.leftIcon %}left={<TextInput.Icon {% if element.values.placeholderTextColor %}iconColor={ {{ element.values.placeholderTextColor | textOrVariable }}}{% endif%} icon='{{element.values.leftIcon}}' />}{% endif %}
/>
