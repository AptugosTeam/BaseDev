/*
path: accordionDetails.tpl
completePath: elements/Material-UI/Accordion/accordionDetails.tpl
unique_id: KBm2vQFr
icon: f:accordionDetails.svg
options:
  - name: backgroundColor
    display: Background Color 
    type: text
  - name: color
    display: Color
    type: text
*/
{% set bpr %}
import AccordionDetails from '@mui/material/AccordionDetails'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<AccordionDetails sx={ {
  {% if element.values.backgroundColor %}
    backgroundColor:'{{ element.values.backgroundColor|default('transparent') }}',
  {% endif %}
  
  {% if element.values.color %}
    color:'{{ element.values.color|default('transparent') }}'
  {% endif %} 
} }>
{{ content | raw }}
</AccordionDetails>