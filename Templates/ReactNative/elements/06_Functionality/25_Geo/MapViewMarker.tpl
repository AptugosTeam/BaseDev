/*
path: MapViewMarker.tpl
completePath: elements/Geo/MapViewMarker.tpl
type: file
display: Map View Marker
unique_id: MapViewMarkerTplD3k8
icon: ico-geolocalization
order: 2
helpText: Render a reusable react-native-maps Marker inside a MapView
options:
  - name: coordinateCode
    display: Coordinate Object
    type: code
    options: ''
    advanced: true
  - name: latitude
    display: Latitude
    type: code
    options: ''
    settings:
      default: 0
  - name: longitude
    display: Longitude
    type: code
    options: ''
    settings:
      default: 0
  - name: title
    display: Title
    type: text
    options: ''
  - name: description
    display: Description
    type: text
    options: ''
  - name: identifier
    display: Identifier
    type: text
    options: ''
    advanced: true
  - name: pinColor
    display: Pin Color
    type: text
    options: ''
    advanced: true
  - name: draggable
    display: Draggable Marker
    type: checkbox
    settings:
      default: false
  - name: onPress
    display: On Press
    type: code
    options: ''
    advanced: true
  - name: onDragEnd
    display: On Drag End
    type: code
    options: ''
  - name: key
    display: key
    type: text
    Options: ''
children: []
settings:
  - name: Packages
    value: '"react-native-maps": "^1.26.1",'
*/
{% set bpr %}
import { Marker } from 'react-native-maps'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Marker
  {% if element.values.key %}key={ {{ element.values.key }} }{% endif %}
  coordinate={
    {% if element.values.coordinateCode %}
    {{ element.values.coordinateCode | raw }}
    {% else %}
    {
      latitude: {{ element.values.latitude|default('0') }},
      longitude: {{ element.values.longitude|default('0') }},
    }
    {% endif %}
  }
  {% if element.values.title %}title={{ element.values.title | textOrVariable }}{% endif %}
  {% if element.values.description %}description={{ element.values.description | textOrVariable }}{% endif %}
  {% if element.values.identifier %}identifier={{ element.values.identifier | textOrVariable }}{% endif %}
  {% if element.values.pinColor %}pinColor={{ element.values.pinColor | textOrVariable }}{% endif %}
  {% if element.values.draggable %}
  draggable
  {% endif %}
  {% if element.values.onPress %}
  onPress={(e) => {
    {{ element.values.onPress | raw }}
  }}
  {% endif %}
  {% if element.values.onDragEnd %}
  onDragEnd={(e) => {
    const { latitude, longitude } = e.nativeEvent.coordinate
    const nextLocation = { latitude, longitude }
    {{ element.values.onDragEnd | raw }}
  }}
  {% endif %}
>
  {{ content | raw }}
</Marker>
