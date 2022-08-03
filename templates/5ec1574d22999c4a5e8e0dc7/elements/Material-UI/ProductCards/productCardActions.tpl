/*
path: productCardActions.tpl
completePath: elements/Material-UI/Cards/productCardActions.tpl
unique_id: 7k9RUSnA
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
