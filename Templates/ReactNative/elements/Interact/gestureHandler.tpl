/*
path: gestureHandler.tpl
keyPath: elements/Interact/gestureHandler.tpl
unique_id: 9hKotUol
options:
  - name: onSwipe
    display: On Swipe?
    type: text
    options: ''
*/
{% set bpr %}
import { PanGestureHandler } from 'react-native-gesture-handler'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<PanGestureHandler onGestureEvent={ {{ element.values.onSwipe|functionOrCall}}}>
{{ content | raw }}
</PanGestureHandler>