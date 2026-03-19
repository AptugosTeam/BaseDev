/*
path: cardContent.tpl
completePath: elements/Material-UI/Cards/cardContent.tpl
unique_id: M6MWRbz3
*/
{% set bpr %}
import CardContent from '@mui/material/CardContent'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<CardContent>
{{ content | raw }}
</CardContent>