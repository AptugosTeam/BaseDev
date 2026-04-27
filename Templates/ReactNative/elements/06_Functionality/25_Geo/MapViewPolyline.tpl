/*
path: MapViewPolyline.tpl
completePath: elements/Geo/MapViewPolyline.tpl
type: file
display: Map View Polyline
unique_id: MapViewPolylineTplQ5n7
icon: ico-geolocalization
order: 3
helpText: Render a react-native-maps Polyline inside a MapView
extraFiles:
  - source: 'elements/99_ExtraFiles/googleRoutes.tsx'
    destination: 'front-end/services/googleMaps/googleRoutes.tsx'
  - source: 'elements/99_ExtraFiles/polylineUtils.tsx'
    destination: 'front-end/services/googleMaps/polylineUtils.tsx'
options:
  - name: importGoogleRoutesHelper
    display: Import Google Routes Helper
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
  - name: importGooglePolylineHelper
    display: Import Google Polyline Helper
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
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
{% if element.values.importGoogleRoutesHelper %}
{% set bpr %}
import { computeDrivingRoute } from '@services/googleMaps/googleRoutes'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% endif %}
{% if element.values.importGooglePolylineHelper %}
{% set bpr %}
import { decodeGooglePolyline } from '@services/googleMaps/polylineUtils'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% endif %}
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
