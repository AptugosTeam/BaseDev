/*
path: rating.tpl
completePath: elements/Material-UI/Forms/rating.tpl
type: file
unique_id: Wrw98VXK
icon: f:rating.svg
children: []
options:
  - name: value
    display: Initial Value
    type: text
    options: ''
  - name: max
    display: Max Value
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: function
    options: ''
  - name: size
    display: Icon Size
    type: dropdown
    options: return [['small','Small'], ['medium','Medium'], ['large','Large']]
  - name: precision
    display: Increment Value
    type: text
    options: ''
    advanced: true
  - name: readOnly
    display: Read Only
    type: checkbox
    options: ''
    settings:
      default: false
    advanced: true
  - name: name
    display: Field Name
    type: text
    options: ''
    advanced: true
*/

{% set bpr %}
import Rating from '@mui/material/Rating'
{% endset %}
{{ save_delayed('bpr',bpr) }}


<Rating
  {% if element.values.value %}
    value={ {{ element.values.value }} } 
  {% endif %}
  {% if element.values.max %}
    max={ {{ element.values.max }} }
  {% endif %}
  {% if element.values.onChange %}
    onChange={ {{ element.values.onChange }} }
  {% endif %}
  {% if element.values.size %}
    size={ '{{ element.values.size }}' }
  {% endif %}
  {% if element.values.precision %}
    precision={ {{ element.values.precision }} }
  {% endif %}
  {% if element.values.readOnly %}
    readOnly={true}
  {% endif %}
  {% if element.values.name %}
    name={ '{{ element.values.name }}' }
  {% endif %}
/>