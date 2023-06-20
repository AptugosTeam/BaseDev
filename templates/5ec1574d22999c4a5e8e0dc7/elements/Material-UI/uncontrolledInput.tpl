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
    type: function
    options: ''
  - name: placeholder
    display: Placeholder
    type: text
    options: ''
  - name: variant
    display: Variant
    type: dropdown
    options: standard;filled;outlined
  - name: size
    display: Size
    type: dropdown
    options: normal;small
  - name: margin
    display: Margin
    type: dropdown
    options: normal;dense;none
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: fieldname
    display: fieldname
    type: text
    options: ''
  - name: fullWidth
    display: Use full width?
    type: checkbox
  - name: type
    display: Type
    type: dropdown
    options: text;password;date;number;textarea
    settings:
      default: text
      active: true
  - name: minNum
    display: Min Number
    type: text
    settings:
      propertyCondition: type
      condition: number
      active: true
  - name: maxNum
    display: Max Number
    type: text
    settings:
      propertyCondition: type
      condition: number
      active: true
  - name: minRows
    display: MinRows
    type: text
    settings:
      propertyCondition: type
      condition: textarea
      active: true
  - name: maxRows
    display: MaxRows
    type: text
    settings:
      propertyCondition: type
      condition: textarea
      active: true
  - name: error
    display: Error
    type: variable
    options: ''
  - name: helperText
    display: Helper Text
    type: text
  - name: DisableVariable
    display: Variable to disable input
    type: text
children: []
*/
{% if element.values.fullwidth %}{% set fullWidth = element.values.fullwidth %}{% endif %}
{% if elements.values.fullWidth %}{% set fullWidth = element.values.fullWidth %}{% endif %}
{% set bpr %}
import TextField from '@mui/material/TextField'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<TextField
    variant="{{ element.values.variant|default('standard') }}"
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.placeholder %}placeholder={{ element.values.placeholder | textOrVariable }}{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    {% if element.values.error %}error={ {{ element.values.error }} }{% endif %}
    {% if element.values.helperText %}helperText={ {{ element.values.helperText }} }{% endif %}
    {% if element.values.margin %}margin="{{ element.values.margin }}"{% endif %}
    {% if element.values.size %}size="{{ element.values.size }}"{% endif %}
    {% if element.values.label %}label={{ element.values.label | textOrVariable }}{% endif %}
    {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
    {% if element.values.fieldname %}name={{ element.values.fieldname | textOrVariable}} {% endif %}
    {% if element.values.type == 'number' %}
      {% if element.values.minNum or element.values.maxNum %}
        inputProps={ {
            {% if element.values.minNum %}
              min: {{ element.values.minNum }},
            {% endif %}
            {% if element.values.maxNum %}
              max: {{ element.values.maxNum }}
            {% endif %}
          } }
      {% endif %}
    {% endif %}
    {% if element.values.type == 'textarea' %}
      multiline
      type="text"
      {% if element.values.minRows %}minRows={{ element.values.minRows | textOrVariable}} {% endif %}
      {% if element.values.maxRows %}maxRows={{ element.values.maxRows | textOrVariable}} {% endif %}
    {% endif %}
    {% if element.values.type != 'textarea' %}
      type="{{ element.values.type|default('text') }}"
    {% endif %}
    {% if fullWidth %}fullWidth{% endif %}
    {% if element.values.value %}value={{ element.values.value }}{% endif %}
    {% if element.values.onChange %}onChange={ {{ element.values.onChange | functionOrCall }} }{% endif %}
/>
