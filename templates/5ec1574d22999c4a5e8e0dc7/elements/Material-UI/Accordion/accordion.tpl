/*
path: accordion.tpl
completePath: elements/Material-UI/Accordion/accordion.tpl
unique_id: WCeFNW3P
icon: f:accordion.svg
*/
{% set bpr %}
import Accordion from '@mui/material/Accordion'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Accordion
    {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
    elevation={ {{ element.values.elevation|default(1) }} }
>{{ content | raw }}</Accordion>