/*
path: mapBoxMarker.tpl
keyPath: elements/Geo/mapBoxMarker.tpl
unique_id: z2fTET0M
icon: ico-leaflet
internalUse: false
options:
  - name: longitude
    display: Longitude
    type: text
    helpText: Longitude position for the marker. Accepts variables or code expressions, for example Number(property.longitude)
  - name: latitude
    display: Latitude
    type: text
    helpText: Latitude position for the marker. Accepts variables or code expressions, for example Number(property.latitude)
  - name: anchor
    display: Anchor
    type: text
    helpText: Optional marker anchor position. Common values are center, top, bottom, left, right, top-left, top-right, bottom-left, bottom-right
  - name: offset
    display: Offset
    type: text
    helpText: Optional marker offset. Use a valid React expression such as [0, -8] or { x 0, y -8 } depending on your runtime needs
  - name: draggable
    display: Draggable
    type: boolean
    helpText: Makes the marker draggable when enabled
  - name: rotation
    display: Rotation
    type: text
    helpText: Rotation angle in degrees
  - name: pitchAlignment
    display: Pitch Alignment
    type: text
    helpText: Optional pitch alignment. Common values are map, viewport, or auto
  - name: rotationAlignment
    display: Rotation Alignment
    type: text
    helpText: Optional rotation alignment. Common values are map, viewport, or auto
  - name: popupText
    display: Popup Text
    type: text
    helpText: Optional fallback text or label for the default marker when no children are provided
helpText: |
  Adds a Mapbox marker inside a mapBox element.

  Use this element when
  - you need to place markers on a Mapbox map
  - you want marker coordinates to come from variables
  - you want to render custom marker UI as children

  Typical usage
  - place this inside mapBox.tpl
  - usually inside a loop.tpl
  - provide longitude and latitude as expressions

  Example
  - longitude Number(property.longitude)
  - latitude Number(property.latitude)
  - anchor bottom

  If children are present, they will be rendered inside the Marker component.
  If there are no children, the default Marker component from ../components/MapBox will be used.
*/
{% set bpr %}
  import { Marker } from 'react-map-gl/mapbox'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<Marker
  longitude={ {{ element.values.longitude }} }
  latitude={ {{ element.values.latitude }} }
  {% if element.values.anchor %}anchor="{{ element.values.anchor }}"{% endif %}
  {% if element.values.offset %}offset={ {{ element.values.offset }} }{% endif %}
  {% if element.values.draggable %}draggable={ {{ element.values.draggable }} }{% endif %}
  {% if element.values.rotation %}rotation={ {{ element.values.rotation }} }{% endif %}
  {% if element.values.pitchAlignment %}pitchAlignment="{{ element.values.pitchAlignment }}"{% endif %}
  {% if element.values.rotationAlignment %}rotationAlignment="{{ element.values.rotationAlignment }}"{% endif %}
>
  {{ content | raw }}
</Marker>
