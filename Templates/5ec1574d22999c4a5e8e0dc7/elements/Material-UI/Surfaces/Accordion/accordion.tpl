/*
path: accordion.tpl
completePath: elements/Material-UI/Accordion/accordion.tpl
unique_id: WCeFNW3P
icon: f:../../../Z-Icons/accordion.svg
options:
  - name: disabled
    display: Disabled?
    type: checkbox
  - name: className
    display: className
    type: styles
  - name: width
    display: Width
    type: text
  - name: padding
    display: Padding
    type: text
  - name: margin
    display: Margin
    type: text
  - name: backgroundColor
    display: Background Color 
    type: text
  - name: color
    display: Color
    type: text
  - name: onChange
    display: on Change
    type: text
  - name: expanded
    display: Open/Close Variable
    type: text
childs:
  - name:  accordionSummary
    element: accordionSummary
  - name:  accordionDetails
    element: accordionDetails
*/
{% set bpr %}
import Accordion from '@mui/material/Accordion'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Accordion {% if element.values.expanded %} expanded={ {{ element.values.expanded }} } {% endif %} {% if element.values.onChange %} onChange={ (e,expanded) => { {{ element.values.onChange }} }}{% endif %} sx={ {
  
  {% if element.values.width %}
    width:'{{ element.values.width|default('100%') }}',
  {% endif %} 
  
  {% if element.values.padding %}
    padding:'{{ element.values.padding|default('0') }}',
  {% endif %}

  {% if element.values.margin %}
    margin:'{{ element.values.margin|default('0') }}',
  {% endif %}
  
  {% if element.values.backgroundColor %}
    backgroundColor:'{{ element.values.backgroundColor|default('transparent') }}',
  {% endif %}
  
  {% if element.values.color %}
    color:'{{ element.values.color|default('transparent') }}'
  {% endif %} 
} }
{% if element.values.isDisabled == 'true' %}
    disabled
{% endif %}
{% if element.values.className %}
    className={ {{ element.values.className }} }
{% endif %}
>{{ content | raw }}
</Accordion>