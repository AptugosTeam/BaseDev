/*
path: NumericFormat.tpl
completePath: elements/Experimental/NumericFormat.tpl
type: file
unique_id: D7MaXkBV
icon: f:NumberFormat.svg
sourceType: javascript
options:
  - name: content
    display: Content
    type: text
    options: ''
  - name: label
    display: Label
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: formatNumber
    display: Format number
    type: dropdown
    options: 
      return [['none', 'None'],['dotComma', 'Thousand separator "."; Decimal separator ","'],['commaDot', 'Thousand separator ","; Decimal separator "."']]
  - name: decimalScale
    display: Decimal Scale
    type: text
    options: ''
  - name: allowNegative
    display: Disable negative number
    type: checkbox
    settings:
      default: false
  - name: disabled
    display: Disable number
    type: checkbox
    settings:
      default: false
  - name: isAllowed
    display: Max value
    type: text
    options: ''
  - name: fieldFormat
    display: Use field format
    type: checkbox
    settings:
      default: false
  - name: onValueChange
    display: On value change
    type: function
    options: ''
    settings:
      propertyCondition: fieldFormat
      condition: true
      active: true
settings:
  - name: Packages
    value: |-
      "react-number-format": "5.2.0",
children: []
*/
{% set bpr %}
import { NumericFormat } from 'react-number-format'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% if element.values.fieldFormat %}
  {% set ph %}
    const {{ field.column_name | friendly }}TextFieldProps = {
      id: "filled-multiline-flexible",
      {% if element.values.DisableUnderline %}
          InputProps: { disableUnderline: true },
      {% endif %}
      {% if element.values.Autofocus %}autoFocus,{% endif %}
      {% if element.values.DisableVariable %}disabled: {{ element.values.DisableVariable | raw }} ,{% endif %}
      {% if field.placeholder %}placeholder: {{ field.placeholder | textOrVariable }},{% endif %}
      margin: '{{ element.values.margin|default("dense") }}',
      size: '{{ element.values.size|default("medium") }}',
      type: "number",
      multiline: true,
      maxRows: 4,
      variant: "{{ element.values.variant|default('standard') }}",
    };
  {% endset %}
  {{ save_delayed('ph',ph) }}
{% endif %}
  <NumericFormat 
      value= { {{ element.values.content | raw }}{{ content | raw }} }
      {% if element.values.disabled %}
        disabled={true}
      {% endif %}
      {% if element.values.decimalScale == 0 %}
        decimalScale={0}
        {% elseif element.values.decimalScale %}
        decimalScale={ {{ element.values.decimalScale | raw }} }
      {% endif %}
      {% if element.values.allowNegative %}
        allowNegative={false}
      {% endif %}
      {% if element.values.label %}
        label= { {{ element.values.label | textOrVariable }} }
      {% endif %}
      {% if element.values.className %}
        className={ {{ element.values.className }} }
      {% endif %}
      {% if element.values.formatNumber == "dotComma" %}
        thousandSeparator="."
        decimalSeparator=","
        {% elseif element.values.formatNumber == "commaDot" %}
          thousandSeparator=","
          decimalSeparator="."
        {% else %}
          decimalSeparator=","
      {% endif %}
      {% if element.values.fieldFormat %}
        displayType="input"
        customInput={TextField}
        {% if element.values.onValueChange %}
          onValueChange={ (values, sourceInfo) => { {{ element.values.onValueChange | raw }} } }
        {% endif %}
        {% else %}
        displayType="text"
      {% endif %}
      {% if element.values.isAllowed %}
        isAllowed=  {(values) => {
          const MAX_LIMIT = {{ element.values.isAllowed | raw }};
          const { floatValue } = values;
          return floatValue === undefined || floatValue <= MAX_LIMIT;
        }} 
      {% endif %}
  />