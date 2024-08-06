/*
path: PhaserScene.tpl
keyPath: elements/Games/PhaserScene.tpl
unique_id: xdlC7Hpo
icon: f:movie.svg
usesDelays: [variableDeclarations]
delayContext: true
options:
  - name: name
    display: Scene Name
    type: text
    options: ''
*/
{% set sceneName = element.values.name|default(element.unique_id) | friendly | capitalize %}
{% block baseScene %}
import Phaser from 'phaser'

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
{% set scenePath = 'front-end/Pages/Scenes/' ~ sceneName ~ '.tsx' %}
{{ addExtraFile(scenePath, block("baseScene")) }}