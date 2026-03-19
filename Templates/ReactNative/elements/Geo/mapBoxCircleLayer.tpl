/*
path: mapBoxCircleLayer.tpl
keyPath: elements/Geo/mapBoxCircleLayer.tpl
unique_id: ur91ifX4
options:
  - name: filter
    display: Filter
    type: text
  - name: style
    display: style
    type: text
*/
{% set bpr %}
import { CircleLayer } from '@rnmapbox/maps'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<CircleLayer
  id="{{ element.unique_id }}"
  {% if element.values.filter %}filter={ {{ element.values.filter}} }{% endif %}
  {% if element.values.style %}style={ {{ element.values.style }} }{% endif %}
/>