/*
path: mapBoxLayer.tpl
keyPath: elements/06_Functionality/25_Geo/mapBoxLayer.tpl
unique_id: GqWcvpH3
icon: ico-mapbox
options:
  - name: layerType
    display: Layer Type
    type: dropdown
    options:
      return ['Circle','Line','Symbol']
  - name: filter
    display: Filter
    type: text
  - name: style
    display: style
    type: text
  - name: circlePitchAlignment
    display: Circle Pitch Alignment
    type: dropdown
    options: 
      return [['map', 'Map'],['viewport', 'Viewport']]
  - name: circleColor
    display: Color
    type: text
  - name: circleRadius
    display: Radius
    type: text
  - name: circleOpacity
    display: Opacity
    type: text
  - name: circleStrokeWidth
    display: Stroke Width
    type: text
  - name: circleStrokeColor
    display: Stroke Color
    type: text
*/
{% if element.values.layerType == 'Circle' %}
  {% include includeTemplate('mapBoxCircleLayer.tpl') %}
{% elseif element.values.layerType == 'Line' %}
  {% include includeTemplate('mapBoxLineLayer.tpl') %}
{% endif %}

