/*
path: productCardMedia.tpl
completePath: elements/Material-UI/Cards/productCardMedia.tpl
unique_id: vcZRUSTu
icon: ico-image
helpText: Easily use images from Assets or the web
options:
  - name: useAsset
    display: Use an asset
    type: dropdown
    options: >-
      return [['none', 'none'],
      ...aptugo.assetUtils.images().map(image => [image.id, image.name])]
  - name: path
    display: Image Path
    type: text
    options: ''
*/
{% set bpr %}
import CardMedia from '@mui/material/CardMedia'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set asset = element.values.useAsset|assetData %}
{% set path = '/img/' ~ asset.name %}

<CardMedia
    {% if  element.values.className %}className={ {{ element.values.className }} }{% endif %}
    {% if  element.values.title %}title={ {{ element.values.title }} }{% endif %}
    image={{ path|textOrVariable }}
/>