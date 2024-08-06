/*
path: SceneStart.tpl
keyPath: elements/ProgramToGame/SceneStart.tpl
unique_id: IcPG17JL
icon: f:start.svg
options:
  - name: valuesScene
    display: SceneStart
    type: dropdown
    options: 
      return [['start', 'Start'],['restart', 'Restart'],['stop', 'Stop'] ]
    settings:
      default: start
  - name: sceneName
    display: Scene Name
    type: text
    options: ''
    advanced: true
*/

this.scene.{{element.values.valuesScene}}({% if element.values.sceneName %} `{{element.values.sceneName}}` {% endif %});