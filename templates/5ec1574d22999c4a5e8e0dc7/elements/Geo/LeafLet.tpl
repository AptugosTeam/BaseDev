/*
path: LeafLet.tpl
type: file
unique_id: KshBgLpQ
icon: ico-leaflet
children: []
options:
  - name: position
    display: Map Position
    type: text
  - name: zoom
    display: Zoom
    type: text
  - name: scroll
    display: Zoom with Mouse Wheel
    type: checkbox
    settings:
      default: true
settings:
  - name: Packages
    value: '"react-leaflet": "2.8.0","leaflet": "latest",'
*/
{% set bpr %}
import LeafLet from '../components/LeafLet'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const [leafLetPosition, setleaftLetPosition] = React.useState([51.505, -0.09])
const LeafLetMap = LeafLet
{% endset %}
{{ save_delayed('ph',ph) }}
<LeafLetMap
  {% if element.values.position %}
    position={ {{ element.values.position}} }
  {% else %}
    position={leafLetPosition}
  {% endif %}
      zoom={ {{element.values.zoom | default(3) }} }
      scroll={ {{element.values.scroll | default(true) }} }
>
    {{ content | raw }}
</LeafLetMap>