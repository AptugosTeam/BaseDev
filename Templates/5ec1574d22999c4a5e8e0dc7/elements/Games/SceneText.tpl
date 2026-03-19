/*
path: SceneText.tpl
keyPath: elements/Games/SceneText.tpl
unique_id: IcPGChFt
icon: f:custom_typography.svg
options:
  - name: textdisplay
    display: Text to Display
    type: text
    options: ''
    required: true
  - name: size
    display: Size
    type: text
    options: ''
  - name: font
    display: Font Family
    type: text
    options: ''
  - name: color
    display: Color HEX
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
  - name: align
    display: Align
    type: dropdown
    options: return [['left', 'Left'], ['center', 'Center'], ['right', 'Right'], ['justify', 'Justify']]
  - name: setOrigin
    display: Set Origin (x,y)
    type: text
    options: ''
*/
this.add.text(
  +`{{ element.values.posX | default('5') }}`,
  +`{{ element.values.posY | default('5') }}`,
  {% if element.values.textdisplay %}`{{ element.values.textdisplay }}`,{% else %}"",{% endif %}
  {
    fontSize: '{{ element.values.size | default('16') }}px',
    fontFamily: '{{ element.values.font | default('Arial Black') }}',
    color: '{{ element.values.color | default('#000000') }}',
    align: '{{ element.values.align | default('left') }}',
  }
){% if element.values.setOrigin %}.setOrigin({{ element.values.setOrigin }});
{% endif %}
