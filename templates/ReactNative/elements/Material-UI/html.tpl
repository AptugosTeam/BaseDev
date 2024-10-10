/*
path: html.tpl
type: file
unique_id: 3ZM4gz8X
icon: f:html.svg
sourceType: javascript
options:
  - name: html
    display: Content
    type: text
    options: ''
  - name: renderers
    display: Renderers
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-native-render-html": "^6.3.4",'
children: []
*/
{% set bpr %}
import RenderHtml from 'react-native-render-html'
import { useWindowDimensions } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const { width } = useWindowDimensions()
{% endset %}
{{ save_delayed('ph',ph) }}
<RenderHtml
  contentWidth={width}
  source={ {{ element.values.html | raw }} }
  {% if element.values.renderers %}renderers={ {{ element.values.renderers}} }{% endif %}

/>