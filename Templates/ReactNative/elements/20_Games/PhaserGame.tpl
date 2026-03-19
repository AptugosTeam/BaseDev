/*
path: PhaserGame.tpl
keyPath: elements/Games/PhaserGame.tpl
unique_id: NBsQ9yzU
double: true
icon: ico-game
hideContent: true
styledIcon: f:../z-images/phaserGame.jpg
order: 1
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
  - name: EditUseEffect
    display: Edit useEffect
    type: code
    options: ''
    advanced: true
  - name: Friction
    display: Friction
    type: text
    options: ''
    advanced: true
settings:
  - name: Packages
    value: '"phaser": "^3.70.0",'
*/
{% set id = element.unique_id %}
{% set gameName = element.name|default(element.unique_id) | friendly | capitalize %}
{% set gamePath = 'Game_' ~ gameName %}
{% set scenes = [] %}
{% for child in element.children %}
  {% set scenes = scenes|merge([child.values.name|default(child.unique_id) | friendly | capitalize ]) %}
{% endfor %}
{% set forget %}
  {% block baseGame %}
    import { useEffect, useRef } from 'react'
    import { Game } from 'phaser'

    {% for scn in scenes %}
      import {{ scn }} from '../GameScenes/{{ scn }}'
    {% endfor %}

    const PhaserPage = () => {
      const gameContainer = useRef<HTMLDivElement>(null)

      useEffect(() => {
        if (gameContainer.current) {
          const gameConfig = {
            parent: gameContainer.current,
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
            {% endif %}
          }

          const game = new Game(gameConfig)

          return () => game.destroy(true)
        }
      }, [])

      return (<div ref={gameContainer} {% if element.values.class %}className={ {{element.values.class}} }{% endif %} />)
    }

    export default PhaserPage
  {% endblock %}
  {{ addExtraFile(gamePath ~ '.tsx', block("baseGame")) }}
{% endset %}
{% set bpr %}
import {{ gameName }} from './{{ gamePath }}'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<{{ gameName }} />