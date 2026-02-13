/*
path: SceneImage.tpl
keyPath: elements/Games/SceneImage.tpl
unique_id: quRmon3F
icon: ico-image-add
options:
  - name: asset
    display: Game Asset to Display
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
    advanced: true
  - name: frame
    display: Frame
    type: text
    options: ''
    advanced: true
  - name: displayY
    display: Display Size (y)
    type: text
    options: ''
    advanced: true
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
  - name: draggable
    display: Set Draggable
    type: text
    advanced: true
  - name: origin
    display: Set Origin
    type: text
    advanced: true
  - name: isInteractive
    display: Interactive?
    type: checkbox
    advanced: true
  - name: onClick
    display: On Click
    type: code
    advanced: true
    settings:
      condition: true
      propertyCondition: isInteractive
  - name: data
    display: Data
    type: code
    advanced: true
  
*/
{% set interactiveObject = {} %}
{% if element.values.draggable %}{% set interactiveObject = interactiveObject|merge({'draggable': element.values.draggable}) %}{% endif %}
{% if element.values.displayX and element.values.displayY %}{% set interactiveObject = interactiveObject|merge({'hitarea': { width: element.values.displayX, height: element.values.displayY }}) %}{% endif %}
this.add.image({{ element.values.posX }}, {{ element.values.posY }}, '{{ element.values.asset }}'{% if element.values.frame %}, {{ element.values.frame }}{% endif %})
{% if element.values.draggable %}.setInteractive({ draggable: {{ element.values.draggable }} }){% endif %}
{% if element.values.origin is defined %}.setOrigin({{ element.values.origin }}){% endif %}
{% if element.values.displayX and element.values.displayY %}.setDisplaySize({{ element.values.displayX }}, {{ element.values.displayY }}){% endif %}{% if element.values.setScale %}.setScale({{ element.values.setScale }}){% endif %}
{% if element.values.setVisible %}.setVisible({{ element.values.setVisible }}){% endif %}{% if element.values.isInteractive %}.setInteractive(){% endif %}
{% if element.values.isInteractive %}.on("pointerdown", {{ element.values.onClick|default(content) | functionOrCall }}){% endif %}
{% if element.values.data %}.setData({{ element.values.data }}){% endif %}