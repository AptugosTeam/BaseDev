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
import { Marker } from '../components/LeafLet'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Marker position={{ element.values.Position|textOrVariable|default('leafLetPosition') }}>
{{ content | raw }}
</Marker>