/*
path: MapBox.tsx
keyPath: elements/Geo/MapBox/MapBox.tsx
unique_id: sLXEEizE
*/
import mapboxgl from '!mapbox-gl' // eslint-disable-line import/no-webpack-loader-syntax
import React, { FunctionComponent, useEffect, useRef, useState, cloneElement, Children } from 'react'
import './mapbox.css'

const MapBox: FunctionComponent<any> = (props) => {
  mapboxgl.accessToken = props.accessToken
  const mapContainer = useRef(null)
  const map = useRef(null)
  const [lng, setLng] = useState(-70.9)
  const [lat, setLat] = useState(42.35)
  const [zoom, setZoom] = useState(9)

  const addPropToChildren = (children:any) => {
    return Children.map(children, child => {
      if (!React.isValidElement(child)) return child
      
      const childProps:any = { map: map.current }
      if ((child.props as any).children) {
        childProps.children = addPropToChildren((child.props as any).children)
      }
      return cloneElement(child, childProps);
    })
  }

  const childrenWithProps = addPropToChildren(props.children)


  useEffect(() => {
    if (map.current) return

    const mapOptions: any = {
      antialias: props.antialias || false,
      attributionControl: props.attributionControl || true,
      bearing: props.bearing || 0,
      bearingSnap: props.bearingSnap,
      bounds: props.bounds || null,
      boxZoom: props.boxZoom || true,
      center: props.center || [lng, lat],
      clickTolerance: props.clickTolerance || 3,
      collectResourceTiming: props.collectResourceTiming || false,
      container: mapContainer.current,
      cooperativeGestures: props.cooperativeGestures || false,
      crossSourceCollisions: props.crossSourceCollisions || true,
      customAttribution: props.customAttribution || null,
      doubleClickZoom: props.doubleClickZoom || true,
      dragPan: props.dragPan || true,
      dragRotate: props.dragRotate || true,
      fadeDuration: props.fadeDuration || 300,
      failIfMajorPerformanceCaveat: props.failIfMajorPerformanceCaveat || false,
      fitBoundsOptions: props.fitBoundsOptions || null,
      interactive: props.interactive || true,
      keyboard: props.keyboard || true,
      language: props.language || null,
      locale: props.locale || null,
      localFontFamily: props.localFontFamily || false,
      localIdeographFontFamily: props.localIdeographFontFamily || 'sans-serif',
      logoPosition: props.logoPosition || 'bottom-left',
      maxBounds: props.maxBounds || null,
      maxPitch: props.maxPitch || 85,
      maxTileCacheSize: props.maxTileCacheSize || null,
      maxZoom: props.maxZoom || 22,
      minPitch: props.minPitch || 0,
      minTileCacheSize: props.minTileCacheSize || null,
      minZoom: props.minZoom || 0,
      optimizeForTerrain: props.optimizeForTerrain || true,
      performanceMetricsCollection: props.performanceMetricsCollection || true,
      pitch: props.pitch || 0,
      pitchWithRotate: props.pitchWithRotate || true,
      preserveDrawingBuffer: props.preserveDrawingBuffer || false,
      projection: props.projection || 'mercator',
      refreshExpiredTiles: props.refreshExpiredTiles || true,
      renderWorldCopies: props.renderWorldCopies || true,
      scrollZoom: props.scrollZoom || true,
      style: props.style || 'mapbox://styles/mapbox/streets-v11',
      testMode: props.testMode || false,
      touchPitch: props.touchPitch || true,
      touchZoomRotate: props.touchZoomRotate || true,
      trackResize: props.trackResize || true,
      transformRequest: props.transformRequest || null,
      useWebGL2: props.useWebGL2 || false,
      worldview: props.worldview || null,
      zoom: props.zoom || 0,
    }

    map.current = new mapboxgl.Map(mapOptions)
    if (props.navigationControl) {
      map.current.addControl(new mapboxgl.NavigationControl(), props.navigationControl)
    }
    if (props.fullScreenControl) {
      map.current.addControl(new mapboxgl.FullscreenControl(), props.fullScreenControl)
    }

    if (props.geoLocateControl) {
      map.current.addControl(
        new mapboxgl.GeolocateControl({
          positionOptions: {
            enableHighAccuracy: true,
          },
          trackUserLocation: true,
          showUserHeading: true,
        })
      )
    }

    if (props.markers) {
      props.markers.map(marker => {
        const mapMarker = new mapboxgl.Marker({
          color: "#FFFFFF",
          draggable: true
          }).setLngLat([30.5, 50.5])
        mapMarker.addTo(map.current)
      })
    }
  }, [])

  useEffect(() => {
    if (!map.current) return // wait for map to initialize
    map.current.on('move', () => {
      setLng(map.current.getCenter().lng.toFixed(4))
      setLat(map.current.getCenter().lat.toFixed(4))
      setZoom(map.current.getZoom().toFixed(2))
    })
  })

  return (
    <div>
      <div ref={mapContainer} className={props.className} />
      {childrenWithProps}
    </div>
  )
}

export default MapBox