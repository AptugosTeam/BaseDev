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
  - name: classNameContainer
    display: ClassName for MagnifierContainer
    type: styles
  - name: classNamePreview
    display: ClassName for MagnifierPreview
    type: styles
  - name: classNameZoom
    display: ClassName for MagnifierZoom
    type: styles
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
