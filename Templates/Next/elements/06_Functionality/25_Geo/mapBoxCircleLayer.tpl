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
  - name: circlePitchAlignment
    display: Circle Pitch Alignment
    type: dropdown
    options: 
      return [['map', 'Map'],['viewport', 'Viewport']]
  - name: circleColor
    display: Color
    type: text
  - name: circleRadius
    display: Radius
    type: text
  - name: circleOpacity
    display: Opacity
    type: text
  - name: circleStrokeWidth
    display: Stroke Width
    type: text
  - name: circleStrokeColor
    display: Stroke Color
    type: text
*/
{% set bpr %}
import { Layer } from 'react-map-gl'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<Layer
  type="circle"
  id="{{ element.unique_id }}"
  {% if element.values.filter %}filter={ {{ element.values.filter}} }{% endif %}
  {% if element.values.style %}style={ {{ element.values.style }} }{% endif %}
  paint={ {
    {% if element.values.circlePitchAlignment %}"circle-pitch-alignment": "{{ element.values.circlePitchAlignment }}",{% endif %}
    {% if element.values.circleColor %}"circle-color": {{ element.values.circleColor | textOrVariableInCode}},{% endif %}
    {% if element.values.circleRadius %}"circle-radius": {{ element.values.circleRadius | textOrVariableInCode}},{% endif %}
    {% if element.values.circleOpacity %}"circle-opacity": {{ element.values.circleOpacity | textOrVariableInCode}},{% endif %}
    {% if element.values.circleStrokeWidth %}"circle-stroke-width": {{ element.values.circleStrokeWidth | textOrVariableInCode}},{% endif %}
    {% if element.values.circleStrokeColor %}"circle-stroke-color": {{ element.values.circleStrokeColor | textOrVariableInCode}},{% endif %}
  } }
/>