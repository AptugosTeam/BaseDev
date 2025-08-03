/*
path: useSharedValue.tpl
type: file
unique_id: useSharedValue
icon: ico-define-variable
options:
  - name: variableName
    display: Name
    type: text
    options: ''
  - name: variableValue
    display: Value
    type: text
    options: ''
sourceType: javascript
children: []
*/

{% set bpr %}
import { useSharedValue } from 'react-native-reanimated'
{% endset %}
{{ save_delayed('bpr', bpr) }}

{% set varName = element.values.variableName | default('defaultVariable') %}
{% set varValue = element.values.variableValue | default(0) %}

const {{ varName }} = useSharedValue({{ varValue }})