/*
path: CreateCamera.tpl
keyPath: elements/Games/CreateCamera.tpl
unique_id: 8Hzk709A
icon: f:video_call.svg
options:
  - name: cameraFollow
    display: Camera Follow
    type: text
    options: ''
    required: true
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
    required: true
  - name: worldSetBoundsY
    display: worldsetBounds (Y)
    type: text
    options: ''
    settings:
      propertyCondition: usePhysics
      condition: true
    required: true
  - name: worldSetBoundsWidth
    display: worldsetBounds Width
    type: text
    options: ''
    settings:
      propertyCondition: usePhysics
      condition: true
    required: true
  - name: worldSetBoundsHeight
    display: worldsetBounds Height
    type: text
    options: ''
    settings:
      propertyCondition: usePhysics
      condition: true
    required: true
*/
//Verifica si hay un objetivo para seguir con la cámara
this.cameras.main.startFollow(this.{{ element.values.cameraFollow }});

//Establecer el zoom de la cámara
this.cameras.main.setZoom({{ element.values.setZoom }});

//Verificar si se debe usar física
{% if element.values.usePhysics %}
this.physics.world.setBounds({{ element.values.worldSetBoundsX }}, {{ element.values.worldSetBoundsY }}, {{ element.values.worldSetBoundsWidth }}, {{ element.values.worldSetBoundsHeight }});
{% endif %}