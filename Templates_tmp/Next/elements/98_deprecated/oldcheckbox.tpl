/*
path: checkbox.tpl
type: file
unique_id: rCl7agO3
icon: ico-check-box
internalUse: true
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
  - name: threeway
    display: Use a 3 states checkbox
    type: checkbox
  - name: Switch
    display: Use a Switch instead of a checkbox
    type: checkbox
sourceType: javascript
children: []
*/
{% if (element.values.Switch) %}
  {% set compo = 'Switch' %}
  {% set bpr %}
    import Switch from '@mui/material/Switch'
  {% endset %}
{% else %}
  {% if (element.values.threeway) %}
    {% set compo = 'ThreeCheckbox' %}
    {% set bpr %}
      import ThreeCheckbox from '../components/ThreeCheckbox'
    {% endset %}
  {% else %}
    {% set compo = 'Checkbox' %}
    {% set bpr %}
      import Checkbox from '@mui/material/Checkbox'
    {% endset %}
  {% endif %}
{% endif %}
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
  <{{ compo }}
  {% if element.values.Checked %}
    checked={ {{ element.values.Checked }} }
  {% endif %}
  {% if element.values.OnClick %}
    {% if compo == 'Checkbox' %}
      onClick={ ()=> { {{ element.values.OnClick }} } }
      {% if element.values.disabled%} 
        disabled={ {{element.values.disabled}} } 
      {% endif %}
      {% if element.values.effect == false %}
        disableRipple= { true }
      {% endif %}
    {% endif %}
    {% if compo == 'Switch' %}
      onChange={ ()=> { {{ element.values.OnClick }} } }
      {% if element.values.disabled%} 
        disabled={ {{element.values.disabled}} } 
      {% endif %}
    {% endif %}
    {% if compo == 'ThreeCheckbox' %}
      onChange={ ()=> { {{ element.values.OnClick }} } }
    {% endif %}
  {% endif %}
  />
{% if element.values.label %}
  }
  label={{ element.values.label|textOrVariable }}
  />
  </FormControl>
{% endif %}