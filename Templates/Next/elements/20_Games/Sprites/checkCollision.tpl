/*
path: checkCollision.tpl
keyPath: elements/Games/Sprites/checkCollision.tpl
unique_id: uok3pJey
icon: ico-collision
options:
  - name: objectA
    display: Object A
    type: text
    required: true
    options: ''
  - name: objectB
    display: Object B
    type: text
    required: true
    options: ''
  - name: functionCollision
    display: Collision function
    type: dropdown
    options: 
      return [['collider', 'Collider'],['overlap', 'Overlap']]
    settings:
      default: collider
  - name: functionCall
    display: Function Call
    type: text
    options: ''
    default: ''
*/
{% if element.values.functionCollision %}{% set varName = element.values.functionCollision %}this.physics.add.{{ varName }}(this.{{ element.values.objectA }}, this.{{ element.values.objectB }}, {% if element.values.functionCall %}this.{{ element.values.functionCall }},{% else %}null, {% endif %}null, this){% if element.children %}{{ content | functionOrCall }}{% endif %}{% endif %}