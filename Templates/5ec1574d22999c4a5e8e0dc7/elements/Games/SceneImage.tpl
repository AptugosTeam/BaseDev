/*
path: SceneImage.tpl
keyPath: elements/Games/SceneImage.tpl
unique_id: quRmon3F
icon: f:wallpaper_slideshow.svg
options:
  - name: asset
    display: Asset to Display
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
  - name: displayX
    display: Display Size (x)
    type: text
    options: ''
  - name: displayY
    display: Display Size (y)
    type: text
    options: ''
  - name: setScale
    display: SetScale (X, Y)
    type: text
    options: ''
    advanced: true
  - name: setVisible
    display: Set Visible
    type: text
    options: ''
    advanced: true
  - name: isInteractive
    display: Interactive?
    type: checkbox
  - name: onClick
    display: On Click
    type: code
*/
this.add.image({{ element.values.posX }}, {{ element.values.posY }}, '{{ element.values.asset }}')
{% if element.values.displayX and element.values.displayY %}.setDisplaySize({{ element.values.displayX }}, {{ element.values.displayY }}){% endif %}{% if element.values.setScale %}.setScale({{ element.values.setScale }}){% endif %}
{% if element.values.setVisible %}.setVisible({{ element.values.setVisible }}){% endif %}{% if element.values.isInteractive %}.setInteractive(){% endif %}
{% if element.values.isInteractive %}.on("pointerdown", {{ element.values.onClick|default(content) | functionOrCall }}){% endif %}