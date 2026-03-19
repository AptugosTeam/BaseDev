/*
path: canvas.tpl
type: file
unique_id: skiaCanvas
icon: ico-field
sourceType: javascript
settings:
  - name: Packages
    value: '"@shopify/react-native-skia": "0.1.196",'
options:
  - name: style
    display: Style
    type: text
children: []
*/
{% set bpr %}
import { Canvas } from '@shopify/react-native-skia'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Canvas {% if element.values.style %}style={ {{ element.values.style }} }{% endif %}>
  {{ content | raw }}
</Canvas>