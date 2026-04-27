/*
path: polylineUtils.tsx
completePath: >-
  /home/user/Aptugo/BaseDev/Templates/ReactNative/elements/99_ExtraFiles/polylineUtils.tsx
keyPath: elements/99_ExtraFiles/polylineUtils.tsx
unique_id: fbBv63tZ
*/
export type RouteCoordinate = {
  latitude: number
  longitude: number
}

export const decodeGooglePolyline = (encodedPolyline: string) => {
  const coordinates: RouteCoordinate[] = []
  let latitude = 0
  let longitude = 0
  let index = 0

  while (index < encodedPolyline.length) {
    let result = 0
    let shift = 0
    let byte = 0

    do {
      byte = encodedPolyline.charCodeAt(index++) - 63
      result |= (byte & 0x1f) << shift
      shift += 5
    } while (byte >= 0x20)

    latitude += result & 1 ? ~(result >> 1) : result >> 1

    result = 0
    shift = 0

    do {
      byte = encodedPolyline.charCodeAt(index++) - 63
      result |= (byte & 0x1f) << shift
      shift += 5
    } while (byte >= 0x20)

    longitude += result & 1 ? ~(result >> 1) : result >> 1

    coordinates.push({
      latitude: latitude / 1e5,
      longitude: longitude / 1e5,
    })
  }

  return coordinates
}
