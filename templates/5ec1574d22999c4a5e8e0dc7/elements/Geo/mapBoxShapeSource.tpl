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
{% set ph %}
const shapeSource = React.useRef<ShapeSource>(null)
{% endset %}
{{ save_delayed('ph',ph)}}
<Source
  id="{{ element.unique_id }}"
  type="geojson"
  data={ {{ element.values.shape }} }
  cluster={true}
  clusterMaxZoom={14}
  clusterRadius={50}
  {% if element.values.clusterProperties %}clusterProperties={ {{ element.values.clusterProperties }} }{% endif %}
  onPress={async (pressedShape) => {
    {{ element.values.onPress | raw }}
  }}
>
  <Layer {...clusterLayer} />
  <Layer {...clusterCountLayer} />
  <Layer {...unclusteredPointLayer} />
</Source>