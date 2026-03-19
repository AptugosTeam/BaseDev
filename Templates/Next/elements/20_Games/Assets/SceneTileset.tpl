/*
path: SceneTileset.tpl
keyPath: elements/Games/Assets/SceneTileset.tpl
unique_id: fS5nw25J
icon: ico-tileset
order: 10
options:
  - name: asset
    display: Game Asset to Display
    type: text
    options: ''
  - name: namejson
    display: Variable Name to use
    type: text
    advanced: true
    settings:
      default: jsonmap
  - name: nametileset
    display: Variable Name for the tileset
    type: text
    advanced: true
    settings:
      default: jsonmaptileset
  - name: nametilesetCollisions
    display: Variable Name for the collisions layer
    type: text
    advanced: true
    settings:
      default: jsonmaptilesetlayer
  - name: patternLayer
    display: Name of Pattern Layer 
    type: text
    options: ''
  - name: tilesNameA
    display: Primary Tileset to use
    type: text
    options: ''
  - name: tilesNameB
    display: Tileset asset name
    type: text
    options: ''
  - name: keyCollides
    display: Collisions property name
    type: text
    options: ''
  - name: valueCollides
    display: Value to check for collisions
    type: text
    options: ''
*/
{% set mapName = element.values.namejson|default('namejson') %}
{% set tilesetName = element.values.nametileset|default('jsonmaptileset') %}
{% set tilesetCollisionsName = element.values.nametilesetCollisions|default('jsonmaptilesetlayer') %}
{% set variableDeclarations %}
  {{ mapName }}:{{ 'any' }}
  {{ tilesetName }}:{{ 'any' }}
  {{ tilesetName }}layer:{{ 'any' }}
{% endset %}
{{ save_delayed('variableDeclarations', variableDeclarations) }}

this.{{mapName}} = this.make.tilemap({ key: '{{ element.values.asset }}' });
this.{{tilesetName}} = this.{{mapName}}.addTilesetImage('{{ element.values.tilesNameA }}'{% if element.values.tilesNameB %}, '{{ element.values.tilesNameB }}'{% endif %})
this.{{ tilesetCollisionsName}} = this.{{mapName}}.createLayer('{{ element.values.patternLayer }}', this.{{ tilesetName }}, 0, 0)
{% if element.values.keyCollides %}
  this.{{ tilesetCollisionsName }}.setCollisionByProperty({ {{ element.values.keyCollides }}: {{ element.values.valueCollides }}})
{% endif %}