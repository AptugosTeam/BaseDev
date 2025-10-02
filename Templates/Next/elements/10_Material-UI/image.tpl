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
    options: >-
      return [['none', 'none'],
      ...aptugo.assetUtils.images().map(image => [image.id, image.name])]
  - name: path
    display: Image Path
    type: text
    options: ''
    settings: {
      "propertyCondition": "useAsset",
      "condition": "none"
    }
  - name: webppath
    display: Image Path (WebP)
    type: text
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
    settings: {
      "propertyCondition": "useAsset",
      "condition": "none"
    }
  - name: className
    display: ClassName
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
  - name: onLoad
    display: On Load
    type: text
    advanced: true
  - name: onError
    display: On Error
    type: text
    advanced: true
  - name: background
    display: Use as Background
    type: checkbox
    options: ''
    advanced: true
  - name: priority
    display: Prioritize image loading
    type: checkbox
    options: ''
    advanced: true
  - name: draggable
    display: Disable image drag
    type: checkbox
    options: ''
    advanced: true
  - name: usePlainTag
    display: Use plain IMG tag
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
  - name: srcSet
    display: Image SrcSet
    type: code
    options: ''
    advanced: true
    settings:
      condition: true
      propertyCondition: usePlainTag
  - name: sizes
    display: Image Sizes
    type: code
    advanced: true
    settings:
      condition: true
      propertyCondition: usePlainTag
  - name: customPictureContent
    display: Custom Picture Content
    type: code
    options: ''
    advanced: true
*/
{% if element.values.background %}{%set tag = 'div' %}{% endif %}
{% set path = element.values.path %}
{% set webppath = element.values.webppath %}
{% set width = element.values.width|default(null) %}
{% set height = element.values.height|default(null) %}
{% set usePlainTag = element.values.usePlainTag|default(false) %}
{% if element.values.useAsset and element.values.useAsset != 'none' %}
  {% set asset = element.values.useAsset|assetData %}
  {% if width == null %}
    {% set width = asset.info.width %}
  {% endif %}
  {% if height == null %}
    {% set height = asset.info.height %}
  {% endif %}
  {% set path = '/img/' ~ asset.name %}
  {% if asset.versions %}
    {% for version in asset.versions %}
      {% if (version.type == 'webP' or version.type == 'webp') %}
        {% set webppath = '/img/' ~ version.name %}
      {% endif %}
    {% endfor %}
  {% endif %}
{% endif %}
{% if width and height and not usePlainTag %}
  {% set bpr %}import Image from 'next/image'{% endset %}{{ save_delayed('bpr', bpr ) }}
  {% if element.values.customPictureContent %} {{ element.values.customPictureContent | raw }} {% endif %}
  <Image {% if element.values.priority %}priority={ {{ element.values.priority }} }{% endif %} {% if element.values.className %}className={ {{element.values.className}} }{% endif %} width={ {{width}} } height={ {{height}} } src={{ path|textOrVariable }} alt={{ element.values.alt|textOrVariable|default(path|textOrVariable) }} />
{% else %}
  {% set tag = 'picture' %}
  <{{ tag }}
    {% if element.values.className %}className={ {{element.values.className}} }{% endif %}
  >
    {% if webppath %}
    <source type="image/webp" srcSet="{{ webppath }}" />
    {% endif %}
    {% if element.values.customPictureContent %}
    {{  element.values.customPictureContent | raw }}
    {% endif %}
    <img
      src={{ path|textOrVariable }}
      {% if element.values.usePlainTag and element.values.srcSet %}
        srcSet={ {{ element.values.srcSet }} }
      {% endif %}
      {% if element.values.usePlainTag and element.values.sizes %}
        sizes={ {{ element.values.sizes }} }
      {% endif %}
      alt={{ element.values.alt|default(path)|textOrVariable }}
      {% if width %} width={{ width|textOrVariable }}{% endif %}
      {% if height %} height={{ height|textOrVariable }}{% endif %}
      {% if element.values.onLoad %}
        onLoad={ {{ element.values.onLoad }} }
      {% endif %}
      {% if element.values.onError %}
        onError={ {{ element.values.onError }} }
      {% endif %}
      {% if element.values.draggable %}
        draggable={false}
      {% endif %}
    />
    {{ content | raw }}
  </{{ tag }}>
{% endif %}