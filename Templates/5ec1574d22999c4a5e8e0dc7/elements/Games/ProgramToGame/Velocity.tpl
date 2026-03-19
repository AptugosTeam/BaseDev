/*
path: Velocity.tpl
keyPath: elements/ProgramToGame/Velocity.tpl
unique_id: 8Hzl711A
icon: f:speed.svg
options:
  - name: variableName
    display: Variable Name
    type: text
    options: ''
    required: true
  - name: setVelocityX
    display: Set Velocity (X)
    type: text
    options: ''
  - name: setVelocityY
    display: Set Velocity (Y)
    type: text
    options: ''
*/
{% if element.values.variableName is defined %}
// Verifica una velocidad para la variable y la aplicar a la animación
var setVelocityX = {{ element.values.setVelocityX | default(25) }};
var setVelocityY = {{ element.values.setVelocityY | default(25) }};

this.{{ element.values.variableName }}.setVelocity(setVelocityX, setVelocityY);
{% endif %}