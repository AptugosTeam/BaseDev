/*
path: productCardActions.tpl
completePath: elements/Layouts/ProductCards/productCardActions.tpl
unique_id: 7MX9RUSn
icon: f:productCardActions.svg
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
<CardActions 
{% if element.values.disableSpacing %} 
  disableSpacing 
{% endif %}>
{{ content | raw }}
</CardActions>
