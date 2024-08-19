/*
path: SceneSpriteAnims.tpl
keyPath: elements/Games/SceneSpriteAnims.tpl
unique_id: q4Ug824E
icon: f:subscriptions.svg
options:
  - name: spriteName
    display: Sprite Name
    type: text
    options: ''
  - name: key
    display: Animation Key
    type: text
    options: ''
  - name: frames
    display: Frames Range
    type: text
    options: ''
  - name: frameRate
    display: Frame Rate
    type: text
    options: ''
  - name: repeat
    display: Repeat
    type: text
    options: ''
*/

this.anims.create({
  key: '{{ element.values.key }}', // Utiliza el valor de la clave de animación proporcionada por el usuario
  frames: this.anims.generateFrameNumbers('{{ element.values.spriteName }}', { frames: {{ element.values.frames }} }), // Utiliza el rango de fotogramas proporcionado por el usuario
  frameRate: {{ element.values.frameRate }}, // Utiliza la velocidad de fotogramas proporcionada por el usuario
  repeat: {{ element.values.repeat }} // Utiliza la repetición proporcionada por el usuario
});
