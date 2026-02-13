/*
path: CreateCamera.tpl
keyPath: elements/Games/CreateCamera.tpl
unique_id: 8Hzk709A
icon: ico-camera
options:
  - name: cameraFollow
    display: Camera Follow
    type: text
    options: ''
  - name: fadeIn
    display: FadeIn Effect (ms)
    type: text
    options: ''
  - name: setZoom
    display: Set Zoom
    type: text
    options: ''
  - name: usePhysics
    display: Use Physics World
    type: checkbox
    options: ''
  - name: worldSetBoundsX
    display: worldsetBounds (X)
    type: text
    options: ''
    settings:
      propertyCondition: usePhysics
      condition: true
  - name: worldSetBoundsY
    display: worldsetBounds (Y)
    type: text
    options: ''
    settings:
      propertyCondition: usePhysics
      condition: true
  - name: worldSetBoundsWidth
    display: worldsetBounds Width
    type: text
    options: ''
    settings:
      propertyCondition: usePhysics
      condition: true
  - name: worldSetBoundsHeight
    display: worldsetBounds Height
    type: text
    options: ''
    settings:
      propertyCondition: usePhysics
      condition: true
*/
this.cameras.main
{% if element.values.cameraFollow %}
  .startFollow(this.{{ element.values.cameraFollow }})
{% endif %}
{% if element.values.setZoom %}
  .setZoom({{ element.values.setZoom }})
{% endif %}
{% if element.values.fadeIn %}
  .fadeIn({{ element.values.fadeIn }})
{% endif %}

{% if element.values.usePhysics %}
  this.physics.world.setBounds({{ element.values.worldSetBoundsX }}, {{ element.values.worldSetBoundsY }}, {{ element.values.worldSetBoundsWidth }}, {{ element.values.worldSetBoundsHeight }})
{% endif %}