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
  - name: ExtraProperties
    display: Extra Properties
    type: text
    options: ''
    advanced: true
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
  {% if element.values.ExtraProperties %}
    {{ element.values.ExtraProperties }}:any
  {% endif %}
  {% for delay in delayed %}
    {% for specificDelay in delay.variableDeclarations %}
      {{ specificDelay }}
    {% endfor %}
  {% endfor %}
  constructor({% if element.values.ExtraProperties %}{{ element.values.ExtraProperties }}{% endif %}) {
    super({ key: '{{ sceneName }}' })
    {% if element.values.ExtraProperties %}
      this.{{ element.values.ExtraProperties }} = {{ element.values.ExtraProperties }}
    {% endif %}
  }
	{{ content | raw }}
}
{% endblock %}
{% set scenePath = 'src/game/Scenes/' ~ sceneName ~ '.tsx' %}
{{ addExtraFile(scenePath, block("baseScene")) }}