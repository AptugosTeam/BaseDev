/*
path: Badge.tpl
type: file
unique_id: aDAM4rmi
completePath: elements/Material-UI/Badge.tpl
icon: ico-link
sourceType: javascript
options:
  - name: color
    display: Color
    type: dropdown
    options: 
      return [['default', 'Default'], ['inherit', 'Inherit'], ['primary', 'Primary'], ['secondary', 'Secondary'], ['error', 'Error'], ['info', 'Info'], ['success', 'Success'], ['warning', 'Warning']]
    settings:
      default: 'default'
  - name: badgeContent
    display: Badge content
    required: true
    type: text
    settings:
      default: 0
    options: ''
children: []
*/
{% set bpr %}
import Badge from '@mui/material/Badge';
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Badge
  {% if element.values.badgeContent %}
    badgeContent={ {{ element.values.badgeContent|default(0) }} }
  {% endif %}
  {% if element.values.color %}
    color='{{ element.values.color|default("default") }}'
  {% endif %}
>
  {{ content | raw }}
</Badge>