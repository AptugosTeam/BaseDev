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
  - name: webppath
    display: Image Path (WebP)
    type: text
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
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
  - name: onError
    display: On Error
    type: text
    advanced: true
*/
{% set path = element.values.path %}
{% set webppath = element.values.webppath %}
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
  {% if asset.versions %}
    {% for version in asset.versions %}
      {% if (version.type == 'webP' or version.type == 'webp') %}
        {% set webppath = '/img/' ~ version.name %}
      {% endif %}
    {% endfor %}
  {% endif %}
{% endif %}
<picture>
  {% if webppath %}
  <source type="image/webp" srcSet="{{ webppath }}" />
  {% endif %}
  <img
    {% if element.values.className %}className={ {{element.values.className}} }{% endif %}
    src={{ path|textOrVariable }}
    alt={{ element.values.alt|textOrVariable|default(path|textOrVariable) }}
    {% if width %}width={{ width|textOrVariable }}{% endif %}
    {% if height %}height={{ height|textOrVariable }}{% endif %}
    {% if element.values.onError %}onError={ {{element.values.onError}} }{% endif %}
  />
</picture>

