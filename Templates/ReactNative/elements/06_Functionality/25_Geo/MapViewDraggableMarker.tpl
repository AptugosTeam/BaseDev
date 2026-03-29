/*
path: MapViewDraggableMarker.tpl
completePath: elements/Geo/MapViewDraggableMarker.tpl
type: file
unique_id: KmQpRzhN
icon: ico-geolocalization
helpText: Render a react-native-maps MapView with an optional managed draggable marker synced to your form state. You can also add extra MapViewMarker children.
options:
  - name: mapRef
    display: Map Ref
    type: variable
    options: ''
  - name: initialRegion
    display: Initial Region Variable
    type: variable
    options: ''
  - name: stateVariable
    display: State Variable
    type: variable
    options: ''
  - name: latField
    display: Latitude Field
    type: text
    options: ''
    settings:
      default: lat
  - name: lngField
    display: Longitude Field
    type: text
    options: ''
    settings:
      default: lng
  - name: styles
    display: Map Style
    type: styles
    options: ''
  - name: renderManagedMarker
    display: Render Managed Marker
    type: checkbox
    settings:
      default: false
  - name: draggable
    display: Draggable Marker
    type: checkbox
    settings:
      default: false
  - name: updateOnMapPress
    display: Update On Map Press
    type: checkbox
    settings:
      default: false
  - name: onLocationChange
    display: On Location Change
    type: code
    options: ''
children: []
settings:
  - name: Packages
    value: '"react-native-maps": "^1.26.1",'
*/
{% set bpr %}
{% if element.values.renderManagedMarker %}
import MapView, { Marker } from 'react-native-maps'
{% else %}
import MapView from 'react-native-maps'
{% endif %}
{% endset %}
{{ save_delayed('bpr',bpr) }}
<MapView
  {% if element.values.mapRef %}ref={ {{ element.values.mapRef }} }{% endif %}
  {% if element.values.styles %}style={ {{ element.values.styles }} }{% endif %}
  initialRegion={ {{ element.values.initialRegion|default('initialRegion') }} }
  {% if element.values.updateOnMapPress %}
  onPress={(e) => {
    const { latitude, longitude } = e.nativeEvent.coordinate
    const nextLocation = { latitude, longitude }
    {% if element.values.stateVariable %}
    set{{ element.values.stateVariable }}((prev) => ({
      ...prev,
      {{ element.values.latField|default('lat') }}: latitude,
      {{ element.values.lngField|default('lng') }}: longitude,
    }))
    {% endif %}
    {{ element.values.onLocationChange }}
  }}
  {% endif %}
>
  {% if element.values.renderManagedMarker %}
  <Marker
    coordinate={ {
      latitude: {{ element.values.stateVariable }}?.{{ element.values.latField|default('lat') }} ?? {{ element.values.initialRegion|default('initialRegion') }}.latitude,
      longitude: {{ element.values.stateVariable }}?.{{ element.values.lngField|default('lng') }} ?? {{ element.values.initialRegion|default('initialRegion') }}.longitude,
    } }
    {% if element.values.draggable %}
    draggable
    {% endif %}
    onDragEnd={(e) => {
      const { latitude, longitude } = e.nativeEvent.coordinate
      const nextLocation = { latitude, longitude }
      set{{ element.values.stateVariable }}((prev) => ({
        ...prev,
        {{ element.values.latField|default('lat') }}: latitude,
        {{ element.values.lngField|default('lng') }}: longitude,
      }))
      {{ element.values.onLocationChange }}
    }}
  />
  {% endif %}
  {{ content | raw }}
</MapView>
