/*
path: Container.tpl
type: file
unique_id: 3NDAATVX
icon: ico-field
helpText: >-
  The container centers your content horizontally. It's the most basic layout
  element.
options:
  - name: disableGutters
    display: Disable Gutters
    type: checkbox
    options: ''
  - name: fixed
    display: Fixed?
    type: checkbox
    options: ''
  - name: maxWidth
    display: Max Width
    type: dropdown
    options: lg;md;sm;xl;xs;false
  - name: className
    display: className
    type: text
    options: ''
  - name: avoidKeyboard
    display: Avoid Keyboard
    type: checkbox
sourceType: javascript
children: []
*/
{% set bpr %}
import { element } from 'prop-types'
import { View } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set tag = 'View' %}
{% if element.values.avoidKeyboard %}
{% set tag = 'KeyboardAvoidingView' %}
{% set bpr %}
import { KeyboardAvoidingView } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% endif %}
<{{ tag }} {{ extra }}
  {% if element.values.avoidKeyboard %}behavior={Platform.OS === 'ios' ? 'padding' : 'height'}{% endif %}
  {% if element.values.useid %}id="{{ element.unique_id }}"{% endif %}
  {% if element.values.id %}id={{ element.values.id | textOrVariable }}{% endif %}
  {% if element.values.className %}style={ {{element.values.className }} }{% endif %}
  {% if element.values.onclick %}onTouchStart={(e) => {{element.values.onclick}} }{% endif %}
  {% if element.values.ref %}ref={ {{element.values.ref}} }{% endif %}
  {% if element.values.style %}style={ {{element.values.style}} }{% endif %}
>
{{ content | raw }}
</{{ tag }}>