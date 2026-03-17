/*
path: simpleLink.tpl
type: file
unique_id: BG7vdEr8
icon: f:simpleLink.svg
renderTag: a
options:
  - name: destination
    display: Destination
    type: text
    options: ''
  - name: parameters
    display: Parameters
    type: text
    options: ''
  - name: tagToUse
    display: Use Tag
    type: dropdown
    options: NavLink;A
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: style
    display: Extra Styles
    type: text
    options: ''
  - name: target
    display: Link Target
    type: dropdown
    options: _self;_blank;_parent;_top
sourceType: javascript
children: []
*/

{% set bpr %}
import { NavLink } from 'react-router-dom'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set dest = element.values.destination %}
{% if element.values.parameters %}
  {% set dest = element.values.destination ~ element.values.parameters %}
{% endif %}
{% if element.values.tagToUse == 'A' %}
<a
  {% if element.values.target %}target={{ element.values.target | textOrVariable }}{% endif %}
  {% if element.values.style %}style={ {{element.values.style}} }{% endif %}
  {% if element.values.class %}className={ {{element.values.class}} }{% endif %}
  href={{ element.values.destination | textOrVariable }}>{{ content | raw }}</a>
{% else %}
<NavLink {% if element.values.style %}style={ {{element.values.style}} }{% endif %} {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  to={{ dest | textOrVariable }}>
{{ content | raw }}</NavLink>
{% endif %}