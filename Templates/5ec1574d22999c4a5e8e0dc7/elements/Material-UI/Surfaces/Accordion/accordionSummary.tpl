/*
path: accordionSummary.tpl
completePath: elements/Material-UI/Accordion/accordionSummary.tpl
unique_id: B5K8NuI3
icon: f:accordionSummary.svg
options:
  - name: backgroundColor
    display: Background Color 
    type: text
  - name: color
    display: Color
    type: text
*/
{% set bpr %}
import AccordionSummary from '@mui/material/AccordionSummary'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import ExpandMoreIcon from '@mui/icons-material/ExpandMore'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<AccordionSummary sx={ {
  {% if element.values.backgroundColor %}
    backgroundColor: {{ element.values.backgroundColor|default('transparent') }},
  {% endif %}
  
  {% if element.values.color %}
    color:'{{ element.values.color|default('transparent') }}'
  {% endif %} 
} }
   
  {% if element.values.className %}
    className={ {{ element.values.className }} }
  {% endif %}
    expandIcon={<ExpandMoreIcon sx={ {
  {% if element.values.color %}
    color:'{{ element.values.color }}'
  {% endif %} } } />}
>
    {{ content | raw }}
</AccordionSummary>