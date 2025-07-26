/*
path: div.tpl
completePath: elements/Basic/div.tpl
type: file
display: View
unique_id: y8fra7Zo
icon: ico-div
sourceType: javascript
options:
  - name: class
    display: ClassName
    type: text
    options: ''
  - name: useid
    display: Use UniqueID as ID
    type: checkbox
    options: ''
  - name: id
    display: ID
    type: text
    options: ''
  - name: onclick
    display: On Click
    type: text
    options: ''
  - name: ref
    display: Use Reference
    type: text
    options: ''
  - name: style
    display: Extra Styles
    type: text
    options: ''
  - name: scrollable
    display: Is Scrollable
    type: checkbox
  - name: nestedScrollEnabled
    display: Enable nested scrolling?
    type: checkbox
    options: ''
    settings:
      propertyCondition: scrollable
      condition: true
  - name: autoAdjust
    display: Automatically Adjust when keyboard insets
    type: checkbox
  - name: useAnimated
    display: Use Animated
    type: checkbox
    options: ''
  - name: onScroll
    display: On Scroll
    type: code
    options: ''
    settings:
      propertyCondition: scrollable
      condition: true
  - name: scrollEventThrottle
    display: Scroll Event Throttle
    type: text
    advanced: true
    settings:
      propertyCondition: scrollable
      condition: true
  - name: contentContainerStyle
    display: Content Container Style
    type: text
    advanced: true
children: []
helpText: Basic HTML Div element
*/
{% set bpr %}
import { View } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% if element.values.scrollable and not element.values.useAnimated %}
{% set bpr %}
import { View, ScrollView } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% endif %}
{% if element.values.useAnimated %}
{% set bpr %}
import { Animated } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% endif %}
{% set tag = 'View' %}
{% if element.values.scrollable and element.values.useAnimated %}
  {% set tag = 'Animated.ScrollView' %}
{% elseif element.values.scrollable %}
  {% set tag = 'ScrollView' %}
{% elseif element.values.useAnimated %}
  {% set tag = 'Animated.View' %}
{% endif %}
<{{ tag }}
  {% if element.values.useid %}id="{{ element.unique_id }}"{% endif %}
  {% if element.values.id %}id={{ element.values.id | textOrVariable }}{% endif %}
  {% if element.values.class %}style={ {{element.values.class}} }{% endif %}
  {% if element.values.onclick %}onTouchStart={(e) => {{element.values.onclick}} }{% endif %}
  {% if element.values.ref %}ref={ {{element.values.ref}} }{% endif %}
  {% if element.values.nestedScrollEnabled %}nestedScrollEnabled{% endif %}
  {% if element.values.style %}style={ {{element.values.style}} }{% endif %}
  {% if element.values.scrollable %}
    {% if element.values.onScroll %}
      onScroll={(event) => {
        {{ element.values.onScroll }}
      }}
    {% endif %}
  {% endif %}
  {% if element.values.scrollable %}
    {% if element.values.scrollEventThrottle %}scrollEventThrottle={ {{ element.values.scrollEventThrottle }} }{% endif %}
  {% endif %}
  {% if element.values.contentContainerStyle %}contentContainerStyle={ {{ element.values.contentContainerStyle }} }{% endif %}
  {% if element.values.autoAdjust %}automaticallyAdjustKeyboardInsets={true}{% endif %}
>
{{ content | raw }}
</{{ tag }}>