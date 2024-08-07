/*
path: PlayAnims.tpl
keyPath: elements/ProgramToGame/PlayAnims.tpl
unique_id: 8Hzk711A
icon: f:animated_images.svg
options:
  - name: variableName
    display: Variable Name
    type: text
    options: ''
    required: true
  - name: playAnims
    display: Play Anims
    type: text
    options: ''
    required: true
  - name: setSizeX
    display: Set Size (X)
    type: text
    options: ''
    advanced: true
  - name: setSizeY
    display: Set Size (Y)
    type: text
    options: ''
    advanced: true
  - name: setOffsetX
    display: Set Offset (X)
    type: text
    options: ''
    advanced: true
  - name: setOffsetY
    display: Set Offset (Y)
    type: text
    options: ''
    advanced: true
  - name: withoutThis
    display: Not Use This
    type: checkbox
*/
{% if element.values.setSizeX%} var setSizeX = {{ element.values.setSizeX}};{% endif %}
{% if element.values.setSizeY%} var setSizeY = {{ element.values.setSizeY}};{% endif %}
{% if element.values.setOffsetX%} var setOffsetX = {{ element.values.setOffsetX}};{% endif %}
{% if element.values.setOffsetY%} var setOffsetY = {{ element.values.setOffsetY}};{% endif %}

{% if element.values.withoutThis %}{{ element.values.variableName }}.anims.play('{{ element.values.playAnims }}', true)
{% else %}
this.{{ element.values.variableName }}.anims.play('{{ element.values.playAnims }}', true)
{% endif %}
    {% if element.values.setSizeX and element.values.setSizeY is defined %}.setSize(setSizeX, setSizeY);{% endif %}
    {% if element.values.setOffsetX or element.values.setOffsetY %}
    .setOffset(
        {% if element.values.setOffsetX %}setOffsetX{% else %}0{% endif %}, 
        {% if element.values.setOffsetY %}setOffsetY{% else %}0{% endif %}
    );{% endif %}