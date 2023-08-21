/*
path: GeoLocation.tpl
type: file
unique_id: r4TVaLmT
icon: ico-geolocalization
children: []
options:
  - name: statevar
    display: State Function to Update
    type: text
*/
navigator.geolocation.getCurrentPosition((position) => {
    {{ element.values.statevar }}({ longitude: Number(position.coords.longitude), latitude: Number(position.coords.latitude) })
    {{ content | raw }}
})
