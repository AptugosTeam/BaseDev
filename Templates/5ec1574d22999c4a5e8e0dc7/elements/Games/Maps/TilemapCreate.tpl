/*
path: TilemapCreate.tpl
keyPath: elements/Games/Maps/TilemapCreate.tpl
unique_id: fS5nw25J
icon: f:grid_view.svg
options:
  - name: key
    display: Key Name Map
    type: text
    options: ''
  - name: tilesNameA
    display: Tiles NameA
    type: text
    options: ''
  - name: tilesNameB
    display: Tiles NameB
    type: text
    options: ''
  - name: patternLayer
    display: Pattern Layer
    type: text
    options: ''
  - name: keyCollides
    display: Key Collides
    type: text
    options: ''
  - name: valueCollides
    display: Value Collides
    type: text
    options: ''
*/
this.map = this.make.tilemap({ key: '{{ element.values.key }}' });
const groundTiles = this.map.addTilesetImage('{{ element.values.tilesNameA }}', '{{ element.values.tilesNameB }}');

// Verifica que los nombres de las capas coincidan con los del JSON
this.groundLayer = this.map.createLayer('{{ element.values.patternLayer }}', groundTiles, 0, 0);

// Configura la colisión en la capa de suelo
this.groundLayer.setCollisionByProperty({ {{ element.values.keyCollides }}: {{ element.values.valueCollides }}});