/*
path: Box.tpl
completePath: elements/Material-UI/Box.tpl
type: file
unique_id: KcwTMbe3
icon: ico-box
helpText: >-
  The Box component serves as a wrapper component for most of the CSS utility
  needs.
sourceType: javascript
options:
  - name: component
    display: HTML Tag
    type: text
    options: ''
  - name: sx
    display: Styles
    type: text
    options: ''
children: []
*/
{% set bpr %}
import Box from '@mui/material/Box'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Box
  {% if element.values.component %}
     component= "{{ element.values.component }}"
  {% endif %}
  {% if element.values.sx %}
    sx={ { {{ element.values.sx }} } }
  {% endif %}
>
  {{ content | raw }}
</Box>