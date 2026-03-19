/*
path: SceneObject.tpl
keyPath: elements/Games/Assets/SceneObject.tpl
unique_id: 9OMf0rM0
options:
  - name: objectType
    display: Object Type
    type: dropdown
    options:  >-
      return [
        ['bitmapText','Bitmap Text'],
        ['container','Container'],
        ['ellipse','Ellipse'],
        ['graphics','Graphics'],
        ['group','Group'],
        ['image','Image'],
        ['rectangle','Rectangle'],['sprite','Sprite'],['tileSprite','Tile Sprite'],['zone','Zone']
      ]
    settings:
      default: sprite
  - name: X
    display: X
    type: text
    settings:
      propertyCondition: objectType
      condition: rectangle,container,zone,bitmapText,tileSprite,sprite,image,ellipse
  - name: Y
    display: Y
    type: text
    settings:
      propertyCondition: objectType
      condition: rectangle,container,zone,bitmapText,tileSprite,sprite,image,ellipse
  - name: texture
    display: Texture
    type: text
    settings:
      propertyCondition: objectType
      condition: sprite,image,tileSprite
  - name: Physics
    display: Use Physics?
    type: checkbox
    settings:
      propertyCondition: objectType
      condition: sprite,group
  - name: font
    display: Font
    type: text
    settings:
      propertyCondition: objectType
      condition: bitmapText
  - name: text
    display: Text
    type: text
    settings:
      propertyCondition: objectType
      condition: bitmapText
  - name: size
    display: Size
    type: text
    settings:
      propertyCondition: objectType
      condition: bitmapText
  - name: width
    display: Width
    type: text
    settings:
      propertyCondition: objectType
      condition: rectangle,zone,tileSprite,ellipse
  - name: height
    display: Height
    type: text
    settings:
      propertyCondition: objectType
      condition: rectangle,zone,tileSprite,ellipse
  - name: origin
    display: Origin
    type: text
    settings:
      propertyCondition: objectType
      condition: rectangle,zone,bitmapText
  - name: strokeStyle
    display: Stroke Style (width, color, alpha)
    type: text
    settings:
      propertyCondition: objectType
      condition: rectangle
  - name: fillColor
    display: Fill Color
    type: text
    settings:
      propertyCondition: objectType
      condition: ellipse
  - name: childs
    display: Child Objects
    type: text
    settings:
      propertyCondition: objectType
      condition: container
  - name: data
    type: code
    settings:
      propertyCondition: objectType
      condition: zone
  - name: anotherVariable
    display: Scene is in another variable (not this)
    type: text
*/
this{% if element.values.anotherVariable %}.{{ element.values.anotherVariable }}{% endif %}{% if element.values.Physics %}.physics{% endif %}.add.{{ element.values.objectType|default('sprite') }}(
  {% if element.values.X is not empty %}{{ element.values.X }}{% endif %}
  {% if element.values.Y is not empty %}, {{ element.values.Y }}{% endif %}
  {% if element.values.font %}, {{ element.values.font | textOrVariableInCode }}{% endif %}
  {% if element.values.text %}, {{ element.values.text | textOrVariableInCode }}{% endif %}
  {% if element.values.size %}, {{ element.values.size }}{% endif %}
  {% if element.values.width %}, {{ element.values.width }}{% endif %}
  {% if element.values.height %}, {{ element.values.height }}{% endif %}
  {% if element.values.fillColor %}, {{ element.values.fillColor }}{% endif %}
  {% if element.values.childs %}, [{{ element.values.childs }}]{% endif %}
  {% if element.values.texture %}, {{ element.values.texture | textOrVariableInCode }}{% endif %}
){% if element.values.objectType == 'zone' %}
  .setDepth(-1)
  .setRectangleDropZone({{ element.values.width }}, {{ element.values.height }})
{% endif %}{% if element.values.origin is defined %}.setOrigin({{ element.values.origin }}){% endif %}
{% if element.values.strokeStyle %}.setStrokeStyle({{ element.values.strokeStyle }}){% endif %}
{% if element.values.data is defined %}.setData({{ element.values.data }}){% endif %}{{ content | raw }}