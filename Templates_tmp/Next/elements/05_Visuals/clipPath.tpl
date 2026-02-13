/*
path: clipPath.tpl
type: file
unique_id: hdTHakeA
icon: ico-button
renderTag: Clip-Path
options:
  - name: name
    display: Name
    type: text
    options: ''
  - name: id
    display: ID
    type: text
    options: ''
  - name: formula
    display: Formula
    type: text
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: styles
    display: Extra Style
    type: text
    options: ''
  - name: showLabel
    display: Show Label
    type: checkbox
    settings:
      default: false
  - name: showShadow
    display: Show Shadow
    type: checkbox
    settings:
      default: false
children: []
extraFiles:
  - source: 'elements/Experimental/ClipPath/index.js'
    destination: 'src/components/ClipPath/index.js'
  - source: 'elements/Experimental/ClipPath/schema.js'
    destination: 'src/components/ClipPath/schema.js'
*/
{% set bpr %}
import Shape from '@components/ClipPath';
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Shape
    {% if element.values.className %}className="{{element.values.className}}"{% endif %}
    {% if element.values.styles %}styles={ {{element.values.styles}} }{% endif %}
    name="{{element.values.name}}"
    id="{{element.values.id}}"
    formula="{{element.values.formula}}"
    width="{{element.values.width|default('300px')}}"
    height="{{element.values.height|default('300px')}}"
    {% if element.values.showLabel %}showLabel={ {{element.values.showLabel}} }{% endif %}
    {% if element.values.showShadow %}showShadow={ {{element.values.showShadow}} }{% endif %}
/>