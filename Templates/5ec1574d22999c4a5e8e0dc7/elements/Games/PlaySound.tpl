/*
path: PlaySound.tpl
keyPath: elements/Games/PlaySound.tpl
unique_id: IcPGChFw
icon: f:brand_awareness.svg
options:
  - name: asset
    display: Sound to play
    type: text
    options: ''
  - name: soundOptions
    display: Direction
    type: dropdown
    options: 
      return [['play', 'Play'],['pause', 'Pause'],['stop', 'Stop'], ['resume', 'Resume'] ]
    settings:
      default: play
*/
this.{{ element.values.asset }}.{{element.values.soundOptions}}();