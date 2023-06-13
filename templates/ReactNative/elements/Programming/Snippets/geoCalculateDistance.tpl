/*
path: geoCalculateDistance.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/ReactNative/elements/Programming/Snippets/geoCalculateDistance.tpl
keyPath: elements/Programming/Snippets/geoCalculateDistance.tpl
unique_id: WZaSxFAm
*/
{% set bpr %}
import * as Location from 'expo-location'
{% endset %}
{{ save_delayed('bpr',bpr)}}
const calculateDistance = (lat1, lon1, lat2, lon2) => {
  const toRadians = (degrees) => degrees * (Math.PI / 180)
  const earthRadius = 6371
  const dLat = toRadians(lat2 - lat1)
  const dLon = toRadians(lon2 - lon1)

  const a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(toRadians(lat1)) * Math.cos(toRadians(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2)

  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
  const distance = earthRadius * c

  return Number(distance).toFixed(1)
}