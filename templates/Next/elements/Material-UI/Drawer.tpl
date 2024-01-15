/*
path: Drawer.tpl
completePath: elements/Material-UI/Drawer.tpl
unique_id: UPCetE3y
icon: f:accordion.svg
options:
  - name: anchor
    display: Side from which the drawer appears
    type: dropdown
    options: left;right;bottom;top
  - name: variant
    display: Variant
    type: dropdown
    options: permanent;persistent;temporary
  - name: open
    display: Open Variable
    type: text
    options: ''
*/
{% set bpr %}
import Drawer from '@mui/material/Drawer';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Drawer
  {% if element.values.anchor %}
    anchor='{{ element.values.anchor|default('left') }}'
  {% endif %}
  {% if element.values.variant %}
    variant='{{ element.values.variant|default('temporary') }}'
  {% endif %}
  {% if element.values.open %}
    open={ {{ element.values.open|default('true') }} }
  {% endif %}
>{{ content | raw }}
</Drawer>