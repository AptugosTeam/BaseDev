/*
path: slider.tpl
type: file
unique_id: rMl7agO8
order: 30
icon: f:../../Z-Icons/slider.svg
options:
  - name: defaultValue
    display: Default Value
    type: text
    options: ''
  - name: value
    display: Value
    type: text
    options: ''
    advanced: true
  - name: onChange
    display: On Change
    type: function
    options: ''
  - name: onChangeCommitted
    display: On Change Committed
    type: function
    options: ''
  - name: valueLabelDisplay
    display: Label display
    type: dropdown
    options: return [['auto','Mouse Hover'], ['on','Always'], ['off','Never']]
  - name: color
    display: Color
    type: dropdown
    options: primary;secondary;warning;success;error;info
  - name: step
    display: Steps
    type: text
    advanced: true
  - name: min
    display: Min
    type: text
    advanced: true
  - name: max
    display: Max
    type: text
    advanced: true
  - name: marks
    display: Marks
    type: checkbox
    advanced: true
  - name: Disabled
    display: Disabled?
    type: checkbox
    advanced: true
sourceType: javascript
children: []
*/
  {% set bpr %}
    import Slider from '@mui/material/Slider'
    import Box from '@mui/material/Box'
  {% endset %}
{{ save_delayed('bpr',bpr) }}
<Slider 
  defaultValue={ {{ element.values.defaultValue|default(0) }} }
  {% if element.values.value %}
    value={ {{ element.values.value }} }
  {% endif %}
  onChange={(e, newValue)=>{ {{element.values.onChange}} } }
  {% if element.values.onChangeCommitted %}onChangeCommitted={(e, newValue)=>{ {{element.values.onChangeCommitted}} } }{% endif %}
  valueLabelDisplay='{{ element.values.valueLabelDisplay|default("auto") }}'
  color= "{{ element.values.color|default(primary) }}"
  step={ {{element.values.step|default(1)}} }
  {% if element.values.marks %}
    marks
  {% endif %}
  min={ {{element.values.min|default(0)}} }
  max={ {{element.values.max|default(100)}} }
  {% if element.values.Disabled %}
    disabled 
  {% endif %}
/>