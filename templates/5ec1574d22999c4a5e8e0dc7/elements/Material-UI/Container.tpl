/*
path: Container.tpl
type: file
unique_id: 3NDAATVX
icon: f:Container.svg
helpText: >-
  The container centers your content horizontally. It's the most basic layout
  element.
options:
  - name: disableGutters
    display: Disable Gutters
    type: checkbox
    options: ''
  - name: fixed
    display: Fixed?
    type: checkbox
    options: ''
  - name: maxWidth
    display: Max Width
    type: dropdown
    options: lg;md;sm;xl;xs;false
  - name: className
    display: className
    type: styles
    options: ''
sourceType: javascript
children: []
*/
{% set bpr %}
import Container from '@mui/material/Container'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Container
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  {% if element.values.disableGutters %}disableGutters{% endif %}
  {% if element.values.fixed %}fixed{% endif %}
  {% if (element.values.maxWidth) %}
    {% if (element.values.maxWidth == 'false') %}
      maxWidth={false}
    {% else %}
      maxWidth="{{ element.values.maxWidth }}"
    {% endif %}
  {% endif %}
>
  {{ content | raw }}
</Container>
