/*
path: slider.tpl
type: file
unique_id: rMl7agO8
icon: ico-field
helpText: Crea tu deslizador de volumen.
options:
  - name: defaultValue
    display: Default Value
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: function
    options: ''
  - name: Disabled
    display: Disabled?
    type: checkbox
  - name: valueLabelDisplay
    display: Label display
    type: dropdown
    options: auto;on;off
sourceType: javascript
children: []
*/
  {% set bpr %}
    import Slider from '@mui/material/Slider'
  {% endset %}
{{ save_delayed('bpr',bpr) }}
<Slider 
 {% if element.values.Disabled %}
 disabled 
 {% endif %}
 defaultValue={ {{ element.values.defaultValue|default(0) }} }
 valueLabelDisplay='{{ element.values.valueLabelDisplay|default("auto") }}'
 aria-label="Disabled slider" 
/>