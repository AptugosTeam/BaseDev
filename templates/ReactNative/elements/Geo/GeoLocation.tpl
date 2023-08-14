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
;(async () => {
  const { status } = await Location.requestForegroundPermissionsAsync()

      if (status !== 'granted') {
        console.error('Permission to access location was denied')
        return
      }

      const position = await Location.getCurrentPositionAsync({})
      {{ element.values.statevar }}(position.coords)
      {{ content | raw }}
    })()
