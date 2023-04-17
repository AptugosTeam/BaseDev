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
*/
{% set bpr %}
import { Marker } from '../components/MapBox'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<Marker />