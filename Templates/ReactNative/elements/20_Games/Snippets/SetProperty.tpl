/*
path: SetProperty.tpl
keyPath: elements/20_Games/Snippets/SetProperty.tpl
unique_id: 5wo3ZyJf
options:
  - name: property
    display: Property
    type: dropdown
    options: >-
      return [
        ['Alpha','Alpha'],
        ['Crop','Crop'],
        ['Depth','Depth'],
        ['DisplayOrigin','Display Origin'],
        ['fillStyle','Fill Style'],
        ['fillRect','Fill Rect'],
        ['lineStyle','Line Style'],
        ['Offset','Offset'],
        ['Origin','Origin'],
        ['Position','Position'],
        ['Scale','Scale'],
        ['ScrollFactor','Scroll Factor'],
        ['Size','Size'],
        ['Text','Text'],
        ['TintFill','Tint Fill'],
        ['removeFromDisplayList','Remove From Display List']
      ]
    settings:
      default: Origin
  - name: X
    display: X
    type: text
    settings:
      propertyCondition: objectType
      condition: Origin,DisplayOrigin,ScrollFactor,Size,Offset,fillRect,Position
  - name: Y
    display: Y
    type: text
    settings:
      propertyCondition: objectType
      condition: Origin,DisplayOrigin,ScrollFactor,Size,Offset,fillRect,Position
  - name: width
    display: Width
    type: text
    settings:
      propertyCondition: objectType,fillRect,lineStyle
      condition: Crop
  - name: height
    display: Height
    type: text
    settings:
      propertyCondition: objectType,fillRect
      condition: Crop
  - name: value
    display: Value
    type: text
    settings:
      propertyCondition: objectType
      condition: Depth,Scale,Alpha,Text
  - name: color
    display: Color
    type: text
    settings:
      propertyCondition: objectType
      condition: fillStyle,tintFill,lineStyle
  - name: alpha
    display: Alpha Value
    type: text
    settings:
      propertyCondition: objectType
      condition: fillStyle,lineStyle
  - name: variable
    display: Apply to variable
    type: text
    advanced: true
  - name: inthis
    display: Apply to "this"
    type: checkbox
    advanced: true
*/
{% set useSet = true %}
{% if element.values.property == 'fillStyle' or element.values.property == 'lineStyle' or element.values.property == 'fillRect' or element.values.property == 'removeFromDisplayList' %}
  {% set useSet = false %}
{% endif %}
{% if element.values.inthis %}this{% endif %}{% if element.values.variable is not empty %}{{ element.values.variable }}{% endif %}.{% if useSet %}set{% endif %}{{ element.values.property }}(
  {% if element.values.value is not empty %}{{ element.values.value }}{% endif %}
  {% if element.values.X is not empty %}{{ element.values.X }}{% endif %}
  {% if element.values.Y is not empty %}, {{ element.values.Y }}{% endif %}
  {% if element.values.width is not empty %}{% if element.values.property != 'lineStyle' %}, {% endif %}{{ element.values.width }}{% endif %}
  {% if element.values.height is not empty %}, {{ element.values.height }}{% endif %}
  {% if element.values.color is not empty %}{% if element.values.property == 'lineStyle' %}, {% endif %} {{ element.values.color }}{% endif %}
  {% if element.values.alpha is not empty %}, {{ element.values.alpha }}{% endif %}
){{ content | raw }}