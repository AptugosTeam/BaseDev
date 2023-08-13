/*
path: mapBoxLineLayer.tpl
keyPath: elements/Geo/mapBoxLineLayer.tpl
unique_id: ur91ifX6
options:
  - name: filter
    display: Filter
    type: text
  - name: style
    display: style
    type: text
*/
{% set bpr %}
import { LineLayer } from '@rnmapbox/maps'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<LineLayer
  id="{{ element.unique_id }}"
  {% if element.values.filter %}filter={ {{ element.values.filter}} }{% endif %}
  {% if element.values.style %}style={ {{ element.values.style }} }{% endif %}
/>