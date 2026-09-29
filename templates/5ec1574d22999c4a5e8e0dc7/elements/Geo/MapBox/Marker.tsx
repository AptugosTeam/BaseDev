/*
path: Marker.tsx
keyPath: elements/Geo/MapBox/Marker.tsx
unique_id: eKB0b32T
*/
import mapboxgl from '!mapbox-gl' // eslint-disable-line import/no-webpack-loader-syntax
import React, { FunctionComponent } from 'react'
import './mapbox.css'

const Marker: FunctionComponent<any> = (props) => {
  React.useEffect(() => {
    if (!props.map) return

    const marker = new mapboxgl.Marker({
      color: props.color || '#CE0D2D', 
    })
      .setLngLat([props.longitude, props.latitude])
      .addTo(props.map)

    return () => marker.remove()
  }, [props.map, props.latitude, props.longitude, props.color])

  return null
}

export default Marker