/*
path: listItemText.tpl
completePath: elements/Material-UI/Lists/listItemText.tpl
type: file
unique_id: mUbB5LnI
icon: f:listItemText.svg
sourceType: javascript
options:
  - name: text
    display: Text
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: secondaryText
    display: Secondary Text
    type: text
    options: ''
  - name: onClick
    display: On Click
    type: text
    options: ''
  - name: id
    display: ID
    type: text
    options: ''
    advanced: true
children: []
*/
{% set bpr %}
import ListItemText from '@mui/material/ListItemText'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<ListItemText
  {% if element.values.id %}id={{ element.values.id | textOrVariable }}{% endif %}
  primary={{ element.values.text | textOrVariable }}
  {% if element.values.onClick %}onClickCapture={ {{ element.values.onClick }} }{% endif %}
  {% if element.values.className %}classes={ { root: {{ element.values.className }} } }{% endif %}
  {% if element.values.secondaryText %}secondary={{ element.values.secondaryText | textOrVariable }}{% endif %}
/>