/*
path: ChangeScene.tpl
keyPath: elements/Games/Snippets/ChangeScene.tpl
unique_id: 98aWfHRP
icon: f:flip_camera_android.svg
options:
  - name: sceneName
    display: Scene Name
    type: text
    options: ''
*/
this.scene.start('{{ element.values.sceneName | capitalize }}')