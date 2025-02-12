/*
path: Marker.tpl
type: file
unique_id: hKE82qnH
icon: ico-marker
children: []
options:
  - name: Position
    display: Position
    type: text
    options: ''
  - name: action
    display: action
    type: checkbox
*/
{% set bpr %}
  import { Marker } from '../components/LeafLet'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Marker 
  {% if element.values.Position %}
    position={ {{element.values.Position }} }
  {% else %}
    position={leafLetPosition}
  {% endif %}
  {% if element.values.action %}
    onMarkerDrag={handleMarkerDrag}
  {% endif %}

>

{{ content | raw }}
</Marker>