/*
path: Loader.tpl
completePath: elements/Material-UI/Loader.tpl
type: file
unique_id: KcwTMcf7
icon: ico-box
sourceType: javascript
options:
  - name: size
    display: Size 
    type: text
    options: ''
  - name: sx
    display: Extra Styles
    type: text
    options: ''
  - name: Color
    display: Color
    type: dropdown
    options: default;inherit;primary;secondary;error;info;success;warning
    settings:
      default: primary
children: []
*/
{% set bpr %}
import CircularProgress from '@mui/material/CircularProgress';
{% endset %}
{{ save_delayed('bpr', bpr) }}
<CircularProgress
  {% if element.values.size %}
     size={ {{ element.values.size }} }
  {% endif %}
  {% if element.values.sx %}
    sx={ { {{ element.values.sx }} } }
  {% endif %}
  {% if element.values.Color %}color='{% if element.values.Color == 'default' %}inherit{% else %}{{ element.values.Color }}{% endif %}'{% endif %}
/>
