/*
path: 996_googleplacesmap.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Interact/Google
  API/996_googleplacesmap.tsx
keyPath: elements/Interact/Google API/996_googleplacesmap.tsx
unique_id: hQJN7N9t
*/
import React from 'react'

const Map = (props: any) => {
  const { inputId } = props
  const ref = React.useRef(null)

  React.useEffect(() => {
    document.getElementById('placesScript').addEventListener('load', renderGoogle)
  }, [])

  React.useEffect(() => {
    if (ref.current && window.mapsApi[inputId]) renderGoogle()
  }, [ref.current, window.mapsApi[inputId]])

  const renderGoogle = () => {
    // @ts-ignore
    window.mapsApi['map_' + inputId] = new window.google.maps.Map(ref.current, {
      center: { lat: props.lat || 40.749933, lng: props.lng || -73.98633 },
      zoom: props.zoom || 13,
      mapTypeControl: false,
    })
    window.mapsApi[inputId].bindTo("bounds", window.mapsApi['map_' + inputId])

    // @ts-ignore
    window.mapsApi['marker_' + inputId] = new window.google.maps.Marker({ map: window.mapsApi['map_' + inputId], anchorPoint: new window.google.maps.Point(0, -29) })

    if (props.renderMarker && props.lat && props.lng) {
      window.mapsApi['marker_' + inputId].setPosition({
        lat: props.lat,
        lng: props.lng,
      });
    }
  
    window.mapsApi[inputId].addListener("place_changed", () => {
      setTimeout(() => {
        const place = window.mapsApi[inputId].getPlace()
        const marker = window.mapsApi['marker_' + inputId]
        marker.setVisible(false)
  
        if (!place.geometry || !place.geometry.location) {
          return
        }
  
        if (place.geometry.viewport) {
          window.mapsApi['map_' + inputId].fitBounds(place.geometry.viewport)
        } else {
          window.mapsApi['map_' + inputId].setCenter(place.geometry.location)
          window.mapsApi['map_' + inputId].setZoom(17)
        }
  
        marker.setPosition(place.geometry.location)
        marker.setVisible(true)
      },600)
    })
  }

  return (
    <div ref={ref} className={props.className}>Loading map...</div>
  )
}

export default Map
