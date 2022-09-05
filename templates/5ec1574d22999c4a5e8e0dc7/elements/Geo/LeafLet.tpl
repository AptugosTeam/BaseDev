/*
path: LeafLet.tpl
type: file
unique_id: KshBgLpQ
icon: ico-leaflet
children: []
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
    position={leafLetPosition}
>
    {{ content | raw }}
</LeafLetMap>