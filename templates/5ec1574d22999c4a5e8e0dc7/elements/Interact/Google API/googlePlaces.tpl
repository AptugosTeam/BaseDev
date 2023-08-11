/*
path: googlePlaces.tpl
keyPath: elements/Interact/Google API/googlePlaces.tpl
unique_id: t0lzhBKH
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
extraFiles:
  - source: 'elements/Interact/Google API/997_googleplaces.tsx'
    destination: 'front-end/Components/PlacesAutoComplete/index.tsx'
*/
{% set bpr %}
import PlacesAutoComplete from '@components/PlacesAutocomplete'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<PlacesAutoComplete 
  placesKey={{ element.values.placesKey | textOrVariable }}
  inputId={{ element.values.inputID|default(element.unique_id) | textOrVariable }}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  onChange={ {{ element.values.onchange | functionOrCall }} }
/>