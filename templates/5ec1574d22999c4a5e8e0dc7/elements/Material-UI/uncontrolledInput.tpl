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
    options: standard;filled;outlined
  - name: margin
    display: Margin
    type: dropdown
    options: normal;dense;none
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: fieldname
    display: fieldname
    type: text
    options: ''
  - name: fullwidth
    display: Use full width?
    type: checkbox
  - name: type
    display: Type
    type: dropdown
    options: text;password;date;number;textarea
children: []
*/



{% set bpr %}
import TextField from '@mui/material/TextField'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<TextField
    variant="{{ element.values.variant|default('standard') }}"
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.placeholder %}placeholder={{ element.values.placeholder | textOrVariable }}{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    {% if element.values.margin %}margin="{{ element.values.margin }}"{% endif %}
    {% if element.values.label %}label={{ element.values.label | textOrVariable }}{% endif %}
    {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
    {% if element.values.fieldname %}name={{ element.values.fieldname | textOrVariable}} {% endif %}
    {% if element.values.type == 'textarea' %}
      multiline
      type="text"
    {% endif %}
    {% if element.values.type != 'textarea' %}
      type="{{ element.values.type|default('text') }}"
    {% endif %}
    {% if element.values.fullWidth %}fullWidth{% endif %}
    {% if element.values.value %}value={{ element.values.value }}{% endif %}
    {% if element.values.onChange %}onChange={ {{ element.values.onChange }} }{% endif %}
/>
