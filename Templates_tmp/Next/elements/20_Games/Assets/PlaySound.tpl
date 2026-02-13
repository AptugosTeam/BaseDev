/*
path: PlaySound.tpl
keyPath: elements/Games/Assets/PlaySound.tpl
unique_id: IcPGChFw
icon: ico-sound-low
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