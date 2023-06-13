/*
path: image.tpl
completePath: elements/Material-UI/image.tpl
unique_id: ZdcUOO3m
children: []
icon: ico-image
helpText: Easily use images from Assets or the web
options:
  - name: useAsset
    display: Use an asset
    type: dropdown
    options: return aptugo.assetUtils.images().map(image => [image.id, image.name])
  - name: path
    display: Image Path
    type: text
    options: ''
  - name: webppath
    display: Image Path (WebP)
    type: text
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
  - name: className
    display: className
    type: styles
  - name: alt
    display: Alt Text
    type: text
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
  - name: width
    display: Width
    type: text
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
  - name: height
    display: Height
    type: text
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
  - name: style
    display: Extra Styles
    type: text
    options: ''
  - name: background
    display: Use as Background
    type: checkbox
    options: ''
  - name: resizeMode
    display: Resize Mode
    type: dropdown
    options: cover;contain;stretch;repeat;center
  - name: imageStyles
    display: Extra Styles for the image property
    type: text
    settings:
      propertyCondition: background
      condition: true
*/
{% set tag = 'Image' %}
{% if element.values.background %}{%set tag = 'ImageBackground' %}{% endif %}
{% set bpr %}
import { {{tag}} } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set path = element.values.path %}
{% set webppath = element.values.webppath %}
{% set width = element.values.width|default(null) %}
{% set height = element.values.height|default(null) %}

{% if element.values.useAsset %}
  {% set asset = element.values.useAsset|assetData %}
  {% if width == null %}
    {% set width = asset.width %}
  {% endif %}
  {% if height == null %}
    {% set height = asset.height %}
  {% endif %}
  {% set path = '/img/' ~ asset.name %}
  {% if asset.versions %}
    {% for version in asset.versions %}
      {% if (version.type == 'webP' or version.type == 'webp') %}
        {% set webppath = '/img/' ~ version.name %}
      {% endif %}
    {% endfor %}
  {% endif %}
<{{tag}}
  {% if element.values.className %}style={ {{element.values.className}} }{% endif %}
  source={require('../assets{{ path }}')}
  {% if element.values.style %}style={ { {{element.values.style}} } }{% endif %}
  {% if element.values.resizeMode %}resizeMode={ {{element.values.resizeMode | textOrVariable }} }{% endif %}
/>
{% else %}
<{{tag}}
  {% if element.values.className %}style={ {{element.values.className}} }{% endif %}
  source={ { uri: {{ path | textOrVariableInCode }} } }
  {% if element.values.style %}style={ { {{element.values.style}} } }{% endif %}
  {% if element.values.imageStyles %}imageStyle={ { {{element.values.imageStyles}} } }{% endif %}
  {% if element.values.resizeMode %}resizeMode={ {{element.values.resizeMode | textOrVariable }} }{% endif %}
>{{ content | raw }}</{{tag}}>
{% endif %}
