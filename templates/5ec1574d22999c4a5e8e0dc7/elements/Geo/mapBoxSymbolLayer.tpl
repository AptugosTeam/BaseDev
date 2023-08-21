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
import { Layer } from 'react-map-gl'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<Layer
  id="{{ element.unique_id }}"
  type="symbol"
  {% if element.values.filter %}filter={ {{ element.values.filter}} }{% endif %}
  layout={ {
    {% if element.values.textField %}"text-field": {{ element.values.textField | textOrVariableInCode }},{% endif %}
    {% if element.values.textSize %}"text-size": {{ element.values.textSize | textOrVariableInCode }},{% endif %}
    {% if element.values.textPitchAlignment %}"text-pitch-alignment": "{{ element.values.textPitchAlignment }}",{% endif %}
    {% if element.values.iconImage %}"icon-image": "{{ element.values.iconImage }}",{% endif %}
    {% if element.values.iconSize %}"icon-size": "{{ element.values.iconSize }}",{% endif %}
    {% if element.values.iconAllowOverlap %}"icon-allow-overlap": "{{ element.values.iconAllowOverlap }}",{% endif %}
  } }
  paint={ {
    {% if element.values.textColor %}"text-color": "{{ element.values.textColor }}",{% endif %}
  } }
/>
