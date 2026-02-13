/*
path: SceneVideo.tpl
keyPath: elements/Games/SceneVideo.tpl
unique_id: quRm208A
icon: f:scene-image.svg
options:
  - name: asset
    display: Asset-Video to Display
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
  - name: setOriginX
    display: setOrigin (x)
    type: text
    options: ''
  - name: setOriginY
    display: setOrigin (y)
    type: text
    options: ''
  - name: setPlay
    display: Set Play (true/false)
    type: text
    options: ''
  - name: isInteractive
    display: Interactive?
    type: checkbox
  - name: onClick
    display: On Click
    type: code
*/
this.add.video({{ element.values.posX }}, {{ element.values.posY }}, '{{ element.values.asset }}')
{% if element.values.setOriginX and element.values.setOriginY %}.setOrigin({{ element.values.setOriginX | default(0) }}, {{ element.values.setOriginY | default(0)}}){% endif %}{% if element.values.setPlay %}.play({{ element.values.setPlay | default(true) }}){% endif %}
{% if element.values.isInteractive %}.once("play", {{ element.values.onClick|default(content) | functionOrCall }}){% endif %}