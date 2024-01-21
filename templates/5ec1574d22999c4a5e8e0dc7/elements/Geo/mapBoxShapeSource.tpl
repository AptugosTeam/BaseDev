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
  - name: cluster
    display: Cluster
    type: dropdown
    options:
      return [['true', 'True'],['false', 'False']]
  - name: onPress
    display: On Press
    type: function
*/
<Source
  id="{{ element.unique_id }}"
  type="geojson"
  data={ {{ element.values.shape }} }
  {% if element.values.cluster %}cluster={ {{ element.values.cluster }} }{% endif %}
  clusterMaxZoom={14}
  clusterRadius={50}
  {% if element.values.clusterProperties %}clusterProperties={ {{ element.values.clusterProperties }} }{% endif %}
>
  {{ content | raw }}
</Source>