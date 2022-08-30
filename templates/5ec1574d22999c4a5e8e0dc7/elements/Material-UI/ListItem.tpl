/*
path: ListItem.tpl
type: file
unique_id: b1KMWrIH
icon: ico-field
sourceType: javascript
options:
  - name: onClick
    display: On Click
    type: text
    options: ''
  - name: selected
    display: Selected
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: disableGutters
    display: Disable Gutters
    type: checkbox
    options: ''
  - name: dense
    display: Dense
    type: checkbox
    options: ''
children: []
*/
{% set bpr %}
import ListItem from '@mui/material/ListItem'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<ListItem
  {% if element.values.dense %}dense{% endif %}
  {% if element.values.disableGutters %}disableGutters={true}{% endif %}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  {% if element.values.onClick %}disableRipple button onClickCapture={ {{ element.values.onClick }} } {% endif %}
  {% if element.values.selected %}selected={{ element.values.selected | textOrVariable }}{% endif %}
>
{{ content | raw }}
</ListItem>