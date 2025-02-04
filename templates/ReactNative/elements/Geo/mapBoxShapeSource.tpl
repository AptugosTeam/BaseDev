/*
path: mapBoxShapeSource.tpl
keyPath: elements/Geo/mapBoxShapeSource.tpl
unique_id: TDNt7sPp
icon: ico-leaflet
options:
  - name: shape
    display: Shape
    type: text
  - name: clusterProperties
    display: Cluster Properties
    type: text
  - name: clusterActive
    display: Active Cluster
    type: checkbox
    options: ''
  - name: onPress
    display: On Press
    type: function
  - name: key
    display: key
    type: text
*/
{% set bpr %}
import { ShapeSource, CircleLayer, SymbolLayer } from '@rnmapbox/maps'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}
const shapeSourceRef{{ element.unique_id }} = React.useRef<ShapeSource>(null)
{% endset %}
{{ save_delayed('ph',ph)}}
<ShapeSource
  id="{{ element.unique_id }}"
  onPress={async (pressedShape) => {
    {{ element.values.onPress | raw }}
  }}
  ref={shapeSourceRef{{ element.unique_id }}}
  {% if element.values.clusterActive %}
  cluster={true}
  clusterMaxZoomLevel={14}
  clusterRadius={50}
  {% endif %}
  {% if element.values.key %}
 key={ {{ element.values.key }} }
  {% endif %}
  {% if element.values.clusterProperties %}clusterProperties={ {{ element.values.clusterProperties }} }{% endif %}
  shape={ {{ element.values.shape }} }
>
  {{ content | raw }}
</ShapeSource>