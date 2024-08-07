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
*/
{% set bpr %}
  import Marker from '@components/LeafLet/Marker.tsx'
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