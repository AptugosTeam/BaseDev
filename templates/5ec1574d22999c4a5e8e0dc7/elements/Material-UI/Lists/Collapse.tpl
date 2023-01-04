/*
path: Collapse.tpl
completePath: elements/Material-UI/Lists/Collapse.tpl
type: file
unique_id: oalk9f4g
icon: f:list.svg
sourceType: javascript
children: []
options:
  - name: useStateVariable
    display: Use an Variable
    type: text
  - name: timeout
    display: Timeout
    type: text
*/
{% set bpr %}
import Collapse from '@mui/material/Collapse'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Collapse 
{% if element.values.useStateVariable %}
  in={ {{element.values.useStateVariable}} }
{% else %}
  in={open}
{% endif %}
{% if element.values.timeout %}
  timeout="{{element.values.timeout}}"
{% else %}
  timeout="auto"
{% endif %}
unmountOnExit>
{{ content | raw }}
</Collapse>