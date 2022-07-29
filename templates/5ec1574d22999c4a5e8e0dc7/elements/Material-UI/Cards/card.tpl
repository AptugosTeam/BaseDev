/*
path: card.tpl
completePath: elements/Material-UI/Cards/card.tpl
unique_id: 6JQtnrW3
icon: ico-text
helpText: >-
  Insert simple text anywhere. Can hold variables, code, and anything of your
  choice
sourceType: javascript
options:
  - name: sx
    display: Max Width
    type: text
    options: ''
*/
{% set bpr %}
import Card from '@mui/material/Card'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Card sx={ { {% if element.values.sx %} maxWidth:{{ element.values.sx }} {% endif %}} }
>
  {{ content | raw }}
</Card>

