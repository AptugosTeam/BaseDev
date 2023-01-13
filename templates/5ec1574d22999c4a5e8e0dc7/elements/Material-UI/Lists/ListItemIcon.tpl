/*
path: ListItemIcon.tpl
completePath: elements/Material-UI/Lists/ListItemIcon.tpl
type: file
unique_id: oalksf4g
icon: f:icoListItemIcon.svg
sourceType: javascript
children: []
options:
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: sx
    display: Extra Styles
    type: text
  - name: color
    display: Color
    type: dropdown
    options: 
      return [['primary', 'Primary'],['secondary', 'Secondary'], ['custom', 'Custom']]
  - name: propertyCustom
    display: Custom
    type: text
    settings:
      propertyCondition: color
      condition: custom
      active: true
*/
{% set bpr %}
import ListItemIcon from '@mui/material/ListItemIcon'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<ListItemIcon 
{% if element.values.className %}
  classes={ {{element.values.className}} }
{% endif %} 
{% if element.values.sx %}
  sx={ { {{element.values.sx}} } }
{% else %}
  sx={ { 
    fontSize:'inherit',
  {% if element.values.color != 'custom' %}
    color:'{{element.values.color}}',
  {% else %}
    color:'{{element.values.propertyCustom}}',
  {% endif %}
} }
{% endif %}
>
{{ content | raw }}
</ListItemIcon>