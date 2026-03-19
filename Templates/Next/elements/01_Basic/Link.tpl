/*
path: Link.tpl
type: file
unique_id: a0bW4rmi
icon: ico-link
display: Link
order: 50
helpText: Link to other pages or external URLs
options:
  - name: destination
    display: Destination
    type: text
    options: ''
  - name: parameters
    display: Parameters
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: tagToUse
    display: Use Tag
    type: dropdown
    options: NavLink;A
    settings:
      default: 'NavLink'
      active: true
  - name: Action
    display: Action
    type: text
    options: ''
  - name: style
    display: Extra Styles
    type: text
    options: ''
  - name: target
    display: Link Target
    type: dropdown
    options: _self;_blank;_parent;_top
  - name: draggable
    display: Disable link drag
    type: checkbox
    options: ''
  - name: innerText
    display: Set Link Text
    type: text
    options: ''
  - name: title
    display: Title
    type: text
    options: ''
children: []
*/
{% set bpr %}
import Link from 'next/link'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set dest = element.values.destination %}
{% if element.values.parameters %}
  {% set params = element.values.parameters|parseParameters %}
  {% set dest = element.values.destination ~ '/$' ~ params|join('$') %}
{% endif %}
{% set tag = 'Link' %}
{% if element.values.tagToUse == 'A' %}
  {% set tag = 'a' %}
{% else %}
  {% set tag = 'Link' %}
  {% set bprNav %}import { NavLink } from 'react-router-dom'{% endset %}
  {{ save_delayed('bprNav', bprNav) }}
{% endif %}
<{{ tag }}
  {% if element.values.draggable %} draggable={false}{% endif %}
  key='{{ element.unique_id }}'
  href={{ dest | textOrVariable }} 
  {% if element.values.style %}style={ {{element.values.style}} }{% endif %}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  {% if element.values.Action %}onClickCapture={ {{ element.values.Action | functionOrCall }} }{% endif %}
  {% if element.values.target %}target={{ element.values.target | textOrVariable }}{% endif %}
  {% if element.values.title %}title={{ element.values.title | textOrVariable }}{% endif %}
>
{% if element.values.innerText %}{{ element.values.innerText }}{% endif %}
{{ content | raw }}
</{{ tag }}>

