/*
path: ListItemIcon.tpl
completePath: elements/Material-UI/Lists/ListItemIcon.tpl
type: file
unique_id: oalksf4g
icon: f:list.svg
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
    display: color
    type: dropdown
    options: primary;secondary;custom
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