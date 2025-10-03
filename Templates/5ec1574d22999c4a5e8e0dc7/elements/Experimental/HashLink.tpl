/*
path: HashLink.tpl
type: file
unique_id: BG7vdGNC
icon: f:simpleLink.svg
renderTag: HashLink
options:
  - name: destination
    display: Destination
    type: text
    required: true
    options: ''
  - name: Scroll
    display: Type scroll
    type: dropdown
    options: smooth;scroll
    settings:
      default: smooth
  - name: CodeScroll
    display: Code
    type: code
    options: ''
    settings:
      active: true
      propertyCondition: Scroll
      condition: scroll
  - name: parameters
    display: Parameters
    type: text
    options: ''
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
settings:
  - name: Packages
    value: '"react-router-hash-link": "^2.4.3",'
children: []
*/
{% set bpr %}
import { HashLink } from 'react-router-hash-link'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set dest = element.values.destination %}
{% if element.values.parameters %}
  {% set params = element.values.parameters|parseParameters %}
  {% set dest = element.values.destination ~ '/$' ~ params|join('$') %}
{% endif %}
<HashLink
  {% if element.values.Scroll %}
    {% if element.values.Scroll == 'smooth' %}
    smooth
    {% else %}
    scroll={ {% if element.values.CodeScroll %}{{ element.values.CodeScroll | raw }}{% else %}el => el.scrollIntoView({ behavior: 'smooth', block: 'start' }){% endif %} }
    {% endif %}
  {% else %}
    smooth
  {% endif %}
  {% if element.values.style %}style={ {{element.values.style}} }{% endif %}
  {% if element.values.customizedClassName %}
    {% if element.values.className %}className="{{element.values.className }}"{% endif %}
  {% else %}
    {% if element.values.className %}className={ {{element.values.className }} }{% endif %}
  {% endif %}
  to={{ element.values.destination | textOrVariable }} 
  {% if element.values.Action %}onClick={ {{ element.values.Action | functionOrCall }} }{% endif %}
  {% if element.values.draggable %} draggable={false} {% endif %}>
  {{ content | raw }}
</HashLink>