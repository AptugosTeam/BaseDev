/*
path: SceneSound.tpl
keyPath: elements/Games/SceneSound.tpl
unique_id: IcPGChFr
icon: ico-sound-low
options:
  - name: asset
    display: Game Asset to Use
    type: text
    options: ''
  - name: loop
    display: Loop
    type: checkbox
    options: ''
  - name: volume
    display: Volumen
    type: text
    options: ''
    advanced: true
*/
this.sound.add('{{ element.values.asset }}', { loop: {{ element.values.loop | default (false) }} {% if element.values.volume %}, volume: {{ element.values.volume | default (1) }}{% endif %} });