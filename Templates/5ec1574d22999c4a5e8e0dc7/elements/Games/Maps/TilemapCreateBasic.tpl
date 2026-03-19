/*
path: TilemapCreateBasic.tpl
keyPath: elements/Games/Maps/TilemapCreateBasic.tpl
unique_id: fS5nwCNG
icon: f:grid_view.svg
options:
  - name: namejson
    display: Create Variable Key Json
    type: text
    required: true
  - name: key
    display: Key Name Map
    type: text
    required: true
    options: ''
  - name: nametileset
    display: Create Variable Tileset
    type: text
    required: true
  - name: tilesNameA
    display: Tiles NameA
    type: text
    required: true
    options: ''
  - name: tilesNameB
    display: Tiles NameB
    type: text
    required: true
    options: ''
  - name: namemapcollision
    display: Create Variable Map Collision
    type: text
    required: true
  - name: patternLayer
    display: Pattern Layer
    type: text
    required: true
    options: ''
  - name: keyCollides
    display: Key Collides
    type: text
    required: true
    options: ''
  - name: valueCollides
    display: Value Collides
    type: text
    required: true
    options: ''
*/
{% set variableDeclarations %}
{{ element.values.namejson }}:{{ 'any' }}

{{ element.values.nametileset }}:{{ 'any' }}

{{ element.values.namemapcollision }}:{{ 'any' }}
{% endset %}
{{ save_delayed('variableDeclarations', variableDeclarations) }}


this.{{ element.values.namejson }} = this.make.tilemap({ key: '{{ element.values.key }}' });

this.{{ element.values.nametileset }} = this.{{ element.values.namejson }}.addTilesetImage('{{ element.values.tilesNameA }}', '{{ element.values.tilesNameB }}');

// Verifica que los nombres de las capas coincidan con los del JSON
this.{{ element.values.namemapcollision }} = this.{{ element.values.namejson }}.createLayer('{{ element.values.patternLayer }}', this.{{ element.values.nametileset }}, 0, 0);

// Configura la colisión en la capa de suelo
this.{{ element.values.namemapcollision }}.setCollisionByProperty({ {{ element.values.keyCollides }}: {{ element.values.valueCollides }}});