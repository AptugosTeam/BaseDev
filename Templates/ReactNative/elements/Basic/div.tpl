/*
path: div.tpl
completePath: elements/Basic/div.tpl
type: file
display: View
unique_id: y8fra7Zo
icon: ico-div
sourceType: javascript
options:
  - name: className
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
    display: On Touch
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
  - name: animated
    display: Is Animated
    type: checkbox
  - name: Horizontal
    display: Horizontal
    type: checkbox
    settings:
      propertyCondition: scrollable
      condition: true
  - name: hideHorizontalScrollIndicator
    display: Hide Horizontal Scroll Indicator
    type: checkbox
    settings:
      propertyCondition: Horizontal
      condition: true
  - name: hideVerticalScrollIndicator
    display: Hide Vertical Scroll Indicator
    type: checkbox
    settings:
      propertyCondition: scrollable
      condition: true
  - name: onMomentumScrollEnd
    display: onMomentumScrollEnd
    type: code
    advanced: true
    settings:
      propertyCondition: scrollable
      condition: true
  - name: pagingEnabled
    display: Enable Paging
    type: checkbox
    settings:
      propertyCondition: scrollable
      condition: true
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
  - name: onpressin
    display: On Press In
    type: text
    options: ''
    advanced: true
  - name: onpressout
    display: On Press Out
    type: text
    options: ''
    advanced: true
children: []
helpText: Basic HTML Div element
*/
{% set class = element.values.className %}
{% if element.values.class is defined and element.values.class is not empty %}
  {% if element.values.className is not defined %}
    {% set class = element.values.class %}
  {% endif %}
{% endif %}
{% if class is not empty and element.values.style %}
  {% set class = '[' ~ class ~ ',' ~ element.values.style ~ ']' %}
{% endif %}
{% if class is empty and element.values.style is not empty %}
  {% set class = element.values.style %}
{% endif %}
{% set bpr %}
import { View } from 'react-native'
import { Pressable } from 'react-native'
import { KeyboardAvoidingView } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% if element.values.scrollable or element.values.animated %}
{% set bpr %}
import { Animated } from 'react-native'
import { ScrollView } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% endif %}
{% set tag = 'View' %}
{% if element.values.autoAdjust %}{% set tag = 'KeyboardAvoidingView' %}{% endif %}
{% if element.values.animated %}{% set tag = 'Animated.View' %}{% endif %}
{% if element.values.scrollable %}
  {% set tag = 'ScrollView' %}
  {% if element.values.animated %}{% set tag = 'Animated.ScrollView' %}{% endif %}
{% endif %}
<{{ tag }}
  {% if element.values.Horizontal %}horizontal{% endif %}
  {% if element.values.pagingEnabled %}pagingEnabled{% endif %}
  {% if element.values.hideHorizontalScrollIndicator %}showsHorizontalScrollIndicator={false}{% endif %}
  {% if element.values.hideVerticalScrollIndicator %}showsVerticalScrollIndicator={false}{% endif %}
  {% if element.values.useid %}id="{{ element.unique_id }}"{% endif %}
  {% if element.values.id %}id={{ element.values.id | textOrVariable }}{% endif %}
  {% if class is not empty %}style={ {{class}} }{% endif %}
  {% if element.values.ref %}ref={ {{element.values.ref}} }{% endif %}
  {% if element.values.nestedScrollEnabled %}nestedScrollEnabled{% endif %}
  {% if element.values.scrollable %}
    {% if element.values.onScroll %}
      onScroll={(event) => {
        {{ element.values.onScroll }}
      }}
    {% endif %}
    {% if element.values.onMomentumScrollEnd %}
      onMomentumScrollEnd={(e) => {
        {{ element.values.onMomentumScrollEnd }}
      }}
    {% endif %}
  {% endif %}
  {% if element.values.scrollable %}
    {% if element.values.scrollEventThrottle %}scrollEventThrottle={ {{ element.values.scrollEventThrottle }} }{% endif %}
  {% endif %}
  {% if element.values.contentContainerStyle %}contentContainerStyle={ {{ element.values.contentContainerStyle }} }{% endif %}
  {% if element.values.autoAdjust %}
    behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
    keyboardVerticalOffset={Platform.OS === 'ios' ? 48 : 0}
  {% endif %}
>
{{ content | raw }}
  {% if element.values.onclick %}
    <Pressable
      onPress={ {{ element.values.onclick | functionOrCall }} }
      style={ { position: 'absolute', top: 0, left: 0, right: 0, bottom: 0 } }
    />
  {% elseif element.values.onpressin or element.values.onpressout %}
    <Pressable
      {% if element.values.onpressin %}onPressIn={ {{ element.values.onpressin | functionOrCall }} }{% endif %}
      {% if element.values.onpressout %}onPressOut={ {{ element.values.onpressout | functionOrCall }} }{% endif %}
      style={ { position: 'absolute', top: 0, left: 0, right: 0, bottom: 0 } }
    />
  {% endif %}
</{{ tag }}>