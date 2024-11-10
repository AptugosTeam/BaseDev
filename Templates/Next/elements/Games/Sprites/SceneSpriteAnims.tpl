/*
path: SceneSpriteAnims.tpl
display: Sprite Animation
icon: ico-animate
keyPath: elements/Games/Sprites/SceneSpriteAnims.tpl
unique_id: q4Ug824E
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
  key: '{{ element.values.key }}',
  frames: this.anims.generateFrameNumbers('{{ element.values.spriteName }}', { frames: {{ element.values.frames }} }),
  frameRate: {{ element.values.frameRate }},
  repeat: {{ element.values.repeat }}
});
