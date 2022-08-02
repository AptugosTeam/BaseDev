/*
path: cardActions.tpl
completePath: elements/Material-UI/Cards/cardActions.tpl
unique_id: 7k9qd8nA
options:
  - name: disableSpacing
    display: Disable Spacing
    type: checkbox
    options: ''
*/
{% set bpr %}
import CardActions from '@mui/material/CardActions'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<CardActions {% if element.values.disableSpacing %} disableSpacing {% endif %}>
{{ content | raw }}
</CardActions>
