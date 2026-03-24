/*
path: GooglePlacesAutocomplete.tpl
completePath: elements/Geo/GooglePlacesAutocomplete.tpl
type: file
unique_id: QmQFXmAB
icon: ico-geolocalization
helpText: Search an address with Google Places and sync it with your form state
options:
  - name: apiKey
    display: Google Maps API Key
    type: text
    options: ''
  - name: syncState
    display: Sync to state
    type: checkbox
    settings:
      default: false
  - name: stateVariable
    display: State Variable
    type: text
    options: ''
    settings:
      default: editClient
      propertyCondition: syncState
      condition: true
  - name: addressField
    display: Address Field
    type: text
    options: ''
    settings:
      propertyCondition: syncState
      condition: true
  - name: latField
    display: Latitude Field
    type: text
    options: ''
    settings:
      propertyCondition: syncState
      condition: true
  - name: lngField
    display: Longitude Field
    type: text
    options: ''
    settings:
      propertyCondition: syncState
      condition: true
  - name: mapRef
    display: Map Ref
    type: text
    options: ''
  - name: placeholder
    display: Placeholder
    type: text
    options: ''
  - name: language
    display: Language
    type: text
    options: ''
  - name: countryCode
    display: Country Code
    type: text
    options: ''
  - name: latitudeDelta
    display: Latitude Delta
    type: text
    options: ''
    settings:
      default: '0.01'
  - name: longitudeDelta
    display: Longitude Delta
    type: text
    options: ''
    settings:
      default: '0.01'
  - name: textInputStyle
    display: TextInput Style
    type: styles
    options: ''
  - name: containerStyle
    display: Container Style
    type: styles
    options: ''
  - name: listViewStyle
    display: List View Style
    type: styles
    options: ''
  - name: showRightButton
    display: Show Right Button
    type: checkbox
    settings:
      default: false
  - name: rightButtonContainerStyle
    display: Right Button Container Style
    type: text
    options: ''
    settings:
      propertyCondition: showRightButton
      condition: true
  - name: rightButtonIcon
    display: Right Button Icon
    type: text
    options: ''
    settings:
      propertyCondition: showRightButton
      condition: true
  - name: rightButtonColor
    display: Right Button Color
    type: text
    options: ''
    settings:
      default: '#9C9C9C'
      propertyCondition: showRightButton
      condition: true
  - name: rightButtonSize
    display: Right Button Size
    type: text
    options: ''
    settings:
      default: '20'
      propertyCondition: showRightButton
      condition: true
  - name: onPlaceSelected
    display: On Place Selected
    type: code
    options: ''
settings:
  - name: Packages
    value: '"react-native-google-places-autocomplete": "^2.6.4",'
children: []
*/
{% set hasStyles = element.values.textInputStyle or element.values.containerStyle or element.values.listViewStyle %}
{% set bpr %}
{% if element.values.rightButtonContainerStyle %}
import { View } from 'react-native'
{% endif %}
import { GooglePlacesAutocomplete } from 'react-native-google-places-autocomplete'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<GooglePlacesAutocomplete
  {% if element.values.placeholder %}
  placeholder={{ element.values.placeholder | textOrVariable }}
  {% endif %}
  fetchDetails
  onPress={(data, details = null) => {
    if (details?.geometry?.location) {
      const lat = details.geometry.location.lat
      const lng = details.geometry.location.lng
      {% if element.values.syncState %}
      set{{ element.values.stateVariable }}((prev) => ({
        ...prev,
        {{ element.values.addressField|default('Address') }}: data.description,
        {{ element.values.latField|default('lat') }}: lat,
        {{ element.values.lngField|default('lng') }}: lng,
      }))
      {% endif %}
      {% if element.values.mapRef %}
      {{ element.values.mapRef }}.current?.animateToRegion({
        latitude: lat,
        longitude: lng,
        latitudeDelta: {{ element.values.latitudeDelta|default('0.01') }},
        longitudeDelta: {{ element.values.longitudeDelta|default('0.01') }},
      })
      {% endif %}
      {% if element.values.onPlaceSelected %}
      {{ element.values.onPlaceSelected }}
      {% endif %}
      {{ content | raw }}
    }
  }}
  query={ {
    key: {{ element.values.apiKey }},
    {% if element.values.language %}
    language: '{{ element.values.language|default("es") }}',
    {% endif %}
    {% if element.values.countryCode %}
    components: 'country:{{ element.values.countryCode }}',
    {% endif %}
  } }
  {% if hasStyles %}
  styles={ {
    {% if element.values.textInputStyle %}
    textInput: {{ element.values.textInputStyle | raw }},
    {% endif %}
    {% if element.values.containerStyle %}
    container: {{ element.values.containerStyle | raw }},
    {% endif %}
    {% if element.values.listViewStyle %}
    listView: {{ element.values.listViewStyle | raw }},
    {% endif %}
  } }
  {% endif %}
  {% if element.values.syncState %}
  textInputProps={ {
    value: {{ element.values.stateVariable }}?.{{ element.values.addressField|default('Address') }} || '',
    onChangeText: (text) => set{{ element.values.stateVariable }}((prev) => ({
      ...prev,
      {{ element.values.addressField|default('Address') }}: text,
    })),
  } }
  {% endif %}
  {% if element.values.showRightButton %}
  renderRightButton={() => (
    {% if element.values.rightButtonContainerStyle %}<View style={ {{ element.values.rightButtonContainerStyle }} }>{% endif %}
    {% include includeTemplate('Iconify.tpl') with { 'element': { 'values': { 'icon': element.values.rightButtonIcon|default('material-symbols:location-on'), 'color': element.values.rightButtonColor|default("'#9C9C9C'"), 'size': element.values.rightButtonSize|default('20') }} } %}
    {% if element.values.rightButtonContainerStyle %}</View>{% endif %}
  )}
  {% endif %}
/>
