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
  - name: onLoad
    display: On Load
    type: text
    advanced: true
  - name: onError
    display: On Error
    type: text
    advanced: true
  - name: style
    display: Extra Styles
    type: text
    advanced: true
    options: ''
  - name: background
    display: Use as Background
    type: checkbox
    options: ''
    advanced: true
  - name: draggable
    display: Disable image drag
    type: checkbox
    options: ''
    advanced: true
  - name: lazyLoading
    display: Enable lazy loading
    type: checkbox
    options: ''
    advanced: true
  - name: sourceChilds
    display: Enable source childs
    type: checkbox
    options: ''
    advanced: true
*/
{% set tag = 'picture' %}
{% if element.values.background %}{%set tag = 'div' %}{% endif %}
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
<{{ tag }}
  {% if element.values.className %}className={ {{element.values.className}} }{% endif %}
>
  {% if webppath %}
  <source type="image/webp" srcSet="{{ webppath }}" />
  {% endif %}
  {% if element.values.sourceChilds %}
  {{ content | raw }}
  {% endif %}
  <img
    {% if element.values.lazyLoading %}
      loading="lazy"
    {% endif %}
    {% if path %}
    src={{ path|textOrVariable }}
    alt={{ element.values.alt|textOrVariable|default(path|textOrVariable) }}
    {% endif %}
    {% if not path and element.values.alt%}
    alt={{ element.values.alt|textOrVariable }}
    {% endif %}
    {% if width %}
      width={{ width|textOrVariable }}
    {% endif %}
    {% if height %}
      height={{ height|textOrVariable }}
    {% endif %}
    {% if element.values.onLoad %}
      onLoad={ {{ element.values.onLoad }} }
    {% endif %}
    {% if element.values.onError %}
      onError={ {{ element.values.onError }} }
    {% endif %}
    {% if element.values.style %}
      style={ {{element.values.style}} }
    {% endif %}
    {% if element.values.draggable %}
      draggable={false}
    {% endif %}
  />
  {% if not element.values.sourceChilds %}{{ content | raw }}{% endif %}
</{{ tag }}>