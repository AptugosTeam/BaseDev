/*
path: mapBoxShapeSource.tpl
keyPath: elements/Geo/mapBoxShapeSource.tpl
unique_id: TDNt7sPp
icon: ico-leaflet
options:
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
  clusterProperties={ {
    mag1: [
      ['+', ['accumulated'], ['get', 'mag1']],
      ['case', mag1, 1, 0],
    ],
    mag2: [
      ['+', ['accumulated'], ['get', 'mag2']],
      ['case', mag2, 1, 0],
    ],
    mag3: [
      ['+', ['accumulated'], ['get', 'mag3']],
      ['case', mag3, 1, 0],
    ],
    mag4: [
      ['+', ['accumulated'], ['get', 'mag4']],
      ['case', mag4, 1, 0],
    ],
    mag5: [
      ['+', ['accumulated'], ['get', 'mag5']],
      ['case', mag5, 1, 0],
    ],
  } }
  shape={theData as unknown as any}
>
  <SymbolLayer id="pointCount" style={layerStyles.clusterCount} />

  <CircleLayer id="clusteredPoints" belowLayerID="pointCount" filter={['has', 'point_count']} style={layerStyles.clusteredPoints} />

  <CircleLayer id="singlePoint" filter={['!', ['has', 'point_count']]} style={layerStyles.singlePoint} />
</ShapeSource>