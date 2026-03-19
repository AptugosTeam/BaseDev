/*
path: LoadAddCamera.tpl
keyPath: elements/Games/LoadAddCamera.tpl
unique_id: 8Hzk604A
icon: f:tamper_detection_on.svg
options:
  - name: setBoundsX
    display: Set Bounds (X)
    type: text
    options: ''
  - name: setBoundsY
    display: Set Bounds (Y)
    type: text
    options: ''
  - name: setBoundsWidth
    display: Set Bounds Width
    type: text
    options: ''
    required: true
  - name: setBoundsHeight
    display: Set Bounds Height
    type: text
    options: ''
    required: true
*/

{% set setBoundsX = element.values.setBoundsX | default('0') %}
{% set setBoundsY = element.values.setBoundsY | default('0') %}

{% if element.values.setBoundsWidth is defined and element.values.setBoundsHeight is defined%}

// Establecer límites para la cámara principal en la precarga
this.cameras.main.setBounds({{ setBoundsX }}, {{ setBoundsY }}, {{ element.values.setBoundsWidth }}, {{ element.values.setBoundsHeight }});
{% endif %}