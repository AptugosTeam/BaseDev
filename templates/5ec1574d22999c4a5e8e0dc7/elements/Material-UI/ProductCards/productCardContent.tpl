/*
path: productCardContent.tpl
completePath: elements/Material-UI/Cards/productCardContent.tpl
unique_id: M6RUSbz3
*/
{% set bpr %}
import CardContent from '@mui/material/CardContent'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<CardContent>
{{ content | raw }}
</CardContent>