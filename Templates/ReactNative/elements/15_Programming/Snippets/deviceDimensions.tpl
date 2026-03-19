/*
path: deviceDimensions.tpl
type: file
unique_id: deviceDimensions
icon: ico-field
sourceType: javascript
options:
  - name: variableName
    display: Store In
    type: text
  - name: onlyWidth
    display: Only Width
    type: checkbox
    options: ''
  - name: onlyHeight
    display: Only Height
    type: checkbox
    options: ''
children: []
*/
{% set bpr %}
import { Dimensions } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.onlyWidth %}
const {{ element.values.variableName | default('windowWidth') }} = Dimensions.get('window').width
{% elseif element.values.onlyHeight %}
const {{ element.values.variableName | default('windowHeight') }} = Dimensions.get('window').height
{% else %}
const {{ element.values.variableName | default('window') }} = Dimensions.get('window')
{% endif %}