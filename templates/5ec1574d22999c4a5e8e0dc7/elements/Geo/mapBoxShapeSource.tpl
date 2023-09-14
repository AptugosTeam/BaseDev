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
const shapeSourceRef{{ element.unique_id }} = React.useRef<ShapeSource>(null)
{% endset %}
{{ save_delayed('ph',ph)}}
<Source
  ref={shapeSourceRef{{ element.unique_id }}}
  id="{{ element.unique_id }}"
  type="geojson"
  data={ {{ element.values.shape }} }
  cluster={true}
  clusterMaxZoom={14}
  clusterRadius={50}
  {% if element.values.clusterProperties %}clusterProperties={ {{ element.values.clusterProperties }} }{% endif %}
>
  {{ content | raw }}
</Source>