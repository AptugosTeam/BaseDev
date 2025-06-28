/*
path: AssetLoader.tpl
display: Create Asset
displayes: Cargar Recurso
keyPath: elements/Games/AssetLoader.tpl
unique_id: GKVhVghQ
icon: ico-asset-load
options:
  - name: name
    display: Descriptive Name
    displayes: Nombre descriptivo
    type: text
  - name: assetType
    display: Asset Type
    type: dropdown
    options: return [['image','Image'],['video','Video'],['sound','Sound'],['spritesheet','Spritesheet'],['tilemap','Tilemap'],['bitmapFont','Bitmap Font']]
    settings:
      default: image
  - name: useAsset
    display: Asset to use
    displayes: Recurso a utilizar
    type: dropdown
    options: >-
      return [...aptugo.assetUtils.images().map(image => [image.id, image.name])]
    settings:
      propertyCondition: assetType
      condition: image
  - name: useAssetVideo
    display: Asset to use
    displayes: Recurso a utilizar
    type: dropdown
    options: return [...aptugo.assetUtils.other().map(image => [image.id, image.name])]
    settings: 
      propertyCondition: assetType
      condition: video,bitmapFont
  - name: useAssetSpritesheet
    display: Asset to use
    displayes: Recurso a utilizar
    type: dropdown
    options: >-
      return [...aptugo.assetUtils.images().map(image => [image.id, image.name])]
    settings:
      propertyCondition: assetType
      condition: spritesheet
  - name: useAssetTilemap
    display: Asset to use
    displayes: Recurso a utilizar
    type: dropdown
    options: >-
      return [...aptugo.assetUtils.images().map(image => [image.id, image.name])]
    settings:
      propertyCondition: assetType
      condition: tilemap
  - name: useAssetSound
    display: Asset to use
    displayes: Recurso a utilizar
    type: dropdown
    options: return [...aptugo.assetUtils.other().map(image => [image.id, image.name])]
    settings: 
      propertyCondition: assetType
      condition: sound,bitmapFont
  - name: autoplay
    display: Autoplay
    displayes: Inicio automático
    type: text
    options: ''
    settings: 
      propertyCondition: assetType
      condition: video
  - name: frameWidth
    display: Frame Width
    type: text
    options: ''
    settings: 
      propertyCondition: assetType
      condition: spritesheet
  - name: frameHeight
    display: Frame Height
    type: text
    options: ''
    settings:
      propertyCondition: assetType
      condition: spritesheet
  - name: nameMap
    display: Descriptive Name Map
    type: text
    settings: 
      propertyCondition: assetType
      condition: tilemap,bitmapFont
  - name: pathmap
    display: Json Path Map
    type: dropdown
    options: return [...aptugo.assetUtils.other().map(image => [image.id, image.name])]
    settings: 
      propertyCondition: assetType
      condition: tilemap
*/
{% if element.values.assetType == 'image' %}
  {% set asset = element.values.useAsset|assetData %}
  {% set path = '/img/' ~ asset.name %}
  this.load.image('{{ element.values.name | friendly }}', {{ path | textOrVariableInCode }})
{% elseif element.values.assetType == 'video' %}
  {% set asset = element.values.useAssetVideo|assetData %}
  {% set path = '/' ~ asset.name %}
  this.load.video('{{ element.values.name | friendly }}', {{ path | textOrVariableInCode }}, {{ element.values.autoplay | default(true) }})
{% elseif element.values.assetType == 'spritesheet' %}
  {% set asset = element.values.useAssetSpritesheet|assetData %}
  {% set path = '/img/' ~ asset.name %}
  this.load.spritesheet('{{ element.values.name | friendly }}', {{ path | textOrVariableInCode }}, { frameWidth: {{ element.values.frameWidth | default(16)  }}, frameHeight: {{ element.values.frameHeight | default(16) }} })
{% elseif element.values.assetType == 'sound' %}
  {% set asset = element.values.useAssetSound|assetData %}
  {% set path = '/' ~ asset.name %}
  this.load.audio('{{ element.values.name | friendly }}', {{ path | textOrVariableInCode }})
{% elseif element.values.assetType == 'tilemap' %}
  {% set asset = element.values.useAssetTilemap|assetData %}
  {% set path = '/img/' ~ asset.name %}
  this.load.image('{{ element.values.name | friendly }}', {{ path | textOrVariableInCode }})
  {% if element.values.pathmap %}
    {% set asset = element.values.pathmap|assetData %}
    {% set path = '/' ~ asset.name %}
    this.load.tilemapTiledJSON('{{ element.values.nameMap | friendly }}', {{ path | textOrVariableInCode }})
  {% endif %}
{% elseif element.values.assetType == 'bitmapFont' %}
  {% set asset = element.values.useAssetVideo|assetData %}
  {% set path = '/' ~ asset.name %}
  {% set assetB = element.values.useAssetSound|assetData %}
  {% set pathB = '/' ~ assetB.name %}
  this.load.bitmapFont('{{ element.values.name | friendly }}', {{ path | textOrVariableInCode }}, {{ pathB | textOrVariableInCode }})
{% endif %}
