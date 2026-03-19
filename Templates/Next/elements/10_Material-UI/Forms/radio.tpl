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
    display: Label
    type: text
    options: ''
  - name: onchange
    display: On Change
    type: function
    options: ''
  - name: checked
    display: Checked
    type: function
    options: ''
    advanced: true
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: sx
    display: Extra Styles
    type: text
    options: ''
    advanced: true
  - name: Color
    display: Color
    type: dropdown
    advanced: true
    options:
      return [['default', 'Default'], ['primary', 'Primary'], ['secondary', 'Secondary'], ['error', 'Error'],['info', 'Info'],['success', 'Success'],['warning', 'Warning']] 
    settings:
      default: primary
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
  - name: DisableVariable
    display: Variable to disable input
    type: text
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
    {% if element.values.DisableVariable %}
      disabled={ {{ element.values.DisableVariable }} }
    {% endif %}
    {% if element.values.value %}
      value={{ element.values.value |textOrVariable }}
    {% endif %}
    label={{ element.values.label |textOrVariable }} control={
    <Radio 
{% else %}    
    <Radio
      {% if element.values.value %}
        value={{ element.values.value |textOrVariable }}
      {% endif %}
{% endif %}
      {% if element.values.checked %}
        checked={ {{ element.values.checked}} }
      {% endif %}
      {% if element.values.sx %}
        sx={ { {{ element.values.sx }} } }
      {% endif %}
      {% if element.values.onchange %}
        onChange={ {{ element.values.onchange | functionOrCall }} }
      {% endif %}
        color='{{ element.values.Color | default('primary') }}'
        size='{{ element.values.size | default('medium') }}'
      {% if element.values.className %}
        className={ {{element.values.className|raw}} }
      {% endif %}
      {% if element.values.name %}
        name={{ element.values.name |textOrVariable }}
      {% endif %}
      {% if element.values.required %}
        required={true} 
      {% endif %}
    />
{% if element.values.label %}
  } />
{% endif %}
