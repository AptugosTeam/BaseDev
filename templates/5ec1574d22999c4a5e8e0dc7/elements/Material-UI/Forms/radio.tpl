/*
path: radio.tpl
completePath: elements/Material-UI/Forms/radio.tpl
type: file
unique_id: Qeq87CZJ
icon: f:radio.svg
children: []
options:
  - name: value
    display: Value
    type: text
    options: ''
  - name: label
    display: label
    type: text
    options: ''
  - name: checked
    display: Checked
    type: function
    options: ''
    advanced: true
  - name: sx
    display: Extra Styles
    type: text
    options: ''
    advanced: true
  - name: onchange
    display: On Change
    type: function
    options: ''
    advanced: true
  - name: size
    display: Size
    type: dropdown
    options:
      return [['small', 'Small'], ['medium', 'Medium'], ['large', 'Large']]
    settings:
      default: medium
    advanced: true
  - name: name
    display: Name attribute of the input element
    type: text
    options: ''
    advanced: true
  - name: required
    display: Required
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: Color
    display: Color
    type: dropdown
    options: default;primary;secondary;error;info;success;warning
    settings:
      default: primary
*/

{% set bpr %}
  import Radio from '@mui/material/Radio'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.label %}
    {% set bpr %}
      import FormControlLabel from '@mui/material/FormControlLabel'
    {% endset %}
  {{ save_delayed('bpr',bpr) }}
{% endif %}
{% if element.values.label %}
  <FormControlLabel 
  
  {% if element.values.value %}
    value={{ element.values.value |textOrVariable }} 
    {% else %}
    {% endif %}
  label={{ element.values.label |textOrVariable }} control={
{% endif %}
<Radio
    {% if element.values.value %}
      value={{ element.values.value |textOrVariable }}
    {% endif %}
    {% if element.values.checked %}
      checked={ {{ element.values.checked}} }
    {% endif %}
    {% if element.values.sx %}
     sx={ { {{ element.values.sx }} } }
    {% endif %}
    {% if element.values.onChange %}
      onChange={ {{ element.values.onChange | functionOrCall }} }
    {% endif %}
    size='{{ element.values.size }}'
    {% if element.values.name %}
      name={{ element.values.name |textOrVariable }}
    {% endif %}
    {% if element.values.required %}
      required={true} 
    {% else %}
    {% endif %}
    {% if element.values.Color %}
      color='{{ element.values.Color }}'
    {% endif %}
/>
{% if element.values.label %}
  } />
{% endif %}
