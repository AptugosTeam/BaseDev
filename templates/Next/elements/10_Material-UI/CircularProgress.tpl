/*
path: CircularProgress.tpl
type: file
unique_id: CircularProgress001
icon: ico-loading
sourceType: javascript
options:
  - name: variant
    display: Variant
    type: dropdown
    options: indeterminate;determinate
    settings:
      default: indeterminate
  - name: size
    display: Size
    type: text
    settings:
      default: 40
  - name: color
    display: Color
    type: dropdown
    options: inherit;primary;secondary;error;info;success;warning
    settings:
      default: primary
  - name: thickness
    display: Thickness
    type: text
    settings:
      default: 3.6
    advanced: true
  - name: value
    display: Value (0-100)
    type: text
    advanced: true
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: extraStyle
    display: Extra Styles
    type: text
    options: ''
children: []
*/
{% set bpr %}
import CircularProgress from '@mui/material/CircularProgress'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<CircularProgress
  {% if element.values.variant %}variant='{{ element.values.variant }}'{% endif %}
  {% if element.values.size %}size={ {{ element.values.size }} }{% endif %}
  {% if element.values.color %}color='{{ element.values.color }}'{% endif %}
  {% if element.values.thickness and not element.values.thickness == '3.6' %}thickness={ {{ element.values.thickness }} }{% endif %}
  {% if element.values.variant == 'determinate' and element.values.value %}value={ {{ element.values.value }} }{% endif %}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  {% if element.values.extraStyle %}style={ { {{element.values.extraStyle}} } }{% endif %}
/>
