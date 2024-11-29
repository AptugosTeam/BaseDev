/*
path: createHitbox.tpl
keyPath: elements/ProgramToGame/createHitbox.tpl
unique_id: 8Hzl6CNG
icon: f:flip.svg
options:
  - name: variableName
    display: Variable Name
    type: text
    required: true
  - name: shapeType
    display: Shape Type
    type: dropdown
    options:
      return [['rectangle', 'Rectangle'], ['circle', 'Circle'], ['polygon', 'Polygon'], ['ellipse', 'Ellipse'], ['line', 'Line']]
    required: true
    settings:
      default: rectangle
  - name: posX
    display: Position X
    type: text
    required: true
  - name: posY
    display: Position Y
    type: text
    required: true
  - name: width
    display: Width
    type: text
    required: true
    settings:
      active: true
      propertyCondition: shapeType
      condition: rectangle
  - name: height
    display: Height
    type: text
    required: true
    settings:
      active: true
      propertyCondition: shapeType
      condition: rectangle
  - name: width
    display: Width
    type: text
    required: true
    settings:
      default: 50
      active: true
      propertyCondition: shapeType
      condition: ellipse
  - name: height
    display: Height
    type: text
    required: true
    settings:
      default: 50
      active: true
      propertyCondition: shapeType
      condition: ellipse
  - name: radius
    display: Radius
    type: text
    required: true
    settings:
      active: true
      propertyCondition: shapeType
      condition: circle
  - name: points
    display: Points Polygon (array)
    type: text
    required: true
    settings:
      active: true
      propertyCondition: shapeType
      condition: polygon
  - name: xStart
    display: X Start
    type: text
    required: true
    settings:
      active: true
      propertyCondition: shapeType
      condition: line
  - name: yStart
    display: Y Start
    type: text
    required: true
    settings:
      active: true
      propertyCondition: shapeType
      condition: line
  - name: xEnds
    display: X Ends
    type: text
    required: true
    settings:
      active: true
      propertyCondition: shapeType
      condition: line
  - name: yEnds
    display: Y Ends
    type: text
    required: true
    settings:
      active: true
      propertyCondition: shapeType
      condition: line
  - name: color
    display: Color (In hexadecimal & without '#')
    type: text
    required: true
  - name: alpha
    display: Alpha (from 0 to 1)
    type: text
    required: true
*/

{% set variableDeclarations %}
{{ element.values.variableName | default('hitbox') }}:{{ 'any' }}
{% endset %}
{{ save_delayed('variableDeclarations', variableDeclarations) }}

{% if element.values.shapeType == 'rectangle' %}
this.{{ element.values.variableName | default('hitbox') }} = this.add.rectangle({{ element.values.posX | default('0') }}, {{ element.values.posY | default('0') }}, {{ element.values.width | default('50') }}, {{ element.values.height | default('50') }}, 0x{{ element.values.color | default('000000') }}, {{ element.values.alpha | default(0.5) }})
{% endif %}

{% if element.values.shapeType == 'circle' %}
this.{{ element.values.variableName | default('hitbox') }} = this.add.circle({{ element.values.posX | default('0') }}, {{ element.values.posY | default('0') }}, {{ element.values.radius | default('50') }}, 0x{{ element.values.color | default('000000') }}, {{ element.values.alpha | default(0.5) }})
{% endif %}

{% if element.values.shapeType == 'polygon' %}
this.{{ element.values.variableName | default('hitbox') }} = this.add.polygon({{ element.values.posX | default('50') }}, {{ element.values.posY | default('50') }}, {{ element.values.points | default('[0, 100, 50, 0, 100, 100]') }}, 0x{{ element.values.color | default('000000') }}, {{ element.values.alpha | default(0.5) }})
{% endif %}

{% if element.values.shapeType == 'ellipse' %}
this.{{ element.values.variableName | default('hitbox') }} = this.add.ellipse({{ element.values.posX | default('0') }}, {{ element.values.posY | default('0') }}, {{ element.values.width | default('50') }}, {{ element.values.height | default('50') }}, 0x{{ element.values.color | default('000000') }}, {{ element.values.alpha | default(0.5) }})
{% endif %}

{% if element.values.shapeType == 'line' %}
this.{{ element.values.variableName | default('hitbox') }} = this.add.line({{ element.values.posX | default('50') }}, {{ element.values.posY | default('0') }}, {{ element.values.xStart | default('0') }}, {{ element.values.yStart | default('0') }}, {{ element.values.xEnds | default('100') }}, {{ element.values.yEnds | default('0') }}, 0x{{ element.values.color | default('000000') }}, {{ element.values.alpha | default(0.5) }})
{% endif %}

this.physics.add.existing(this.{{ element.values.variableName | default('hitbox') }}); // Convierte el rectángulo en un objeto físico

this.{{ element.values.variableName | default('hitbox') }}.body.setAllowGravity(false); // Desactiva la gravedad del hitbox

this.{{ element.values.variableName | default('hitbox') }}.body.enable = false; // Desactiva el hitbox por defecto
