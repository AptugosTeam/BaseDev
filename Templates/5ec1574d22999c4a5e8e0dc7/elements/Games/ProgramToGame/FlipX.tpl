/*
path: FlipX.tpl
keyPath: elements/ProgramToGame/FlipX.tpl
unique_id: 8Hzl615A
icon: f:flip.svg
options:
  - name: variableName
    display: Variable Name
    type: text
    options: ''
    required: true
  - name: flipToRight
    display: Flip To Right
    type: checkbox
  - name: customX
    display: Custom Flip (X)
    type: text
    options: ''
    advanced: true
*/
    if (this.{{ element.values.variableName }}.flipX) {
        // Verifica si flipX es true, entonces ajusta la posición del jugador
        this.{{ element.values.variableName }}.x = this.{{ element.values.variableName }}.x {{ element.values.flipToRight ? '+' : '-' }} {{ element.values.customX|default('0') }};
    }
    this.{{ element.values.variableName }}.flipX = {{ element.values.flipToRight ? 'false' : 'true' }};