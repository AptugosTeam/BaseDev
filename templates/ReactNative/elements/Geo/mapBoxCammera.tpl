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
  - name: followZoomLevel
    display: Follow Zoom Level
    type: text
    settings:
      default: 12
  - name: maxBounds
    display: Variable with max Bounds
    type: text
  - name: defaultSettings
    display: Code for default Settings
    type: function
    advanced: true
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
   {% if element.values.centerCoordinate %}
    centerCoordinate={ {{ element.values.centerCoordinate }}}
  {% endif %}
   {% if element.values.maxZoomLevel %}
    maxZoomLevel={  {{ element.values.maxZoomLevel }}  }
  {% endif %}
     {% if element.values.minZoomLevel %}
  minZoomLevel={ {{ element.values.minZoomLevel }} }  
  {% endif %}
  {% if element.values.zoomLevel %}
    zoomLevel={ {{ element.values.zoomLevel }} }
  {% endif %}
    {% if element.values.followZoomLevel %}
    followZoomLevel={ {{ element.values.followZoomLevel }} }
  {% endif %}
  {% if element.values.maxBounds %}
    maxBounds={  {{ element.values.maxBounds }}  }
  {% endif %}
    {% if element.values.defaultZoom %}
  defaultSettings={ {{ element.values.defaultSettings }} }
  {% endif %}
/>