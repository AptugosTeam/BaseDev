/*
path: PhaserScene.tpl
keyPath: elements/Games/PhaserScene.tpl
unique_id: xdlC7Hpo
icon: ico-movie
holder: true
order: 2
usesDelays: [bpr,variableDeclarations]
delayContext: true
options:
  - name: name
    display: Scene Name
    type: text
    options: ''
childs:
  - name: Preload
    element: PhaserSceneFunction
    values: {
      stage: 'preload'
    }
  - name: Create
    element: PhaserSceneFunction
    values: {
      stage: 'create'
    }
  - name: Update
    element: PhaserSceneFunction
    values: {
      stage: 'update'
    }
*/
{% set sceneName = element.values.name|default(element.unique_id) | friendly | capitalize %}
{% block baseScene %}
import Phaser from 'phaser'
{% for delay in delayed %}
  {% for specificDelay in delay.bpr %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}

export default class {{ sceneName }} extends Phaser.Scene {
  {% for delay in delayed %}
    {% for specificDelay in delay.variableDeclarations %}
      {{ specificDelay }}
    {% endfor %}
  {% endfor %}
  constructor() {
    super({ key: '{{ sceneName }}' })
  }
	{{ content | raw }}
}
{% endblock %}
{% set scenePath = 'src/game/Scenes/' ~ sceneName ~ '.tsx' %}
{{ addExtraFile(scenePath, block("baseScene")) }}