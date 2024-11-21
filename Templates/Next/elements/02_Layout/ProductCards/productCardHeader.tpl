/*
path: productCardHeader.tpl
unique_id: aMXRUSTB
icon: f:productCardHeader.svg
helpText: >-
  Insert simple text anywhere. Can hold variables, code, and anything of your
  choice
sourceType: javascript
options:
  - name: title
    display: Title
    type: text
    options: ''
  - name: subheader
    display: Sub Title
    type: text
    options: ''
*/
{% set bpr %}
import CardHeader from '@mui/material/CardHeader';
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.title | slice(0,1) == '{' %}
    {% set theTitle = 'title=' ~ element.values.title %}
{% else %}
    {% set theTitle = 'title="' ~ element.values.title ~ '"' %}
{% endif %}
<CardHeader
    {{ theTitle }}
    {% if element.values.subheader %}subheader={{ element.values.subheader | textOrVariable }}{% endif %}
>
{{ content | raw }}
</CardHeader>
