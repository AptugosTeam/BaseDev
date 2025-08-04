/*
path: GestureDetector.tpl
type: file
unique_id: gestRD3T
icon: ico-div
sourceType: javascript
options:
  - name: functionName
    display: Function Name
    type: text
    options: ''
children: []
*/

{% set bpr %}
import { GestureDetector } from 'react-native-gesture-handler'
{% endset %}
{{ save_delayed('bpr', bpr) }}

<GestureDetector gesture={ {{ element.values.functionName }} }>
  {{ content | raw }}
</GestureDetector>