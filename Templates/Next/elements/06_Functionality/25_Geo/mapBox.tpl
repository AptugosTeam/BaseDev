/*
path: mapBox.tpl
keyPath: elements/Geo/mapBox.tpl
unique_id: z2fTET0T
icon: ico-mapbox
internalUse: false
order: 20
options:
  - name: accessToken
    display: Access Token
    type: text
  - name: className
    display: ClassName
    type: styles
  - name: onMapIdle
    display: On Map Idle
    type: function
  - name: onClick
    display: On Click
    type: function
  - name: navigationControl
    display: Show Navigation Control
    type: dropdown
    options: return [['top-right','Top Right'],['bottom-right','Bottom Right'],['bottom-left','Bottom Left'],['top-left','Top Left']]
  - name: fullScreenControl
    display: Show Full Screen Control
    type: dropdown
    options: return [['top-right','Top Right'],['bottom-right','Bottom Right'],['bottom-left','Bottom Left'],['top-left','Top Left']]
  - name: geoLocateControl
    display: Show Geo Locate Control
    type: checkbox
  - name: antialias
    display: antialias
    type: checkbox
  - name: attributionControl
    display: Attribution Control
    type: checkbox
    settings:
      default: true
  - name: bearing
    display: bearing
    type: text
    settings:
      default: 0
  - name: bearingSnap
    display: Bearing Snap
    type: text
    settings:
      default: 7
  - name: bounds
    display: Bounds
    type: text
  - name: boxZoom
    display: Box Zoom Interaction
    type: checkbox
    settings:
      default: true
  - name: center
    display: Center
    type: text
    settings:
      default: [[0,0]]
  - name: clickTolerance
    display: Click Tolerance
    type: text
    settings:
      default: 3
  - name: collectResourceTiming
    display: Collect Resource Timing
    type: checkbox
    settings:
      default: false
  - name: cooperativeGestures
    display: Cooperative Gestures
    type: checkbox
    settings:
      default: false
  - name: crossSourceCollisions
    display: CrossSource Collisions
    type: checkbox
    settings:
      default: true
  - name: customAttribution
    display: Custom Attribution
    type: text
  - name: doubleClickZoom
    display: Double Click Zoom
    type: checkbox
    settings:
      default: true
  - name: dragPan
    display: Drag Pan
    type: checkbox
    settings:
      default: true
  - name: dragRotate
    display: Drag Pan
    type: checkbox
    settings:
      default: true
  - name: fadeDuration
    display: Fade Duration
    type: text
    settings:
      default: 300
  - name: failIfMajorPerformanceCaveat
    display: Fall If Major Performance Caveat
    type: checkbox
    settings:
      default: false
  - name: fitBoundsOptions
    display: Fit Bounds Options
    type: text
  - name: interactive
    display: Interactive
    type: checkbox
    settings:
      default: true
  - name: keyboard
    display: Keyboard Navigation
    type: checkbox
    settings:
      default: true
  - name: language
    display: Language
    type: text
  - name: locale
    display: Locale
    type: text
  - name: localFontFamily
    display: Local FontFamily
    type: checkbox
  - name: localIdeographFontFamily
    display: Local Ideograph FontFamily
    type: text
    settings:
      default: 'sans-serif'
  - name: locale
    display: Locale
    type: text
    settings:
      default: 'bottom-left'
  - name: maxBounds
    display: MAx Bounds
    type: text
  - name: maxPitch
    display: Max Pitch
    type: text
    settings:
      default: 85
  - name: maxTileCacheSize
    display: Max Tile Cache Size
    type: text
  - name: maxZoom
    display: Max Zoom
    type: text
    settings:
      default: 22
  - name: minPitch
    display: Min Pitch
    type: text
    settings:
      default: 0
  - name: minTileCacheSize
    display: Min Tile Cache Size
    type: text
  - name: minZoom
    display: Min Zoom
    type: text
    settings:
      default: 0
  - name: optimizeForTerrain
    display: Optimize For Terrain
    type: checkbox
    settings:
      default: true
  - name: performanceMetricsCollection
    display: Performance Metrics Collection
    type: checkbox
    settings:
      default: true
  - name: pitch
    display: Pitch
    type: text
    settings:
      default: 0
  - name: pitchWithRotate
    display: Pitch With Rotate
    type: checkbox
    settings:
      default: true
  - name: preserveDrawingBuffer
    display: Preserver Drawing Buffer
    type: checkbox
  - name: projection
    display: Projection
    type: text
    settings:
      default: 'mercator'
  - name: refreshExpiredTiles
    display: Refresh Expired Tiles
    type: checkbox
    settings:
      default: true
  - name: renderWorldCopies
    display: Render World Copies
    type: checkbox
    settings:
      default: true
  - name: scrollZoom
    display: Scroll Zoom
    type: checkbox
    settings:
      default: true
  - name: style
    display: Style
    type: text
    settings:
      default: 'mapbox://styles/mapbox/streets-v11'
  - name: testMode
    display: Test Mode
    type: checkbox
  - name: touchPitch
    display: Touch Pitch
    type: checkbox
    settings:
      default: true 
  - name: touchZoomRotate
    display: Touch Zoom Rotate
    type: checkbox
    settings:
      default: true   
  - name: trackResize
    display: Track Resize
    type: checkbox
    settings:
      default: true
  - name: transformRequest
    display: Transform Request
    type: text
  - name: useWebGL2
    display: Use WebGL2
    type: checkbox
  - name: worldview
    display: WorldView
    type: text
  - name: zoom
    display: Zoom
    type: text
  - name: maxBounds
    display: Max bounds
    type: text
    settings:
      default: 0
extraFiles:
  - source: 'elements/99_ExtraFiles/MapBox/mapbox.module.scss'
    destination: 'src/components/MapBox/mapbox.module.scss'
  - source: 'elements/99_ExtraFiles/MapBox/Marker.tsx'
    destination: 'src/components/MapBox/Marker.tsx'
  - source: 'elements/99_ExtraFiles/MapBox/index.tsx'
    destination: 'src/components/MapBox/index.tsx'
  - source: 'elements/99_ExtraFiles/MapBox/MapBox.tsx'
    destination: 'src/components/MapBox/MapBox.tsx'
settings:
  - name: Packages
    value: '"mapbox-gl": "3.21.0","react-map-gl": "^8.1.0",'
*/
{% set bpr %}
  import '@components/MapBox/mapbox.module.scss'
  import Map, {
    Layer,
    NavigationControl,
    ScaleControl,
    Source,
    type MapRef,
  } from 'react-map-gl/mapbox'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% if element.values.navigationControl %}
{% set bpr %}
  import { NavigationControl } from 'react-map-gl'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% endif %}
{% set interactiveLayerIds = [] %}
{% set onPressArraySource = [] %}
{% for child in element.children %}
  {% if child.values.onPress %}
    {% set onPressArraySource = onPressArraySource|merge([child.values.onPress]) %}
    {% set interactiveLayerIds = interactiveLayerIds|merge([child.unique_id]) %}
    {% if child.children %}
      {% for subchild in child.children %}
        {% set interactiveLayerIds = interactiveLayerIds|merge([subchild.unique_id]) %}
      {% endfor %}
    {% endif %}
  {% endif %}
{% endfor %}
{% set onPressArray = [] %}
{% for onclick in onPressArraySource %}
    {% if onclick not in onPressArray %}
    {% set onPressArray = onPressArray|merge([onclick]) %}
    {% endif %}
{% endfor %}

