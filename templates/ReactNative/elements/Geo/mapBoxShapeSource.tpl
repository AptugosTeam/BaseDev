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
  - name: onPress
    display: On Press
    type: function
*/
{% set bpr %}
import { ShapeSource, CircleLayer, SymbolLayer } from '@rnmapbox/maps'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}
const shapeSource = React.useRef<ShapeSource>(null)
{% endset %}
{{ save_delayed('ph',ph)}}
<ShapeSource
  id="{{ element.unique_id }}"
  onPress={async (pressedShape) => {
    {{ element.values.onPress | raw }}
  }}
  ref={shapeSource}
  cluster
  clusterRadius={50}
  clusterMaxZoomLevel={14}
  clusterProperties={ {{ element.values.clusterProperties }} }
  shape={ {{ element.values.shape }} }
>
  {{ content | raw }}
</ShapeSource>