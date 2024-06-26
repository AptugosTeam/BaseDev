/*
path: ButtonGroup.tpl
unique_id: bpxcQQdK
order: 3
options:
  - name: Variant
    display: Variant
    type: dropdown
    options: text;contained;outlined
  - name: size
    display: Size
    type: dropdown
    options: small;medium;large
  - name: orientation
    display: Orientation
    type: dropdown
    options: horizontal;vertical
  - name: disableElevation
    display: Disable Elevation
    type: checkbox
  - name: fullWidth
    display: Full Width
    type: checkbox
    options: ''
*/
{% set bpr %}
import ButtonGroup from '@mui/material/ButtonGroup'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<ButtonGroup
  variant="{{ element.values.Variant|default('outlined') }}"
  size="{{ element.values.size|default('medium') }}"
  orientation="{{ element.values.orientation|default('horizontal') }}"
  {% if element.values.disableElevation %}disableElevation{% endif %}
  {% if element.values.fullWidth %}fullWidth{% endif %}
>
  {{ content | raw }}
</ButtonGroup>