/*
path: AssetLoaderVideo.tpl
keyPath: elements/Games/AssetLoaderVideo.tpl
unique_id: GKVh1AGO
icon: f:asset-loader.svg
options:
  - name: name
    display: Descriptive Name
    type: text
  - name: useVideo
    display: Use Video
    type: checkbox
  - name: autoplay
    display: Autoplay
    type: text
    options: ''
    required: true
    settings: 
      propertyCondition: useVideo
      condition: true
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
{% if element.values.useOtherAsset and element.values.useOtherAsset != 'none' %}
  {% if element.values.useOther %}
    {% set asset = element.values.useOtherAsset|assetData %}
  {% endif %}
{% endif %}
{% if element.values.useVideo %}
  {% set path = '/img/' ~ asset.name %}
  this.load.video('{{ element.values.name | friendly }}', {{ path | textOrVariableInCode }}, {{ element.values.autoplay | default(true) }})
{% endif %}
