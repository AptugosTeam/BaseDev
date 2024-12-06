/*
path: searchWithFuse.tpl
type: file
unique_id: EEdcmaxrq
icon: ico-search
helpText: Search engine that allows you to search within a variable
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
  - name: readOnly
    display: Read Only?
    type: checkbox
  - name: fullWidth
    display: Use full width?
    type: checkbox
  - name: type
    display: Type
    type: dropdown
    options: text;password;date;datetime-local;number;textarea;numeric
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
  - name: minLength
    display: Min chars
    type: text
    settings:
      propertyCondition: type
      condition: numeric
      active: true
  - name: maxLength
    display: Max chars
    type: text
    settings:
      propertyCondition: type
      condition: numeric
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
  - name: DisableVariable
    display: Variable to disable input
    type: text
  - name: endAdornment
    display: Child is end adornment
    type: checkbox
    advanced: true
settings:
  - name: BackendPackages
    value: '"fuse.js": "latest",'
children: []
*/
{% if element.values.fullWidth %}{% set fullWidth = true %}{% endif %}
{% if element.values.readOnly %}
  {% set readOnly = true %}
{% endif %}
{% set bpr %}
import TextField from '@mui/material/TextField'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% if element.values.endAdornment %}
{% set bpr %}
import InputAdornment from '@mui/material/InputAdornment'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% endif %}
<TextField
    {% if element.values.id %}id="{{ element.values.id }}"{% endif %}
    variant="{{ element.values.variant|default('standard') }}"
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.placeholder %}placeholder={{ element.values.placeholder | textOrVariable }}{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    {% if element.values.margin %}margin="{{ element.values.margin }}"{% endif %}
    {% if element.values.size %}size="{{ element.values.size }}"{% endif %}
    {% if element.values.label %}label={{ element.values.label | textOrVariable }}{% endif %}
    {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
    {% if element.values.fieldname %}name={{ element.values.fieldname | textOrVariable}} {% endif %}
    {% if readOnly %}
      inputProps={ {
        readOnly: true,
      } }
    {% endif %}
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
    {% if element.values.type == 'numeric' %}
        inputProps={ {
            inputMode: 'numeric',
            pattern: '[0-9]*',
            {% if element.values.minLength %}
              minLength: {{ element.values.minLength }},
            {% endif %}
            {% if element.values.maxLength %}
              maxLength: {{ element.values.maxLength }}
            {% endif %}
          } }
    {% endif %}
    {% if element.values.type == 'textarea' %}
      multiline
      type="text"
      {% if element.values.minRows %}minRows={{ element.values.minRows | textOrVariable}} {% endif %}
      {% if element.values.maxRows %}maxRows={{ element.values.maxRows | textOrVariable}} {% endif %}
    {% endif %}
    {% if element.values.type != 'textarea' and element.values.type != 'numeric' %}
      type="{{ element.values.type|default('text') }}"
    {% endif %}
    {% if fullWidth %}fullWidth{% endif %}
    {% if element.values.value %}value={{ element.values.value }}{% endif %}
    {% if element.values.onChange %}onChange={ {{ element.values.onChange | functionOrCall }} }{% endif %}
    {% if element.values.endAdornment %}
      InputProps={ {
        endAdornment: <InputAdornment position="end">{{ content | raw }}</InputAdornment>
      } }
    {% endif %}
/>