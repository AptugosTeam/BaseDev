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
  - name: activeStyle
    display: Active Style
    type: text
    options: ''
  - name: hoverStyle
    display: Hover Style
    type: text
    options: ''
  - name: focusStyle
    display: Focus Style
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
children: []
*/
{% set bpr %}
import { Pressable } from 'react-native'
{% endset %}
{{ save_delayed('bpr', bpr) }}

{% set args_array = [] %}
{% if element.values.activeStyle %}{% set args_array = args_array|merge(['pressed']) %}{% endif %}
{% if element.values.hoverStyle %}{% set args_array = args_array|merge(['hovered']) %}{% endif %}
{% if element.values.focusStyle %}{% set args_array = args_array|merge(['focused']) %}{% endif %}
{% set args = args_array|join(', ') %}

<Pressable
  {% if args %}
  style={({ {{ args }} }) => [
    {% if element.values.className %}{{ element.values.className }},{% endif %}
    {% if element.values.activeStyle %}pressed && {{ element.values.activeStyle }},{% endif %}
    {% if element.values.hoverStyle %}hovered && {{ element.values.hoverStyle }},{% endif %}
    {% if element.values.focusStyle %}focused && {{ element.values.focusStyle }}{% endif %}
  ]}
  {% else %}
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  {% endif %}
  {% if element.values.onPress %}onPress={ {{ element.values.onPress | functionOrCall }} }{% endif %}
  {% if element.values.onLongPress %}onLongPress={ {{ element.values.onLongPress | functionOrCall }} }{% endif %}
  {% if element.values.onPressIn %}onPressIn={ {{ element.values.onPressIn | functionOrCall }} }{% endif %}
  {% if element.values.onPressOut %}onPressOut={ {{ element.values.onPressOut | functionOrCall }} }{% endif %}
  {% if element.values.disabled %}disabled={ {{ element.values.disabled }} }{% endif %}
  {% if element.values.hitSlop %}hitSlop={ {{ element.values.hitSlop }} }{% endif %}
>
{% if args %}
{({ {{ args }} }) => (
  <React.Fragment>
    {{ content | raw }}
  </React.Fragment>
)}
{% else %}
  {{ content | raw }}
{% endif %}
</Pressable>