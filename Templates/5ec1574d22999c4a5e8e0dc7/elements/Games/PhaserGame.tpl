/*
path: PhaserGame.tpl
keyPath: elements/Games/PhaserGame.tpl
unique_id: NBsQ9yzU
icon: f:stadia_controller.svg
settings:
  - name: Packages
    value: '"phaser": "^3.70.0",'
options:
  - name: class
    display: ClassName
    type: text
    options: ''
  - name: Width
    display: Width
    type: text
    options: ''
  - name: Height
    display: Height
    type: text
    options: ''
  - name: PhysicsEngine
    display: Physics Engine
    type: dropdown
    options: return [['','None'],['arcade', 'Arcade'],['matter', 'Matter']]
  - name: Debug
    display: Debug
    type: checkbox
  - name: WholeScreen
    display: Scale to whole screen?
    type: checkbox
  - name: Zoom
    display: Zoom
    type: text
    advanced: true
  - name: id
    display: ID
    type: text
    options: ''
    advanced: true
  - name: GravityX
    display: GravityX
    type: text
    options: ''
  - name: GravityY
    display: GravityY
    type: text
    options: ''
  - name: Friction
    display: Friction
    type: text
    options: ''
*/

{% set scenes = [] %}
{% for child in element.children %}
  {% set scenes = scenes|merge([child.values.name|default(child.unique_id) | friendly | capitalize ]) %}
{% endfor %}
{% set id = element.unique_id %}
{% if element.values.id %}
  {% set id = element.values.id %}
{% endif %}
{% set bpr %}
  import Phaser from 'phaser'
  {% for scn in scenes %}
    import {{ scn }} from './Scenes/{{ scn }}'
  {% endfor %}
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const config_{{ element.unique_id }}: Phaser.Types.Core.GameConfig = {
  type: Phaser.AUTO,
  parent: '{{ id }}',
  {% if element.values.WholeScreen %}
  scale: {
    mode: Phaser.Scale.FIT,
    autoCenter: Phaser.Scale.CENTER_BOTH,
  },
  {% endif %}
  {% if element.values.Width %}width: {{ element.values.Width }},{% endif %}
  {% if element.values.Height %}height: {{ element.values.Height }},{% endif %}
  {% if element.values.Zoom %}zoom: {{ element.values.Zoom }},{% endif %}
  scene: [{% for scene in scenes %}new {{ scene }}(),{% endfor %}],
  {% if element.values.PhysicsEngine %}
  physics: {
    default: '{{ element.values.PhysicsEngine }}',
    {{ element.values.PhysicsEngine }}: {
      debug: {% if element.values.Debug %}true{% else %}false{% endif %},
      {% if element.values.PhysicsEngine == 'arcade' %}
     gravity: { x: {{ element.values.GravityX|default(0) }}, y: {{ element.values.GravityY|default(0) }} },
      {% endif %}
    }
  },
   dom: {
    createContainer: true,
  },
  {% endif %}
}
{% endset %}
{{ save_delayed('ph',ph) }}
{% set ph %}
React.useEffect(() => {
  new Phaser.Game(config_{{ element.unique_id }})
},[])
{% endset %}
{{ save_delayed('ph',ph)}}
<div
  id="{{ id }}"
  {% if element.values.class %}className={ {{element.values.class}} }{% endif %}>
</div>

