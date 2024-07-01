/*
path: mapBoxCammera.tpl
keyPath: elements/Geo/mapBoxCammera.tpl
unique_id: zzUJNLV2
icon: ico-leaflet
options:
  - name: centerCoordinate
    display: Center Coordinate
    type: text
    settings:
      default: '[50, 0]'
  - name: zoomLevel
    display: Zoom Level
    type: text
    settings:
      default: 6
  - name: minZoomLevel
    display: Min Zoom Level
    type: text
    settings:
      default: 1
  - name: maxZoomLevel
    display: Max Zoom Level
    type: text
    settings:
      default: 16
  - name: followZoomLevel
    display: Follow Zoom Level
    type: text
    settings:
      default: 12
  - name: maxBounds
    display: Max Bounds
    type: text
*/
{% set bpr %}
import { Camera } from '@rnmapbox/maps'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const cameraRef{{ element.unique_id }} = React.useRef<Camera>(null)
{% endset %}
{{ save_delayed('ph',ph)}}
<Camera
  ref={cameraRef{{ element.unique_id }}}
  maxZoomLevel={ {{ element.values.maxZoomLevel|default(16) }} }
  minZoomLevel={ {{ element.values.minZoomLevel|default(1) }} }
  centerCoordinate={ {{ element.values.centerCoordinate|default('[50, 0]') }}}
  zoomLevel={ {{ element.values.zoomLevel|default(6) }} }
  followZoomLevel={ {{ element.values.followZoomLevel|default(12) }} }
  {% if element.values.maxBounds %}
    maxBounds={ { {{ element.values.maxBounds }} } }
  {% endif %}
/>