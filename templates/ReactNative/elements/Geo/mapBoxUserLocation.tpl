/*
path: mapBoxUserLocation.tpl
keyPath: elements/Geo/mapBoxUserLocation.tpl
unique_id: DOt4oFAT
icon: ico-leaflet
options:
  - name: visible
    display: Is Visible
    type: checkbox
    settings:
      default: true
  - name: onUpdate
    display: On Update
    type: function
settings:
  - name: Packages
    value: '"expo-location": "~18.1.6",'
*/
{% set AppJsonPlugins %}[
  "expo-location",
  { "locationWhenInUsePermission": "Show current location on map." }
],{% endset %}
{{ add_setting('AppJsonPlugins', AppJsonPlugins)}}
{% set bpr %}
import * as Location from 'expo-location'
import { UserLocation } from '@rnmapbox/maps'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<UserLocation
  visible={ {{element.values.visible|default(true)}}}
  {% if element.values.onUpdate %}
    onUpdate={ {{ element.values.onUpdate |functionOrCall }} }
  {% endif %}
/>