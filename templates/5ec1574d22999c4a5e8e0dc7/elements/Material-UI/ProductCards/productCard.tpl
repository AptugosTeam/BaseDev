/*
path: productCard.tpl
completePath: elements/Material-UI/Cards/productCard.tpl
unique_id: 6JQRUSW3
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
childs:
  -name: Card Header
    element: productCardHeader
  - name: Card Content
    element: productCardContent
*/
{% set bpr %}
import Card from '@mui/material/Card'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Card sx={ { height: 'fit-content', {% if element.values.sx %} maxWidth:'{{ element.values.sx }}px' {% endif %}} }
>
  {{ content | raw }}
</Card>

