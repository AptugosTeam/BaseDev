/*
path: TilemapLoad.tpl
keyPath: elements/Games/Maps/TilemapLoad.tpl
unique_id: fP9nw24J
icon: f:view_compact.svg
options:
  - name: name
    display: Descriptive Name Image
    type: text
    required: true
  - name: useAsset
    display: Use an asset
    type: dropdown
    required: true
    options: >-
      return [['none', 'None'],
      ...aptugo.assetUtils.images().map(image => [image.id, image.name])]
  - name: nameMap
    display: Descriptive Name Map
    type: text
    required: true
  - name: pathmap
    display: Json Path Map
    type: dropdown
    required: true
    options: >-
      return [['none', 'None'],
      ...aptugo.assetUtils.other().map(image => [image.id, image.name])]
*/

  {% set path = element.values.path %}
  {% set asset = element.values.useAsset|assetData %}
  {% set path = '/img/' ~ asset.name %}

this.load.image('{{ element.values.name | friendly }}', {{ path | textOrVariableInCode }});

{% if element.values.pathmap %}
  {% set asset = element.values.pathmap|assetData %}
  {% set path = '/' ~ asset.name %}
  this.load.tilemapTiledJSON('{{ element.values.nameMap | friendly }}', {{ path | textOrVariableInCode }})
{% endif %}
