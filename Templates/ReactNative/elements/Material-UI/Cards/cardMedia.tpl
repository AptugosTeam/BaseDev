/*
path: cardMedia.tpl
completePath: elements/Material-UI/Cards/cardMedia.tpl
unique_id: vcZKHGTu
*/
{% set bpr %}
import CardMedia from '@mui/material/CardMedia'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<CardMedia
    {% if  element.values.className %}className={ {{ element.values.className }} }{% endif %}
    {% if  element.values.title %}title={ {{ element.values.title }} }{% endif %}
    image={{ element.values.image|textOrVariable }}
/>