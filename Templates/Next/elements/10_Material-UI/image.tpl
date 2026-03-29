/*
path: image.tpl
completePath: elements/Material-UI/image.tpl
unique_id: ZdcUOO3m
children: []
icon: ico-image
helpText: Renders an image from assets or a direct path. Uses Next Image when width and height are available and Use plain IMG tag is disabled. Use Background for decorative section backgrounds.
options:
  - name: useAsset
    display: Use an asset
    type: dropdown
    options: >-
      return [['none', 'none'],
      ...aptugo.assetUtils.images().map(image => [image.id, image.name])]
    helpText: Select an uploaded image asset. When an asset is selected, the image path is generated automatically and width and height can be inferred from the asset metadata.
  - name: path
    display: Image Path
    type: text
    options: ''
    settings: {
      "propertyCondition": "useAsset",
      "condition": "none"
    }
    helpText: Direct image URL or local path. Use this when the image does not come from Assets. 
  - name: className
    display: ClassName
    type: styles
    helpText: Visual styles for the rendered image or background container. Prefer theme classes and reusable styles instead of inline custom logic.
  - name: alt
    display: Alt Text
    type: text
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
    helpText: Accessible text describing the image content. Use meaningful alt text for informative images. Use an empty string only for purely decorative images.
  - name: width
    display: Width
    type: text
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
    helpText: Image width. Use a numeric value when known. When width and height are both available and Use plain IMG tag is disabled, the template uses Next Image automatically.
  - name: height
    display: Height
    type: text
    options: >-
      return aptugo.assetUtils.grabCssSelectors(
      aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )
    helpText: Image height. Use a numeric value when known. When height and width are both available and Use plain IMG tag is disabled, the template uses Next Image automatically.
  - name: onLoad
    display: On Load
    type: text
    advanced: true
    helpText: Optional event handler for when the image finishes loading. Use a function reference or inline callback expression.
  - name: onError
    display: On Error
    type: text
    advanced: true
    helpText: Optional event handler for image load failure. Useful for fallbacks, logging, or swapping the source.
  - name: background
    display: Use as Background
    type: checkbox
    options: ''
    advanced: true
    helpText: Render a div with background-image instead of an img tag. Use this for hero banners, section backgrounds, or decorative blocks that contain child content.
  - name: priority
    display: Prioritize image loading
    type: checkbox
    options: ''
    advanced: true
    helpText: Only relevant for Next Image mode. Enable for above-the-fold images like hero images or key branding visuals.
  - name: draggable
    display: Disable image drag
    type: checkbox
    options: ''
    advanced: true
    helpText: Prevents the browser from allowing the image to be dragged. Useful for polished UI, cards, and decorative images.
  - name: usePlainTag
    display: Use plain IMG tag
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
    helpText: Force rendering with a native img tag even when width and height are available. Use this only when you specifically need native img behavior such as custom srcSet or browser-native image handling.
  - name: srcSet
    display: Image SrcSet
    type: code
    options: ''
    advanced: true
    settings:
      condition: true
      propertyCondition: usePlainTag
    helpText: Optional srcSet for responsive images. Only applies in plain IMG mode. Use when you need to provide multiple image sources for different resolutions.
  - name: sizes
    display: Image Sizes
    type: code
    advanced: true
    settings:
      condition: true
      propertyCondition: usePlainTag
    helpText: Optional sizes attribute for responsive images. Only applies in plain IMG mode. Use together with srcSet to improve browser image selection.
*/
{% set path = element.values.path %}
{% set width = element.values.width|default(null) %}
{% set height = element.values.height|default(null) %}
{% set usePlainTag = element.values.usePlainTag|default(false) %}
{% set isBackground = element.values.background|default(false) %}

{% if element.values.useAsset and element.values.useAsset != 'none' %}
  {% set asset = element.values.useAsset|assetData %}
  {% if width == null and asset.info and asset.info.width %}
    {% set width = asset.info.width %}
  {% endif %}
  {% if height == null and asset.info and asset.info.height %}
    {% set height = asset.info.height %}
  {% endif %}
  {% set path = '/img/' ~ asset.name %}
{% endif %}

{% if isBackground %}
  <div
    {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
    style={ {
      backgroundImage: `url(${ {{ path|textOrVariable }} })`,
      backgroundRepeat: 'no-repeat',
      backgroundPosition: 'center',
      backgroundSize: 'cover'
    } }
  >
    {{ content | raw }}
  </div>
{% elseif width and height and not usePlainTag %}
  {% set bpr %}import Image from 'next/image'{% endset %}{{ save_delayed('bpr', bpr ) }}
  <Image
    {% if element.values.priority %}priority={ {{ element.values.priority }} }{% endif %}
    {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
    width={ {{ width|textOrVariable }} }
    height={ {{ height|textOrVariable }} }
    src={{ path|textOrVariable }}
    alt={{ element.values.alt|textOrVariable|default(path|textOrVariable) }}
    {% if element.values.onLoad %}onLoad={ {{ element.values.onLoad }} }{% endif %}
    {% if element.values.onError %}onError={ {{ element.values.onError }} }{% endif %}
    {% if element.values.draggable %}draggable={false}{% endif %}
  />
{% else %}
  <img
    {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
    src={{ path|textOrVariable }}
    alt={{ element.values.alt|default(path)|textOrVariable }}
    {% if element.values.srcSet %}
      srcSet={ {{ element.values.srcSet }} }
    {% endif %}
    {% if element.values.sizes %}
      sizes={ {{ element.values.sizes }} }
    {% endif %}
    {% if width %}width={{ width|textOrVariable }}{% endif %}
    {% if height %}height={{ height|textOrVariable }}{% endif %}
    {% if element.values.onLoad %}onLoad={ {{ element.values.onLoad }} }{% endif %}
    {% if element.values.onError %}onError={ {{ element.values.onError }} }{% endif %}
    {% if element.values.draggable %}draggable={false}{% endif %}
  />
{% endif %}