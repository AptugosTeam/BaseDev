/*
path: cardContent.tpl
completePath: elements/Material-UI/Cards/cardContent.tpl
unique_id: M6MWRbz3
icon: f:cardContent.svg
helpText: Insert simple text anywhere. Can hold variables, code, and anything of your choice
sourceType: javascript
options:
  - name: class
    display: ClassName
    type: styles
    options: ''
*/
{% set bpr %}
import CardContent from '@mui/material/CardContent'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<CardContent
    {% if element.values.class %}
        className={ {{element.values.class}} }
    {% endif %}
>
{{ content | raw }}
</CardContent>