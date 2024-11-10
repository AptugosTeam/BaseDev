/*
path: FlipX.tpl
keyPath: elements/Games/Sprites/FlipX.tpl
unique_id: 8Hzl615A
icon: ico-flipx
options:
  - name: variableName
    display: Sprite Name
    type: text
    options: ''
    required: true
  - name: flipToRight
    display: Flip To Right
    type: checkbox
  - name: withoutThis
    display: Do not use "This"
    type: checkbox
    advanced: true
  - name: customX
    display: Custom Flip (X)
    type: text
    options: ''
    advanced: true
*/
{% set variablePrefix = element.values.withoutThis == true ? '' : 'this.' %}
if ({{ variablePrefix }}{{ element.values.variableName }}.flipX) {
  {{ variablePrefix }}{{ element.values.variableName }}.x = {{ variablePrefix }}{{ element.values.variableName }}.x {{ element.values.flipToRight ? '+' : '-' }} {{ element.values.customX|default('0') }};
}
{{ variablePrefix }}{{ element.values.variableName }}.flipX = {{ element.values.flipToRight ? 'false' : 'true' }};