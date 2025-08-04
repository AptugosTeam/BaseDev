/*
path: Gesture.tpl
type: file
unique_id: gestRZ4N
icon: ico-function
sourceType: javascript
helpText: Create and configure a PanHandler gesture
options:
  - name: functionName
    display: Function Name
    type: text
    options: ''
  - name: gestureType
    display: Gesture Type
    type: dropdown
    options: Pan;Tap;LongPress;Fling
  - name: onStart
    display: On Start
    type: function
    options: ''
  - name: onUpdate
    display: On Update
    type: function
    options: ''
  - name: onEnd
    display: On End
    type: function
    options: ''
  - name: enabled
    display: Enabled
    type: text
    options: ''
  - name: priority
    display: Priority
    type: dropdown
    options: Normal;High;Low
children: []
*/

{% set bpr %}
import { runOnJS } from 'react-native-reanimated'
{% endset %}
{{ save_delayed('bpr', bpr) }}

{% set bpr %}
import { Gesture } from 'react-native-gesture-handler'
{% endset %}
{{ save_delayed('bpr', bpr) }}

{% set gestureType = element.values.gestureType | default('Pan') %}
{% set gestureBase = "Gesture." ~ gestureType ~ "()" %}

{% set enabled = element.values.enabled %}

{% if element.values.priority %}
{% set ph %}
const {{ element.values.functionName }} = {{ gestureBase }}
  .onStart(() => {
    {{ element.values.onStart | default('// Code to execute when the gesture starts') }}
  })
  .onUpdate((event) => {
    {{ element.values.onUpdate | default('// Code to execute when the gesture updates') }}
  })
  .onEnd((event) => {
    {{ element.values.onEnd | default('// Code to execute when the gesture ends') }}
  })
  {% if enabled %}.enabled({{ enabled }}){% endif %}
{% endset %}
{{ save_delayed('ph',ph,1) }}
{% else %}
const {{ element.values.functionName }} = {{ gestureBase }}
  .onStart(() => {
    {{ element.values.onStart | default('// Code to execute when the gesture starts') }}
  })
  .onUpdate((event) => {
    {{ element.values.onUpdate | default('// Code to execute when the gesture updates') }}
  })
  .onEnd((event) => {
    {{ element.values.onEnd | default('// Code to execute when the gesture ends') }}
  })
  {% if enabled %}.enabled({{ enabled }}){% endif %}
{% endif %}
