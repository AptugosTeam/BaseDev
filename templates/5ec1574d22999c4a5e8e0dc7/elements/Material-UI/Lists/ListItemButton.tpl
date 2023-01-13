/*
path: listItemButton.tpl
completePath: elements/Material-UI/Lists/listItemButton.tpl
type: file
unique_id: oajk9f4g
icon: f:icoListItemButton.svg
sourceType: javascript
children: []
options:
  - name: href
    display: Link URL
    type: text
  - name: alignItems
    display: Align Items
    type: dropdown
    options:
      return [['center', 'Center'],['flex-start', 'Flex-Start']]
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: separator
    display: Optionals Properties
    type: separator
  - name: dense
    display: dense
    type: checkbox
  - name: disabled
    display: disabled
    type: checkbox
  - name: disableGutters
    display: Disable Padding
    type: checkbox
    options: ''
*/
{% set bpr %}
import ListItemButton from '@mui/material/ListItemButton'
{% endset %}
{{ save_delayed('bpr', bpr ) }}

<ListItemButton 
  {% if element.values.href %}
    href={{element.values.href | textOrVariable}} component="a" 
  {% endif %}
  {% if element.values.alignItems %}
    alignItems='{{ element.values.alignItems }}'
  {% endif %}
  {% if element.values.className %}
    classes={ {{ element.values.className }} }
  {% endif %}
  {% if element.values.dense %}
    dense={true}
  {% endif %}
  {% if element.values.disabled %}
    disabled={true}
  {% endif %}
  {% if element.values.disablePadding %}
    disablePadding={true}
  {% endif %}
  
>
  {{ content | raw }}
</ListItemButton>