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
*/
<Source
  id="{{ element.unique_id }}"
  type="geojson"
  data={ {{ element.values.shape }} }
  {% if element.values.clusterActive %}
  cluster={true}
  clusterMaxZoom={14}
  clusterRadius={50}
  {% endif %}
  {% if element.values.clusterProperties %}clusterProperties={ {{ element.values.clusterProperties }} }{% endif %}
>
  {{ content | raw }}
</Source>