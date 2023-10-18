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
  - name: style
    display: style
    type: text
  - name: textField
    display: Text
    type: text
  - name: textPitchAlignment
    display: Text Pitch Alignment
    type: dropdown
    options: 
      return [['map', 'Map'],['viewport', 'Viewport']]
  - name: textSize
    display: Text Size
    type: text
  - name: textColor
    display: Text Color
    type: text
  - name: iconImage
    display: Icon Image
    type: text
  - name: iconSize
    display: Icon Size
    type: text
  - name: iconAllowOverlap
    display: Icon Allow Overlap
    type: checkbox
*/
{% set bpr %}
import { SymbolLayer } from '@rnmapbox/maps'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<SymbolLayer
  id="{{ element.unique_id }}"
  {% if element.values.filter %}filter={ {{ element.values.filter}} }{% endif %}
  {% if element.values.style %}style={ {{ element.values.style }} }{% endif %}
  {% if element.values.iconImage %}style={ {
    {% if element.values.iconImage %}iconImage: {{ element.values.iconImage | textOrVariableInCode }}{% endif %},
    {% if element.values.iconSize %}iconSize: {{ element.values.iconSize | textOrVariableInCode }}{% endif %},
  } }{% endif %}
/>