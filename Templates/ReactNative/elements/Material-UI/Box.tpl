/*
path: Box.tpl
type: file
unique_id: KcwTMbe3
icon: ico-box
helpText: >-
  The Box component serves as a wrapper component for most of the CSS utility
  needs.
sourceType: javascript
options:
  - name: color
    display: Color
    type: text
    options: ''
  - name: clone
    display: Clone?
    type: checkbox
    options: ''
children: []
*/
{% set bpr %}
import Box from '@mui/material/Box'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Box
  {% if element.values.color %}color="{{ element.values.color }}"{% endif %}
  {% if element.values.clone %}clone{% endif %}
>
  {{ content | raw }}
</Box>