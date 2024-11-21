/*
path: SceneObject.tpl
keyPath: elements/Games/Assets/SceneObject.tpl
unique_id: 9OMf0rM0
options:
  - name: objectType
    display: Object Type
    type: dropdown
    options: return [['rectangle','Rectangle'],['container','Container'],['zone','Zone']]
    settings:
      default: rectangle
  - name: X
    display: X
    type: text
    settings:
      propertyCondition: objectType
      condition: rectangle,container,zone
  - name: Y
    display: Y
    type: text
    settings:
      propertyCondition: objectType
      condition: rectangle,container,zone
  - name: width
    display: Width
    type: text
    settings:
      propertyCondition: objectType
      condition: rectangle,zone
  - name: height
    display: Height
    type: text
    settings:
      propertyCondition: objectType
      condition: rectangle,zone
  - name: origin
    display: Origin
    type: text
    settings:
      propertyCondition: objectType
      condition: rectangle,zone
  - name: strokeStyle
    display: Stroke Style (width, color, alpha)
    type: text
    settings:
      propertyCondition: objectType
      condition: rectangle
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
*/
this.add.{{ element.values.objectType|default('rectangle') }}(
  {{ element.values.X }},
  {{ element.values.Y }}
  {% if element.values.width %}, {{ element.values.width }}{% endif %}
  {% if element.values.height %}, {{ element.values.height }}{% endif %}
  {% if element.values.childs %}, {{ element.values.childs }}{% endif %}
)
{% if element.values.objectType == 'zone' %}
  .setDepth(-1)
  .setRectangleDropZone({{ element.values.width }}, {{ element.values.height }})
{% endif %}
{% if element.values.origin is defined %}.setOrigin({{ element.values.origin }}){% endif %}
{% if element.values.strokeStyle %}.setStrokeStyle({{ element.values.strokeStyle }}){% endif %}
{% if element.values.data is defined %}.setData({{ element.values.data }}){% endif %}
