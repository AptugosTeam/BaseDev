/*
path: googlePlacesMap.tpl
unique_id: t0lzhBKM
options:
  - name: inputId
    display: Input ID
    type: text
    required: true
  - name: className
    display: ClassName
    type: styles
  - name: lat
    display: Initial Latitude
    type: text
  - name: lng
    display: Initial Longitude
    type: text
  - name: zoom
    display: Initial Zoom
    type: text
  - name: renderMarker
    display: Render Marker
    type: checkbox
extraFiles:
  - source: 'elements/Interact/Google API/997_googleplaces.tsx'
    destination: 'front-end/Components/PlacesAutoComplete/index.tsx'
  - source: 'elements/Interact/Google API/996_googleplacesmap.tsx'
    destination: 'front-end/Components/PlacesAutoComplete/map.tsx'
*/
{% set bpr %}
import { PlacesMap } from '@components/PlacesAutocomplete'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<PlacesMap 
  inputId={{ element.values.inputId | textOrVariable }}
  {% if element.values.className %}className={ {{ element.values.className }} }{% else %}style={ { width: 400, height: 400 } }{% endif %}
  {% if element.values.lat %}lat={ {{ element.values.lat }} }{% endif %}
  {% if element.values.lng %}lng={ {{ element.values.lng }} }{% endif %}
  {% if element.values.zoom %}zoom={ {{ element.values.zoom }} }{% endif %}
  {% if element.values.renderMarker %}renderMarker{% endif %}
/>