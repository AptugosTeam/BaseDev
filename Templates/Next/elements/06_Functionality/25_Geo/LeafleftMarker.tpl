/*
path: Marker.tpl
type: file
unique_id: hKE82qnH
icon: ico-marker
display: Leaflet Marker
children: []
order: 2
options:
  - name: Position
    display: Position
    type: text
    options: ''
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
>

{{ content | raw }}
</Marker>