/*
path: list.tpl
completePath: elements/Material-UI/Lists/list.tpl
type: file
unique_id: oSig9f4g
icon: f:list.svg
sourceType: javascript
children: []
options:
  - name: subheader
    display: SubHeader
    type: text
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: disablePadding
    display: Disable Padding
    type: checkbox
    options: ''
*/
{% set bpr %}
import List from '@mui/material/List'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% if element.values.subheader %}
  {% set bpr %}
  import ListSubheader from '@mui/material/ListSubheader'
  {% endset %}
{{ save_delayed('bpr', bpr ) }}
{% endif %}
<List
  {% if element.values.className %}
    className={ {{ element.values.className }} }
  {% endif %}
  {% if element.values.disablePadding %}
    disablePadding={true}
  {% endif %}
  {% if element.values.subheader %}      
        subheader={
        <ListSubheader component="div" id="nested-list-subheader">
          {{ element.values.subheader | textOrVariable }}
        </ListSubheader>
      }
      {% endif %}
>
{{ content | raw }}
</List>