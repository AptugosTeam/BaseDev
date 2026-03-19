/*
path: SceneVideo.tpl
keyPath: elements/Games/SceneVideo.tpl
unique_id: quRm208A
icon: f:scene-image.svg
options:
  - name: name
    display: Variable Name
    type: text
  - name: asset
    display: Asset-Video to Display
    type: text
    options: ''
    required: true
  - name: posX
    display: X
    type: text
    options: ''
    required: true
  - name: posY
    display: Y
    type: text
    options: ''
    required: true
  - name: setOriginX
    display: setOrigin X
    type: text
    options: ''
  - name: setOriginY
    display: setOrigin Y
    type: text
    options: ''
  - name: setPlay
    display: Set Play (requiere Variable Name)
    type: checkbox
    options: ''
  - name: fillCanvas
    display: Fill The Entire Canvas (requiere Variable Name)
    type: checkbox
    options: ''
  - name: isInteractive
    display: Interactive?
    type: checkbox
  - name: onClick
    display: On Click
    type: code
*/
{% set varName = element.values.name | friendly %}
{% set variableDeclarations %}
{% if varName %}{{ varName }}:{{ 'any' }}{% endif %}
{% endset %}
{{ save_delayed('variableDeclarations', variableDeclarations) }}
{% set variableOriginX = setOriginX == '' ? false : true %}
{% set variableOriginY = setOriginY == '' ? false : true %}
{% if varName %}this.{{ varName }} = {% endif %}this.add.video({{ element.values.posX }}, {{ element.values.posY }}, '{{ element.values.asset }}')
{% if variableOriginX and variableOriginY %}.setOrigin({{ element.values.setOriginX | default(0) }}, {{ element.values.setOriginY | default(0)}}){% endif %}
{% if element.values.isInteractive %}.setInteractive(){% endif %}
{{ element.values.onClick}}{{ content | raw }}
{% if varName %}
{% if element.values.setPlay %}
this.{{ varName }}.video.addEventListener('loadeddata', () => {
    {% if element.values.fillCanvas %}const scaleX = this.scale.width / this.{{ varName }}.video.videoWidth
    const scaleY = this.scale.height / this.{{ varName }}.video.videoHeight
    const scale = Math.max(scaleX, scaleY);
    {% endif %}
    this.{{ varName }}{% if element.values.fillCanvas %}.setScale(scale){% endif %}.play(true)
   })
{% endif %}
{% endif %}
