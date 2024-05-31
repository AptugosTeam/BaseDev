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
  - source: 'elements/Interact/Google API/997_googleplaces.tsx'
    destination: 'front-end/Components/PlacesAutoComplete/index.tsx'
  - source: 'elements/Interact/Google API/996_googleplacesmap.tsx'
    destination: 'front-end/Components/PlacesAutoComplete/map.tsx'
*/
{% set bpr %}
import PlacesAutoComplete from '@components/PlacesAutocomplete'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<PlacesAutoComplete 
  placesKey={{ element.values.placesKey | textOrVariable }}
  {% if element.values.inputId %}
  inputId={{ element.values.inputId|default(element.unique_id) | textOrVariable }}
  {% endif %}
  {% if element.values.className %}
    className={ {{ element.values.className }} }
  {% endif %}
  {% if element.values.onchange %}
    onChange={ {{ element.values.onchange | functionOrCall }} }
  {% endif %}
  {% if element.values.initialValue %}
    initialValue={{ element.values.initialValue | textOrVariable }}
  {% endif %}
  {% if element.values.placeholder %}
    placeholder={{ element.values.placeholder | textOrVariable }}
  {% endif %}
  {% if element.values.disableVariable %}
    disabled={ {{ element.values.disableVariable }} }
  {% endif %}
/>