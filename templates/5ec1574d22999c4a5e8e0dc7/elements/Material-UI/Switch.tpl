/*
path: Switch.tpl
type: file
unique_id: rCl7agO5
icon: ico-check-box
options:
  - name: Checked
    display: Checked Variable
    type: text
    options: ''
  - name: OnClick
    display: OnClick
    type: text
    options: ''
  - name: label
    display: label
    type: text
  - name: margin
    display: margin
    type: dropdown
    options: dense;normal;none
  - name: style
    display: Extra Styles
    type: text
    options: ''
  - name: size
    display: Size
    type: dropdown
    options: small;medium
    settings:
      default: medium
  - name: disabled
    display: Disabled
    type: variable
    options: ''
    advanced: true
    settings:
      active: true
  - name: effect
    display: Display ripple animation
    type: checkbox
    advanced: true
    settings:
      default: true
sourceType: javascript
children: []
*/
{% set bpr %}
    import Switch from '@mui/material/Switch'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.label %}
  {% set bpr %}
    import FormControl from '@mui/material/FormControl'
    import FormControlLabel from '@mui/material/FormControlLabel'
  {% endset %}
{{ save_delayed('bpr',bpr) }}
  <FormControl margin='{{ element.values.margin|default("dense") }}'>
  <FormControlLabel control={
{% endif %}
  <Switch
  {% if element.values.Checked %}
    checked={ {{ element.values.Checked }} }
  {% endif %}
  {% if element.values.OnClick %}
      onChange={ ()=> { {{ element.values.OnClick }} } }
  {% endif %}
  {% if element.values.style %}
    style={ {{element.values.style}} }
  {% endif %}
  {% if element.values.size %} 
    size={ "{{element.values.size}}" } 
  {% endif %}
  {% if element.values.disabled %} 
    disabled={ {{element.values.disabled}} } 
  {% endif %}
  {% if element.values.effect == false %}
    disableRipple= { true }
  {% endif %}
  />
{% if element.values.label %}
  }
  label={{ element.values.label|textOrVariable }}
  />
  </FormControl>
{% endif %}