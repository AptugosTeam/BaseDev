/*
path: source.tpl
completePath: elements/Experimental/source.tpl
unique_id: XfvIPO3m
children: []
icon: ico-image
options:
  - name: useAsset
    display: Use an asset
    type: dropdown
    options: >-
      return [['none', 'none'],
      ...aptugo.assetUtils.images().map(image => [image.id, image.name])]
  - name: path
    display: Image Path or Source Set 
    type: text
    options: ''
  - name: type
    display: Image or Media Type
    type: text
    options: ''
  - name: media
    display: Media Query
    type: text
    options: ''
  - name: sizes
    display: Source Sizes
    type: text
    options: ''
*/
{% set path = element.values.path %}
{% if element.values.useAsset and element.values.useAsset != 'none' %}
  {% set asset = element.values.useAsset|assetData %}
  {% set path = '/img/' ~ asset.name %}
{% endif %}

<source 
  {% if element.values.type  %}type={{ element.values.type|textOrVariable }}{% endif %}
  {% if element.values.media  %}media={{ element.values.media|textOrVariable }}{% endif %}
  {% if path %}srcSet={{ path|textOrVariable }}{% endif %}
  {% if element.values.sizes  %}sizes={{ element.values.sizes|textOrVariable }}{% endif %}
/>