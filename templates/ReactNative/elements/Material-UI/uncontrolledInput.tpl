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
    {% if element.values.type == 'textarea' %}
      multiline
      type="text"
    {% endif %}
    {% if element.values.type != 'textarea' %}
      type="{{ element.values.type|default('text') }}"
    {% endif %}
    outlineColor='transparent'
    activeOutlineColor='#3A528A'
    {% if element.values.value %}value={{ element.values.value }}{% endif %}
    {% if element.values.onChange %}onChangeText={ {{ element.values.onChange }} }{% endif %}
/>
