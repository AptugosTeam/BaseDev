/*
path: mapBoxMarker.tpl
keyPath: elements/Geo/mapBoxMarker.tpl
unique_id: z2fTET0M
icon: ico-leaflet
internalUse: false
extraFiles:
  - source: 'elements/Geo/MapBox/Marker.tsx'
    destination: 'front-end/components/MapBox/Marker.tsx'
settings:
  - name: Packages
    value: '"mapbox-gl": "2.13.0",'
options:
  - name: map
    display: Map
    type: text
    options: ''
  - name: latitude
    display: Latitude
    type: text
    options: ''
  - name: longitude
    display: Longitude
    type: text
    options: ''
  - name: color
    display: Marker color (hex)
    type: text
    options: ''
*/
{% set bpr %}
import { Marker } from '../components/MapBox'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<Marker
  {% if element.values.map %}map={ {{ element.values.map }} }{% endif %}
  {% if element.values.latitude %}latitude={ {{ element.values.latitude }} }{% endif %}
  {% if element.values.longitude %}longitude={ {{ element.values.longitude }} }{% endif %}
  {% if element.values.color %}color={ '{{ element.values.color }}' }{% endif %}

 />