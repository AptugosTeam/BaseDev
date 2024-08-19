/*
path: TilemapLoad.tpl
keyPath: elements/Games/Maps/TilemapLoad.tpl
unique_id: fP9nw24J
icon: f:view_compact.svg
options:
  - name: name
    display: Descriptive Name Image
    type: text
  - name: path
    display: Image Path
    type: text
    options: ''
  - name: useAsset
    display: Use an asset
    type: dropdown
    options: >-
      return [['none', 'None'],
      ...aptugo.assetUtils.images().map(image => [image.id, image.name])]
  - name: nameMap
    display: Descriptive Name Map
    type: text
  - name: pathmap
    display: Image Path Map
    type: text
    options: ''
  - name: useOther
    display: Use other files (not images)
    type: checkbox
  - name: useOtherAsset
    display: Use other asset
    type: dropdown
    options: >-
      return [['none', 'None'],
      ...aptugo.assetUtils.other().map(image => [image.id, image.name])]
*/
  {% set path = element.values.path %}
  {% set asset = element.values.useAsset|assetData %}
  {% set path = '/img/' ~ asset.name %}

this.load.image('{{ element.values.name | friendly }}', {{ path | textOrVariableInCode }});

    {% set asset = element.values.useOtherAsset|assetData %}
    {% set path = '/' ~ asset.name %}
  this.load.tilemapTiledJSON('{{ element.values.nameMap | friendly }}', '/img/{{ element.values.pathmap }}');




