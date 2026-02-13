/*
path: imageMagnifier.tpl
type: file
display: ImageMagnifier
unique_id: lVGRGwBy
icon: ico-uncontrolled-input
sourceType: javascript
order: 1
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
  - name: Type
    display: Type
    type: dropdown
    options: Custom;SideBySide;GlassMagnifier;ClassicMagnifier;PictureInPicture
    settings:
      default: Custom
  - name: mouseActivation
    display: MouseActivation
    type: checkbox
    settings:
      default: false
  - name: touchActivation
    display: touchActivation
    type: checkbox
    settings:
      default: false
  - name: inPlace
    display: Render In Place
    type: checkbox
    settings:
      default: true
      propertyCondition: Type
      condition: "SideBySide"
  - name: classNameContainer
    display: ClassName for MagnifierContainer
    type: styles
    options: ''
    settings:
      default: ''
      propertyCondition: Type
      condition: "Custom"
  - name: classNamePreview
    display: ClassName for MagnifierPreview
    type: styles
    options: ''
    settings:
      default: ''
      propertyCondition: Type
      condition: "Custom"
  - name: classNameZoom
    display: ClassName for MagnifierZoom
    type: styles
    options: ''
    settings:
      default: ''
      propertyCondition: Type
      condition: "Custom"
settings:
  - name: Packages
    value: '"react-image-magnifiers": "latest",'
children: []
*/
{% set bpr %}
import {
  Magnifier,
  GlassMagnifier,
  SideBySideMagnifier,
  PictureInPictureMagnifier,
  MOUSE_ACTIVATION,
  TOUCH_ACTIVATION,
  MagnifierContainer,
  MagnifierPreview,
  MagnifierZoom
} from "react-image-magnifiers";
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set path = element.values.path %}
{% if element.values.useAsset and element.values.useAsset != 'none' %}
  {% set asset = element.values.useAsset|assetData %}
  {% set path = '/img/' ~ asset.name %}
{% endif %}
{% if element.values.Type == 'Custom' %}
    <MagnifierContainer 
    {% if element.values.classNameContainer %}className={ {{element.values.classNameContainer}} }{% endif %}
    >
          <div>
            <MagnifierPreview
            imageSrc={{ path|textOrVariable }}
            {% if element.values.classNamePreview %}className={ {{element.values.classNamePreview}} }{% endif %}
            />
          </div>
            <MagnifierZoom
            style={ { height: "120px", width: "250px"} }
            imageSrc={{ path|textOrVariable }}
            {% if element.values.classNameZoom %}className={ {{element.values.classNameZoom}} }{% endif %}
            />
    </MagnifierContainer>
{% endif %}
{% if element.values.Type == 'SideBySide' %}
  <SideBySideMagnifier 
  imageSrc={{ path|textOrVariable }}
  imageAlt={{ path|textOrVariable }}
  largeImageSrc={{ path|textOrVariable }}
  {% if element.values.inPlace %} alwaysInPlace={ {{element.values.inPlace}} } {% endif %}
  {% if element.values.mouseActivation %} mouseActivation={MOUSE_ACTIVATION.DOUBLE_CLICK} {% endif %}
  {% if element.values.touchActivation %} touchActivation={TOUCH_ACTIVATION.DOUBLE_TAP} {% endif %}
/>
{% endif %}
{% if element.values.Type == 'ClassicMagnifier' %}
  <Magnifier
  imageSrc={{ path|textOrVariable }}
  imageAlt={{ path|textOrVariable }}
  largeImageSrc={{ path|textOrVariable }}
  {% if element.values.mouseActivation %} mouseActivation={MOUSE_ACTIVATION.DOUBLE_CLICK} {% endif %}
  {% if element.values.touchActivation %} touchActivation={TOUCH_ACTIVATION.DOUBLE_TAP} {% endif %}
/>
{% endif %}
{% if element.values.Type == 'GlassMagnifier' %}
  <GlassMagnifier
  imageSrc={{ path|textOrVariable }}
  imageAlt={{ path|textOrVariable }}
  largeImageSrc={{ path|textOrVariable }}
/>
{% endif %}