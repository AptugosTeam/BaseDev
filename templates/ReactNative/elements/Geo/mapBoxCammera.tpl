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
  - name: followZoomLevel
    display: Follow Zoom Level
    type: text
    settings:
      default: 12
*/
{% set bpr %}
import { Camera } from '@rnmapbox/maps'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Camera
  centerCoordinate={ {{ element.values.centerCoordinate|default('[50, 0]') }}}
  zoomLevel={ {{ element.values.zoomLevel|default(6) }} }
  followZoomLevel={ {{ element.values.followZoomLevel|default(12) }} }
/>