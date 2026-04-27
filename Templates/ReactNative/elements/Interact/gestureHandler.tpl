/*
path: gestureHandler.tpl
keyPath: elements/Interact/gestureHandler.tpl
unique_id: 9hKotUol
helpText: Wrap child content with a pan gesture handler so swipe or drag gestures can trigger custom code
options:
  - name: onSwipe
    display: On Swipe?
    helpText: Gesture callback or expression executed for the pan gesture event
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
