/*
path: mapBox.tpl
keyPath: elements/Geo/mapBox.tpl
unique_id: z2fTET0T
icon: ico-leaflet
internalUse: false
options:
  - name: accessToken
    display: Access Token
    type: text
  - name: className
    display: ClassName
    type: styles
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
    settings:
      default: 0
extraFiles:
  - source: 'elements/Geo/MapBox/MapBox.tsx'
    destination: 'front-end/components/MapBox/MapBox.tsx'
  - source: 'elements/Geo/MapBox/Marker.tsx'
    destination: 'front-end/components/MapBox/Marker.tsx'
  - source: 'elements/Geo/MapBox/index.tsx'
    destination: 'front-end/components/MapBox/index.tsx'
  - source: 'elements/Geo/MapBox/mapbox.css'
    destination: 'front-end/components/MapBox/mapbox.css'
settings:
  - name: Packages
    value: '"mapbox-gl": "2.13.0",'
*/
{% set bpr %}
import MapBox from '../components/MapBox'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<MapBox
  accessToken='{{ element.values.accessToken }}'
  className={ {{ element.values.className}} }
  {% if element.values.navigationControl %}navigationControl={ {{ element.values.navigationControl|textOrVariable }} }{% endif %}
  {% if element.values.fullScreenControl %}fullScreenControl={ {{ element.values.fullScreenControl|textOrVariable }} }{% endif %}
  {% if element.values.geoLocateControl %}geoLocateControl{% endif %}
  {% if element.values.antialias %}antialias={ {{ element.values.antialias }} }{% endif %}
  {% if element.values.attributionControl %}attributionControl={ {{ element.values.attributionControl }} }{% endif %}
  {% if element.values.bearing %}bearing={{ element.values.bearing | textOrVariable }}{% endif %}
  {% if element.values.bearingSnap %}bearingSnap={{ element.values.bearingSnap | textOrVariable }}{% endif %}
  {% if element.values.bounds %}bounds={ {{ element.values.bounds }} }{% endif %}
  {% if element.values.boxZoom %}boxZoom={{ element.values.boxZoom | textOrVariable }}{% endif %}
  {% if element.values.center %}center={ {{ element.values.center }} }{% endif %}
  {% if element.values.clickTolerance %}clickTolerance={{ element.values.clickTolerance | textOrVariable }}{% endif %}
  {% if element.values.collectResourceTiming %}collectResourceTiming={{ element.values.collectResourceTiming | textOrVariable }}{% endif %}
  {% if element.values.cooperativeGestures %}cooperativeGestures={{ element.values.cooperativeGestures | textOrVariable }}{% endif %}
  {% if element.values.crossSourceCollisions %}crossSourceCollisions={{ element.values.crossSourceCollisions | textOrVariable }}{% endif %}
  {% if element.values.customAttribution %}customAttribution={{ element.values.customAttribution | textOrVariable }}{% endif %}
  {% if element.values.doubleClickZoom %}doubleClickZoom={{ element.values.doubleClickZoom | textOrVariable }}{% endif %}
  {% if element.values.dragPan %}dragPan={{ element.values.dragPan | textOrVariable }}{% endif %}
  {% if element.values.dragRotate %}dragRotate={{ element.values.dragRotate | textOrVariable }}{% endif %}
  {% if element.values.fadeDuration %}fadeDuration={{ element.values.fadeDuration | textOrVariable }}{% endif %}
  {% if element.values.failIfMajorPerformanceCaveat %}failIfMajorPerformanceCaveat={{ element.values.failIfMajorPerformanceCaveat | textOrVariable }}{% endif %}
  {% if element.values.fitBoundsOptions %}fitBoundsOptions={{ element.values.fitBoundsOptions | textOrVariable }}{% endif %}
  {% if element.values.interactive %}interactive={{ element.values.interactive | textOrVariable }}{% endif %}
  {% if element.values.keyboard %}keyboard={{ element.values.keyboard | textOrVariable }}{% endif %}
  {% if element.values.language %}language={{ element.values.language | textOrVariable }}{% endif %}
  {% if element.values.locale %}locale={{ element.values.locale | textOrVariable }}{% endif %}
  {% if element.values.localFontFamily %}localFontFamily={{ element.values.localFontFamily | textOrVariable }}{% endif %}
  {% if element.values.localIdeographFontFamily %}localIdeographFontFamily={{ element.values.localIdeographFontFamily | textOrVariable }}{% endif %}
  {% if element.values.maxBounds %}maxBounds={{ element.values.maxBounds | textOrVariable }}{% endif %}
  {% if element.values.maxPitch %}maxPitch={{ element.values.maxPitch | textOrVariable }}{% endif %}
  {% if element.values.maxTileCacheSize %}maxTileCacheSize={{ element.values.maxTileCacheSize | textOrVariable }}{% endif %}
  {% if element.values.maxZoom %}maxZoom={{ element.values.maxZoom | textOrVariable }}{% endif %}
  {% if element.values.minPitch %}minPitch={{ element.values.minPitch | textOrVariable }}{% endif %}
  {% if element.values.minTileCacheSize %}minTileCacheSize={{ element.values.minTileCacheSize | textOrVariable }}{% endif %}
  {% if element.values.minZoom %}minZoom={{ element.values.minZoom | textOrVariable }}{% endif %}
  {% if element.values.optimizeForTerrain is defined %}optimizeForTerrain={{ element.values.optimizeForTerrain | textOrVariable }}{% endif %}
  {% if element.values.performanceMetricsCollection %}performanceMetricsCollection={{ element.values.performanceMetricsCollection | textOrVariable }}{% endif %}
  {% if element.values.pitch %}pitch={{ element.values.pitch | textOrVariable }}{% endif %}
  {% if element.values.pitchWithRotate %}pitchWithRotate={{ element.values.pitchWithRotate | textOrVariable }}{% endif %}
  {% if element.values.preserveDrawingBuffer %}preserveDrawingBuffer={{ element.values.preserveDrawingBuffer | textOrVariable }}{% endif %}
  {% if element.values.projection %}projection={{ element.values.projection | textOrVariable }}{% endif %}
  {% if element.values.refreshExpiredTiles %}refreshExpiredTiles={{ element.values.refreshExpiredTiles | textOrVariable }}{% endif %}
  {% if element.values.renderWorldCopies %}renderWorldCopies={{ element.values.renderWorldCopies | textOrVariable }}{% endif %}
  {% if element.values.scrollZoom %}scrollZoom={{ element.values.scrollZoom | textOrVariable }}{% endif %}
  {% if element.values.style %}style={{ element.values.style | textOrVariable }}{% endif %}
  {% if element.values.testMode %}testMode={{ element.values.testMode | textOrVariable }}{% endif %}
  {% if element.values.touchPitch %}touchPitch={{ element.values.touchPitch | textOrVariable }}{% endif %}
  {% if element.values.touchZoomRotate %}touchZoomRotate={{ element.values.touchZoomRotate | textOrVariable }}{% endif %}
  {% if element.values.trackResize %}trackResize={{ element.values.trackResize | textOrVariable }}{% endif %}
  {% if element.values.transformRequest %}transformRequest={{ element.values.transformRequest | textOrVariable }}{% endif %}
  {% if element.values.useWebGL2 %}useWebGL2={{ element.values.useWebGL2 | textOrVariable }}{% endif %}
  {% if element.values.worldview %}worldview={{ element.values.worldview | textOrVariable }}{% endif %}
  {% if element.values.zoom %}zoom={{ element.values.zoom | textOrVariable }}{% endif %}
/>