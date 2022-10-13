/*
path: radio.tpl
completePath: elements/Material-UI/Forms/radio.tpl
type: file
unique_id: Qeq87CZJ
icon: f:radio.svg
children: []
options:
  - name: checked
    display: Checked
    type: text
    options: ''
  - name: onchange
    display: On Change
    type: text
    options: ''
  - name: value
    display: Value
    type: text
    options: ''
  - name: name
    display: Name
    type: text
    options: ''
  - name: label
    display: label
    type: text
    options: ''
  - name: sx
    display: Extra Styles
    type: text
    options: ''
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
  <FormControlLabel value={{ element.values.value | textOrVariable }} label={{ element.values.label | textOrVariable }} control={
{% endif %}
<Radio
    {% if element.values.checked %}
      checked={{ element.values.checked | textOrVariable }}
    {% endif %}
    {% if element.values.value %}
      value={{ element.values.value | textOrVariable }}
    {% endif %}
    {% if element.values.name %}
      name={{ element.values.name | textOrVariable }}
      checked={{ element.values.checked |textOrVariable }}
    {% endif %}
    {% if element.values.onchange %}
      onChange={{ element.values.onchange |textOrVariable }}
    {% endif %}
    {% if element.values.value %}
      value={{ element.values.value |textOrVariable }}
    {% endif %}
    {% if element.values.name %}
      name={{ element.values.name |textOrVariable }}
    {% endif %}
    {% if element.values.sx %}
     sx={ { {{ element.values.sx }} } }
    {% endif %}
/>
{% if element.values.label %}
  } />
{% endif %}