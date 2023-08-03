/*
path: mapBoxSymbolLayer.tpl
keyPath: elements/Geo/mapBoxSymbolLayer.tpl
unique_id: ur91ifX5
options:
  - name: filter
    display: Filter
    type: text
  - name: style
    display: style
    type: text
*/
<SymbolLayer
  id="{{ element.unique_id }}"
  style={layerStyles.clusterCount}
  {% if element.values.filter %}filter={ {{ element.values.filter}} }{% endif %}
  {% if element.values.style %}style={ {{ element.values.style }} }{% endif %}
/>