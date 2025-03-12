/*
path: rect.tpl
type: file
unique_id: skiaRect
icon: ico-field
sourceType: javascript
settings:
  - name: Packages
    value: '"@shopify/react-native-skia": "latest",'
options:
  - name: xValue
    display: X Value
    type: text
  - name: yValue
    display: Y Value
    type: text
  - name: width
    display: Width
    type: text
  - name: height
    display: Height
    type: text
  - name: color
    display: Color
    type: text
children: []
*/
{% set bpr %}
import { Rect } from '@shopify/react-native-skia'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Rect
  {% if element.values.xValue %} x={ {{ element.values.xValue }} } {% endif %}
  {% if element.values.yValue %} y={ {{ element.values.yValue }} } {% endif %}
  {% if element.values.width %} width={ {{ element.values.width }} } {% endif %}
  {% if element.values.height %} height={ {{ element.values.height }} } {% endif %}
  {% if element.values.color %} color={ {{ element.values.color }} } {% endif %}
/>