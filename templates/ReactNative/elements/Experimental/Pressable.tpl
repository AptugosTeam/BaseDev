/*
path: Pressable.tpl
type: file
unique_id: d2a77zvb
icon: ico-button
sourceType: javascript
options:
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: onPress
    display: On Press
    type: text
    options: ''
  - name: onLongPress
    display: On Long Press
    type: text
    options: ''
  - name: onPressIn
    display: On Press In
    type: text
    options: ''
  - name: onPressOut
    display: On Press Out
    type: text
    options: ''
  - name: disabled
    display: Disabled
    type: text
    options: ''
  - name: hitSlop
    display: Hit Slop
    type: text
    options: ''
  - name: delayLongPress
    display: Delay Long Press (ms)
    type: text
    options: ''
  - name: delayPressIn
    display: Delay Press In (ms)
    type: text
    options: ''
  - name: delayPressOut
    display: Delay Press Out (ms)
    type: text
    options: ''
children: []
*/
{% set bpr %}
import { Pressable } from 'react-native'
{% endset %}
{{ save_delayed('bpr', bpr) }}

<Pressable
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  {% if element.values.onPress %}onPress={ {{ element.values.onPress | functionOrCall }} }{% endif %}
  {% if element.values.onLongPress %}onLongPress={ {{ element.values.onLongPress | functionOrCall }} }{% endif %}
  {% if element.values.onPressIn %}onPressIn={ {{ element.values.onPressIn | functionOrCall }} }{% endif %}
  {% if element.values.onPressOut %}onPressOut={ {{ element.values.onPressOut | functionOrCall }} }{% endif %}
  {% if element.values.disabled %}disabled={ {{ element.values.disabled }} }{% endif %}
  {% if element.values.hitSlop %}hitSlop={ {{ element.values.hitSlop }} }{% endif %}
  {% if element.values.delayLongPress %}delayLongPress={ {{ element.values.delayLongPress | textOrVariable }} }{% endif %}
  {% if element.values.delayPressIn %}delayPressIn={ {{ element.values.delayPressIn | textOrVariable }} }{% endif %}
  {% if element.values.delayPressOut %}delayPressOut={ {{ element.values.delayPressOut | textOrVariable }} }{% endif %}
>
{{ content | raw }}
</Pressable>