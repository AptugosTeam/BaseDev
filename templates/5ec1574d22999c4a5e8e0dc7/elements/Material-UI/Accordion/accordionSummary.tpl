/*
path: accordionSummary.tpl
completePath: elements/Material-UI/Accordion/accordionSummary.tpl
unique_id: B5K8NuI3
icon: f:accordionSummary.svg
*/
{% set bpr %}
import AccordionSummary from '@mui/material/AccordionSummary'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import ExpandMoreIcon from '@mui/icons-material/ExpandMore'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<AccordionSummary
    {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
    expandIcon={<ExpandMoreIcon />}
>
    {{ content | raw }}
</AccordionSummary>