/*
path: GeoLocation.tpl
type: file
unique_id: r4TVaLmT
icon: ico-geolocalization
children: []
*/
navigator.geolocation.getCurrentPosition((position) => { 
    {{ element.values.varName|default('setleaftLetPosition') }}([ position.coords.latitude, position.coords.longitude ])
})
