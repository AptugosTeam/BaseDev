/*
path: Marker.tsx
keyPath: elements/Geo/MapBox/Marker.tsx
unique_id: eKB0b32T
*/
import mapboxgl from '!mapbox-gl' // eslint-disable-line import/no-webpack-loader-syntax
import React, { FunctionComponent, useEffect, useRef, useState } from 'react'
import './mapbox.css'

const Marker: FunctionComponent<any> = (props) => {
  
  React.useEffect(() => {
    if (props.map) {
      const marker = new mapboxgl.Marker({
        color: "#FFFFFF",
        draggable: true
        }).setLngLat([30.5, 50.5])
        .addTo(props.map)
    }
  },[props.map])
    
  return null
}

export default Marker
