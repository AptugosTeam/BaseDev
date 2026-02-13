/*
path: googlePlaces.tpl
keyPath: elements/Interact/Google API/googlePlaces.tpl
unique_id: t0lzhBKH
settings:
  - name: Packages
    value: '"@vis.gl/react-google-maps": "1.4.2",'
options:
  - name: placesKey
    display: Google Places API Key
    type: text
  - name: inputId
    display: Input ID
    type: text
  - name: className
    display: ClassName
    type: styles
  - name: onchange
    display: On Change
    type: function
  - name: initialValue
    display: Initial Value
    type: text
  - name: placeholder
    display: Placeholder Text
    type: text
  - name: disableVariable
    display: Variable to disable input
    type: text
extraFiles:
  - source: 'elements/99_ExtraFiles/997_googleplaces.tsx'
    destination: 'src/components/PlacesAutoComplete/index.tsx'
  - source: 'elements/99_ExtraFiles/996_googleplacesmap.tsx'
    destination: 'src/components/PlacesAutoComplete/map.tsx'
*/
{% set bpr %}
import { useMapsLibrary } from '@vis.gl/react-google-maps'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const places = useMapsLibrary('places')
{% endset %}
{{ save_delayed('ph',ph) }}
<PlacesAutoComplete 
  placesKey={{ element.values.placesKey | textOrVariable }}
  inputId={{ element.values.inputId|default(element.unique_id) | textOrVariable }}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  onChange={ {{ element.values.onchange | functionOrCall }} }
  {% if element.values.initialValue %}initialValue={{ element.values.initialValue | textOrVariable }}{% endif %}
  {% if element.values.placeholder %}placeholder={{ element.values.placeholder | textOrVariable }}{% endif %}
  {% if element.values.disableVariable %}disabled={ {{ element.values.disableVariable }} }{% endif %}
/>