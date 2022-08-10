/*
path: list.tpl
type: file
unique_id: oSig9f4g
icon: ico-list
sourceType: javascript
children: []
options:
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
<List
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  {% if element.values.disablePadding %}disablePadding={true}{% endif %}
>
{{ content | raw }}
</List>