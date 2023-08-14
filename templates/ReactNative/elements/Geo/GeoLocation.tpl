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

Location.requestForegroundPermissionsAsync().then(status => {
  if (status !== 'granted') {
    console.error('Permission to access location was denied')
    return
  } else {
    Location.getCurrentPosition().then(currentLocation => {
      {{ element.values.statevar }}(position.coords)
      {{ content | raw }}
    })
  }
})
