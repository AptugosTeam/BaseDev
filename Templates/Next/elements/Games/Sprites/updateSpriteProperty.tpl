/*
path: updateSpriteProperty.tpl
keyPath: elements/Games/Sprites/updateSpriteProperty.tpl
unique_id: DUBMDXan
icon: ico-settings
options:
  - name: spriteName
    display: Sprite
    type: text
    options: ''
  - name: property
    display: Property to Update
    type: dropdown
    options: return [['other', 'Other'],['VelocityX', 'VelocityX'],['VelocityY', 'VelocityY']]
  - name: otherproperty
    display: Property
    type: text
    settings:
      propertyCondition: property
      condition: other
  - name: newValue
    display: New Value
    type: text
    options: ''
  - name: withoutThis
    display: Do not use "This"
    type: checkbox
    advanced: true
  - name: withoutSet
    display: Do not use "set"
    type: checkbox
    advanced: true
*/
{% set prop = element.values.otherproperty|default(element.values.property) %}
{% if element.values.withoutThis %}
  {% if element.values.withoutSet %}
    {{ element.values.spriteName }}.{{ prop }}({{ element.values.newValue }})
  {% else %}
    {{ element.values.spriteName }}.set{{ prop }}({{ element.values.newValue }})
  {% endif %}
{% else %}
  {% if element.values.withoutSet %}
    this.{{ element.values.spriteName }}.{{ prop }}({{ element.values.newValue }})
  {% else %}
    this.{{ element.values.spriteName }}.set{{ prop }}({{ element.values.newValue }})
  {% endif %}
{% endif %}