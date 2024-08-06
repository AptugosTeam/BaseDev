/*
path: updateSpriteProperty.tpl
keyPath: elements/Games/Sprites/updateSpriteProperty.tpl
unique_id: DUBMDXan
icon: f:rule_settings.svg
options:
  - name: spriteName
    display: Sprite
    type: text
    options: ''
  - name: property
    display: Property to Update
    type: text
    options: ''
  - name: newValue
    display: New Value
    type: text
    options: ''
  - name: withoutThis
    display: Not Use This
    type: checkbox
  - name: withoutSet
    display: Not Use set
    type: checkbox
*/
{% if element.values.withoutThis %}
{% if element.values.withoutSet %}
{{ element.values.spriteName }}.{{ element.values.property }}({{ element.values.newValue }})
{% else %}
{{ element.values.spriteName }}.set{{ element.values.property }}({{ element.values.newValue }})
{% endif %}
{% else %}
{% if element.values.withoutSet %}
this.{{ element.values.spriteName }}.{{ element.values.property }}({{ element.values.newValue }})
{% else %}
this.{{ element.values.spriteName }}.set{{ element.values.property }}({{ element.values.newValue }})
{% endif %}
{% endif %}