/*
path: UseAnimatedStyle.tpl
type: file
unique_id: uASQRZ4N
icon: ico-function
sourceType: javascript
helpText: Make animated styles
options:
  - name: functionName
    display: Function Name
    type: text
    options: ''
  - name: functionParameters
    display: Parameters
    type: text
    options: ''
  - name: functionBody
    display: Body
    type: function
    options: ''
  - name: priority
    display: Priiority
    type: dropdown
    options: Normal;High;Low
children: []
*/
{% set bpr %}
import { useAnimatedStyle } from 'react-native-reanimated'
{% endset %}
{{ save_delayed('bpr', bpr) }}

{% if element.values.priority %}
{% set ph %}
const {{ element.values.functionName }} = useAnimatedStyle(({{ element.values.functionParameters }}) => {
  {{ element.values.functionBody | raw }}
  {{ content | raw }}  
})
{% endset %}
{{ save_delayed('ph',ph,1) }}
{% else %}
const {{ element.values.functionName }} = useAnimatedStyle(({{ element.values.functionParameters }}) => {
  {{ element.values.functionBody | raw }}
  {{ content | raw }}  
})
{% endif %}

