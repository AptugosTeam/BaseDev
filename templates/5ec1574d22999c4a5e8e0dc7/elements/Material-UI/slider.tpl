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
  - name: color
    display: Color
    type: dropdown
    options: primary;secondary;warning;success;error;info
  - name: step
    display: Steps
    type: text
  - name: min
    display: Min
    type: text
  - name: max
    display: Max
    type: text
  - name: marks
    display: Marks
    type: checkbox
sourceType: javascript
children: []
*/
  {% set bpr %}
    import Slider from '@mui/material/Slider'
    import Box from '@mui/material/Box'
  {% endset %}
{{ save_delayed('bpr',bpr) }}
<Slider 
 {% if element.values.Disabled %}
 disabled 
 {% endif %}
 defaultValue={ {{ element.values.defaultValue|default(0) }} }
 valueLabelDisplay='{{ element.values.valueLabelDisplay|default("auto") }}'
 aria-label="Disabled slider"
color= "{{ element.values.color|default(primary) }}"
step={ {{element.values.step|default(1)}} }
{% if element.values.marks %} marks={true} {% endif %}
min={ {{element.values.min|default(0)}} }
max={ {{element.values.max|default(100)}} }
/>