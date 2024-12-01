/*
path: AssetLoaderVideo.tpl
keyPath: elements/Games/AssetLoaderVideo.tpl
unique_id: GKVh1AGO
icon: f:asset-loader.svg
options:
  - name: name
    display: Descriptive Name
    type: text
    required: true
  - name: useVideo
    display: Use External Video
    type: checkbox
    options: ''
    settings:
      default: 'false'
  - name: useOtherAsset
    display: Use Local Video
    type: dropdown
    required: true
    options: >-
      return [['none', 'None'],
      ...aptugo.assetUtils.other().map(image => [image.id, image.name])]
    settings: 
      propertyCondition: useVideo
      conditionNegate: true
      condition: true
  - name: videourl
    display: Video Url
    type: text
    required: true
    settings: 
      propertyCondition: useVideo
      condition: true
  - name: noAudio
    display: Audio Not Loading
    type: checkbox
    settings:
      default: 'false'
*/
{% set variablenoAudio = element.values.noAudio | default(false) %}
{% set variableUseVideo = element.values.useVideo | default(false) %}
{% set asset = element.values.useOtherAsset|assetData %}
{% set variableVideo = variableUseVideo == true ? element.values.videourl : '/' ~ asset.name %}
this.load.video('{{ element.values.name | friendly }}', '{{variableVideo}}', {{variablenoAudio | default(false)}})
