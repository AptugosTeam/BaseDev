/*
path: cardMedia.tpl
completePath: elements/Material-UI/Cards/cardMedia.tpl
unique_id: vcZKHGTu
icon: ico-image
helpText: Easily use images from Assets
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
  - name: class
    display: ClassName
    type: styles
    options: ''
  - name: width
    display: Width
    type: text
    options: ''
  - name: height
    display: Height
    type: text
    options: ''
*/
{% set bpr %}
import CardMedia from '@mui/material/CardMedia'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set path = element.values.path %}
{% set width = element.values.width|default(null) %}
{% set height = element.values.height|default(null) %}
{% if element.values.useAsset and element.values.useAsset != 'none' %}
{% set asset = element.values.useAsset|assetData %}
  {% if width == null %}
    {% set width = asset.width %}
  {% endif %}
  {% if height == null %}
    {% set height = asset.height %}
  {% endif %}
{% set path = '/img/' ~ asset.name %}
{% endif %}
<CardMedia
    {% if element.values.class %}className={ {{element.values.class}} }{% endif %}
    {% if  element.values.title %}title={ {{ element.values.title }} }{% endif %}
    image={{ path|textOrVariable }}
    {% if element.values.width or element.values.height %} 
    sx={ { 
      {% if element.values.width %} width:'{{ element.values.width }}px' {%endif%}
      {% if element.values.width and element.values.height%}, {%endif%}
      {% if element.values.height %} height:'{{ element.values.height }}px' {%endif%}
    } } 
    {% endif %}
/>