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
    required: true
    options: ''
  - name: parameters
    display: Parameters
    type: text
    options: ''
  - name: tagToUse
    display: Use Tag
    type: dropdown
    options:
      return [['NavLink', 'NavLink'],['A', 'A']]
    required: true
  - name: target
    display: Link Target
    type: dropdown
    options:
      return [['_self', '_self'],['_blank', '_blank'],['_parent', '_parent'],['_top', '_top']]
    settings:
      active: true
      propertyCondition: tagToUse
      condition: A
      default: '"_self"'
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: Action
    display: Action
    type: text
    options: ''
  - name: style
    display: Extra Styles
    type: text
    options: ''
  - name: draggable
    display: Disable link drag
    type: checkbox
    options: ''
  - name: customizedClassName
    display: ClassName without theme
    type: checkbox
    options: ''
    settings:
      default: false
    advanced: true
sourceType: javascript
children: []
*/
{% set bpr %}
import { NavLink } from 'react-router-dom'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set dest = element.values.destination %}
{% if element.values.parameters %}
  {% set params = element.values.parameters|parseParameters %}
  {% set dest = element.values.destination ~ '/$' ~ params|join('$') %}
{% endif %}
{% if element.values.tagToUse == 'A' %}
<a
  {% if element.values.target %}target="{{element.values.target|default('_self')}}"{% endif %}
  {% if element.values.style %}style={ {{element.values.style}} }{% endif %}
  {% if element.values.customizedClassName %}
    {% if element.values.className %}className="{{element.values.className }}"{% endif %}
  {% else %}
    {% if element.values.className %}className={ {{element.values.className }} }{% endif %}
  {% endif %}
  href={{ element.values.destination | textOrVariable }} 
  {% if element.values.Action %}onClick={ {{ element.values.Action | functionOrCall }} }{% endif %}
  {% if element.values.draggable %} draggable={false} {% endif %}>
  {{ content | raw }}
</a>
{% else %}
<NavLink 
  {% if element.values.style %}style={ {{element.values.style}} }{% endif %}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  to={{ dest | textOrVariable }} 
  {% if element.values.Action %}onClickCapture={ {{ element.values.Action | functionOrCall }} }{% endif %}
  {% if element.values.draggable %} draggable={false} {% endif %}>
  {{ content | raw }}
</NavLink>
{% endif %}