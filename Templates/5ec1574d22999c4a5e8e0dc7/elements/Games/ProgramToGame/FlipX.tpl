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
  - name: withoutThis
    display: Not Use This
    type: checkbox
  - name: customX
    display: Custom Flip (X)
    type: text
    options: ''
    advanced: true
*/
    {% set variablePrefix = element.values.withoutThis ? '' : 'this.' %}

    if ({{ variablePrefix }}{{ element.values.variableName }}.flipX) {
        // Verifica si flipX es true, entonces ajusta la posición del jugador
        {{ variablePrefix }}{{ element.values.variableName }}.x = {{ variablePrefix }}{{ element.values.variableName }}.x {{ element.values.flipToRight ? '+' : '-' }} {{ element.values.customX|default('0') }};
    }

    {{ variablePrefix }}{{ element.values.variableName }}.flipX = {{ element.values.flipToRight ? 'false' : 'true' }};