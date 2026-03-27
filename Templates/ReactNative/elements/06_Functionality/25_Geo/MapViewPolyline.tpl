/*
path: MapViewPolyline.tpl
completePath: elements/Geo/MapViewPolyline.tpl
type: file
unique_id: MapViewPolylineTplQ5n7
icon: ico-geolocalization
order: 3
helpText: Render a react-native-maps Polyline inside a MapView
options:
  - name: coordinatesCode
    display: Coordinates
    type: code
    options: ''
  - name: strokeColor
    display: Stroke Color
    type: text
    options: ''
  - name: strokeWidth
    display: Stroke Width
    type: text
    options: ''
  - name: lineDashPattern
    display: Line Dash Pattern
    type: code
    options: ''
    advanced: true
  - name: geodesic
    display: Geodesic
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
  - name: tappable
    display: Tappable
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
  - name: onPress
    display: On Press
    type: code
    options: ''
    advanced: true
children: []
settings:
  - name: Packages
    value: '"react-native-maps": "^1.26.1",'
*/
{% set bpr %}
import { Polyline } from 'react-native-maps'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Polyline
  coordinates={ {{ element.values.coordinatesCode | raw }} }
  strokeColor={{ element.values.strokeColor | default("'#0A1D46'") | textOrVariable }}
  strokeWidth={ {{ element.values.strokeWidth | default('4') }} }
  {% if element.values.lineDashPattern %}lineDashPattern={ {{ element.values.lineDashPattern | raw }} }{% endif %}
  {% if element.values.geodesic %}geodesic{% endif %}
  {% if element.values.tappable %}tappable{% endif %}
  {% if element.values.onPress %}
  onPress={(e) => {
    {{ element.values.onPress | raw }}
  }}
  {% endif %}
/>
