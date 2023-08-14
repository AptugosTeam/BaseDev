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
<ShapeSource
  id="{{ element.unique_id }}"
  onPress={async (pressedShape) => {
    {{ element.values.onPress | raw }}
  }}
  ref={shapeSource}
  cluster
  clusterRadius={50}
  clusterMaxZoomLevel={14}
  {% if element.values.clusterProperties %}clusterProperties={ {{ element.values.clusterProperties }} }{% endif %}
  shape={ {{ element.values.shape }} }
>
  {{ content | raw }}
</ShapeSource>