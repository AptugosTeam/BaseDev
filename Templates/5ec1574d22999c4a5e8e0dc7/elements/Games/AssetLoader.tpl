/*
path: AssetLoader.tpl
keyPath: elements/Games/AssetLoader.tpl
unique_id: GKVhVghQ
icon: f:asset-loader.svg
options:
  - name: name
    display: Descriptive Name
    type: text
  - name: useOther
    display: Use other files (not images, yes sound)
    type: checkbox
    options: ''
    settings:
      default: 'false'
  - name: useAsset
    display: Use an asset
    type: dropdown
    options: >-
      return [['none', 'None'],
      ...aptugo.assetUtils.images().map(image => [image.id, image.name])]
    settings: 
      propertyCondition: useOther
      conditionNegate: true
      condition: true
  - name: useOtherAsset
    display: Use other asset
    type: dropdown
    options: >-
      return [['none', 'None'],
      ...aptugo.assetUtils.other().map(image => [image.id, image.name])]
    settings: 
      propertyCondition: useOther
      condition: true
  - name: useSpritesheet
    display: Use spritesheet
    type: checkbox
    settings: 
      propertyCondition: useOther
      conditionNegate: true
      condition: true
  - name: frameWidth
    display: Frame Width
    type: text
    options: ''
    required: true
    settings: 
      propertyCondition: useSpritesheet
      condition: true
  - name: frameHeight
    display: Frame Height
    type: text
    options: ''
    required: true
    settings: 
      propertyCondition: useSpritesheet
      condition: true
*/
{% set useOther = element.values.useOther | default(false) %}
{% if element.values.useAsset and element.values.useAsset != 'none' %}
  {% set asset = element.values.useAsset|assetData %}
  {% if element.values.useSpritesheet %}
  {% set path = '/img/' ~ asset.name %}
    this.load.spritesheet('{{ element.values.name | friendly }}', {{ path | textOrVariableInCode }}, { frameWidth: {{ element.values.frameWidth | default(16)  }}, frameHeight: {{ element.values.frameHeight | default(16) }} });
  {% else %}
    {% set path = '/img/' ~ asset.name %}
    this.load.image('{{ element.values.name | friendly }}', {{ path | textOrVariableInCode }});
  {% endif %}
{% endif %}
{% if element.values.useOtherAsset and element.values.useOtherAsset != 'ninguno' %}
  {% if element.values.useOther %}
    {% set asset = element.values.useOtherAsset|assetData %}
    {% set path = '/' ~ asset.name %}
    this.load.audio('{{ element.values.name | friendly }}', {{ path | textOrVariableInCode }})
  {% endif %}
{% endif %}
