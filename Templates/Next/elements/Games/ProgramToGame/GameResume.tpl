/*
path: GameResume.tpl
keyPath: elements/ProgramToGame/GameResume.tpl
unique_id: IcP122JL
icon: f:asset-loader.svg
options:
  - name: valuesScene
    display: GameStart
    type: dropdown
    options: 
      return [['pause', 'Pause'], ['resume', 'Resume']]
    settings:
      default: pause
*/

this.game.{{element.values.valuesScene}}();