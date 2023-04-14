/*
path: mapBoxShapeSource.tpl
keyPath: elements/Geo/mapBoxShapeSource.tpl
unique_id: TDNt7sPp
*/
{% set bpr %}
import { ShapeSource } from '@rnmapbox/maps'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<ShapeSource
  id="earthquakes"
  onPress={async (pressedShape) => {
    if (shapeSource.current) {
      try {
        const [cluster] = pressedShape.features;

        const collection = await shapeSource.current.getClusterLeaves(
          cluster,
          999,
          0,
        );

        setSelectedCluster(collection);
      } catch {
        if (!pressedShape.features[0].properties?.cluster) {
          setSelectedCluster({
            type: 'FeatureCollection',
            features: [pressedShape.features[0]],
          });
        }
      }
    }
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
  }}
  shape={earthQuakesJSON as unknown as any}
>{{ content | raw }}</ShapeSource>