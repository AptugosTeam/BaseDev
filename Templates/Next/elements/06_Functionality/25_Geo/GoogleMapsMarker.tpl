/*
path: GoogleMapsMarker.tpl
type: file
unique_id: ggggh2qnH
icon: ico-marker
display: GoogleMaps Marker
children: []
order: 2
options:
  - name: Position
    display: Position
    type: text
    options: ''
*/
{% set bpr %}
import { AdvancedMarker } from '@vis.gl/react-google-maps'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<AdvancedMarker position={ {{element.values.Position }} }>
  {{ content | raw }}
</AdvancedMarker>