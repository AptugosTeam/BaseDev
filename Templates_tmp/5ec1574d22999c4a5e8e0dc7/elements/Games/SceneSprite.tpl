/*
path: SceneSprite.tpl
keyPath: elements/Games/SceneSprite.tpl
unique_id: q4Ug8P5R
icon: f:animation.svg
options:
  - name: asset
    display: Asset to display
    type: text
    options: ''
  - name: posX
    display: X
    type: text
    options: ''
  - name: posY
    display: Y
    type: text
    options: ''
  - name: collide
    display: Collide with World Bounds
    type: checkbox
  - name: isCircle
    display: Is A Circle? (set the radius)
    type: checkbox
  - name: Physics
    display: Use Physics?
    type: checkbox
  - name: immovable
    display: Is Immovable?
    type: checkbox
  - name: pushable
    display: Is Pushable?
    type: checkbox
  - name: bounce
    display: Bounce Factor (0 to 1)
    type: text
  - name: bodySizeX
    display: Body Size (X)
    type: text
    options: ''
    advanced: true
  - name: bodySizeY
    display: Body Size (Y)
    type: text
    options: ''
    advanced: true
  - name: scaleX
    display: Scale (X)
    type: text
    options: ''
    advanced: true
  - name: scaleY
    display: Scale (Y)
    type: text
    options: ''
    advanced: true
  - name: offset
    display: Offset (X, Y)
    type: text
    options: ''
    advanced: true
  
*/
this.{% if element.values.Physics %} physics.{% endif %}add.sprite({{ element.values.posX }}, {{ element.values.posY }}, '{{ element.values.asset }}')
{% if element.values.collide %}.setCollideWorldBounds(true){% endif %}
{% if element.values.isCircle %}.setCircle({{ element.values.isCircle }}){% endif %}
{% if element.values.immovable %}.setImmovable(true){% endif %}
{% if element.values.pushable %}.setPushable(true){% else %}.setPushable(false){% endif %}
{% if element.values.bounce %}.setBounce({{ element.values.bounce }}){% endif %}
{% if element.values.bodySizeX and element.values.bodySizeY %}.setBodySize({{ element.values.bodySizeX }}, {{ element.values.bodySizeY }}){% endif %}
{% if element.values.scaleX %}.setScale({{ element.values.scaleX }}{% if element.values.scaleY %},{{ element.values.scaleY }}{% endif %}){% endif %}
{% if element.values.offset %}.setOffset({{ element.values.offset }}){% endif %}

.setName('{{ element.name }}')