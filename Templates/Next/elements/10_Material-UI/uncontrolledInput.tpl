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
  - name: onKeyDown
    display: On Key Down
    type: function
    advanced: true
    options: ''
  - name: placeholder
    display: Placeholder
    type: text
    options: ''
  - name: inputReferent
    display: inputReferent
    type: text
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
    options: text;password;date;number;textarea;numeric;file
    settings:
      default: text
      active: true
  - name: accept
    display: Accept File Types
    type: text
    options: ''
    advanced: true
    settings:
      propertyCondition: type
      condition: file
      active: true
  - name: capture
    display: Capture (for cameras)
    type: dropdown
    options: user;environment;none
    advanced: true
    settings:
      propertyCondition: type
      condition: file
      active: true
  - name: multiple
    display: Multiple files?
    type: checkbox
    advanced: true
    settings:
      propertyCondition: type
      condition: file
      active: true
  - name: inputProps
    display: Additional Input Props
    type: text
    advanced: true
    options: ''
    settings:
      propertyCondition: type
      condition: file
      active: true
  - name: shrink
    display: Shrink Label?
    type: checkbox
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
  - name: endAdornment
    display: Child is end adornment
    type: checkbox
    advanced: true
children: []
*/
{% if element.values.fullWidth %}{% set fullWidth = true %}{% endif %}
{% if element.values.readOnly %}{% set readOnly = true %}{% endif %}
{% set bpr %}import TextField from '@mui/material/TextField'{% endset %}{{ save_delayed('bpr', bpr) }}
{% if element.values.endAdornment %}{% set bpr %}import InputAdornment from '@mui/material/InputAdornment'{% endset %}{{ save_delayed('bpr', bpr) }}{% endif %}
{% set inputType = element.values.type|default('text') %}
<TextField
    variant="{{ element.values.variant|default('standard') }}"
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.placeholder %}placeholder={{ element.values.placeholder | textOrVariable }}{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    {% if element.values.inputReferent %}inputRef={{ element.values.inputReferent }}{% endif %}
    {% if element.values.error %}error={ {{ element.values.error }} }{% endif %}
    {% if element.values.helperText %}helperText={ {{ element.values.helperText }} }{% endif %}
    {% if element.values.margin %}margin="{{ element.values.margin }}"{% endif %}
    {% if element.values.size %}size="{{ element.values.size }}"{% endif %}
    {% if element.values.label %}label={{ element.values.label | textOrVariable }}{% endif %}
    {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
    {% if element.values.shrink %}InputLabelProps={ { shrink: true } }{% endif %}
    {% if element.values.fieldname %}name={{ element.values.fieldname | textOrVariable}} {% endif %}
    {% if inputType == 'file' %}
      type="file"
      {% if element.values.accept %}accept={{ element.values.accept | textOrVariable }}{% endif %}
      {% if element.values.capture %}capture={{ element.values.capture | textOrVariable }}{% endif %}
      {% if element.values.multiple %}
        InputProps={ { inputProps: { multiple: true } } }
      {% endif %}
      {% if element.values.inputProps %}InputProps={ {{ element.values.inputProps }} }{% endif %}
    {% else %}
      {% if readOnly %}
        inputProps={ {
          readOnly: true,
        } }
      {% endif %}
      {% if inputType == 'number' %}
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
      {% if inputType == 'numeric' %}
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
      {% if inputType == 'textarea' %}
        multiline
        type="text"
        {% if element.values.minRows %}minRows={{ element.values.minRows | textOrVariable}} {% endif %}
        {% if element.values.maxRows %}maxRows={{ element.values.maxRows | textOrVariable}} {% endif %}
      {% endif %}
      {% if inputType != 'textarea' and inputType != 'numeric' and inputType != 'file' %}
        type="{{ inputType }}"
      {% endif %}
    {% endif %}
    {% if fullWidth %}fullWidth{% endif %}
    {% if element.values.value and inputType != 'file' %}value={{ element.values.value | textOrVariable }}{% endif %}
    {% if element.values.onChange %}onChange={ {{ element.values.onChange | functionOrCall }} }{% endif %}
    {% if element.values.onKeyDown %}onKeyDown={ {{ element.values.onKeyDown | functionOrCall }} }{% endif %}
    {% if element.values.endAdornment and inputType != 'file' %}
      InputProps={ {
        endAdornment: <InputAdornment position="end">{{ content | raw }}</InputAdornment>
      } }
    {% endif %}
/>
