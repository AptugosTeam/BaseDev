/*
path: productCard.tpl
completePath: elements/Material-UI/Cards/productCard.tpl
unique_id: 6cMXRUS3
icon: ico-text
helpText: >-
  Insert simple text anywhere. Can hold variables, code, and anything of your
  choice
sourceType: javascript
options:
  - name: sx
    display: Max Width (in px)
    type: text
    options: ''
  - name: class
    display: ClassName
    type: styles
    options: ''
childs:
  - name: Product Card Header
    element: productCardHeader
  - name: Product Card Media
    element: productCardMedia
  - name: Product Card Content
    element: productCardContent
  - name: Product Card Actions
    element: productCardActions
children: []
*/
{% set bpr %}
import Card from '@mui/material/Card'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Card sx={ { height: 'fit-content', {% if element.values.sx %} maxWidth:'{{ element.values.sx }}px' {% endif %}} }
  {% if element.values.class %}
    className={ {{element.values.class}} }
  {% endif %}
>
  {{ content | raw }}
</Card>

