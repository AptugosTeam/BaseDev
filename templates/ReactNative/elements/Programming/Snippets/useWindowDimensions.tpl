/*
path: useWindowDimensions.tpl
type: file
unique_id: useWindowDimensions
icon: ico-field
sourceType: javascript
options:
  - name: variableName
    display: Store In
    type: text
children: []
*/
{% set bpr %}
import { useWindowDimensions } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr) }}
const {{ element.values.variableName | default('window') }} = useWindowDimensions()