<div className={ {{ element.values.className}} }>
  <Map
    interactiveLayerIds={ {{ interactiveLayerIds|json_encode }} }
    initialViewState={ {
      latitude: locat.latitude,
      longitude: locat.longitude,
      zoom: zoom,
      bearing: 0,
      pitch: 0
    } }
    ref={mapRef}
    mapStyle={{ element.values.style |default('mapbox://styles/mapbox/light-v9') | textOrVariable }}
    mapboxAccessToken='{{ element.values.accessToken }}'
    onLoad={(e) => {
      if (mapRef.current) {
        const loadURL = async (url) => {
          const response = await fetch(url)
          if (!response.ok) throw new Error(`Failed to load image: ${url}`)
          const imageBlob = await response.blob()
          return URL.createObjectURL(imageBlob)
        }

        mapRef.current.on('styleimagemissing', (e) => {
          loadURL(e.id).then(response => {
            mapRef.current.loadImage(response, (error, image) => {
              if (error) return
              mapRef.current.addImage(e.id, image)
            })
          }).catch(() => {})
        })
      }
    }}
    {% if element.values.maxBounds %}maxBounds={ {{ element.values.maxBounds }} }{% endif %}
    onIdle={onMapIdle}
    {% if onPressArray %}
      onClick={async(pressedShape) => { {{ onPressArray | join | raw }} }}
    {% endif %}
{% if element.values.onClick %}onClick={ {{ element.values.onClick | functionOrCall }} }{% endif %}
  >
    {% if element.values.navigationControl %}<NavigationControl position={{ element.values.navigationControl|textOrVariable }} />{% endif %}
    <ScaleControl />
    {{ content | raw }}
  </Map>
</div>
