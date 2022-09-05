/*
path: card.tpl
completePath: elements/Material-UI/Cards/card.tpl
unique_id: 6JQtnrW3
*/
{% set bpr %}
import Card from '@mui/material/Card'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Card
  {% if element.values.elevation %}elevation={ {{ element.values.elevation }} }{% endif %}
>
  {{ content | raw }}
</Card>