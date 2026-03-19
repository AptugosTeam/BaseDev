/*
path: mapBoxLineLayer.tpl
keyPath: elements/Geo/mapBoxLineLayer.tpl
unique_id: ur91ifX6
internalUse: true
deprecated: true
icon: ico-mapbox
deprecatedText: This element will not be maintained, switch over to MapBoxLayer
options:
  - name: filter
    display: Filter
    type: text
  - name: style
    display: style
    type: text
*/
<LineLayer
  id="{{ element.unique_id }}"
  {% if element.values.filter %}filter={ {{ element.values.filter}} }{% endif %}
  {% if element.values.style %}style={ {{ element.values.style }} }{% endif %}
/>