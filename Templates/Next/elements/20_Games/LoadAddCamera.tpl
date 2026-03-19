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
  - name: setBoundsHeight
    display: Set Bounds Height
    type: text
    options: ''
*/
{% if element.values.setBoundsX is defined
  and element.values.setBoundsY is defined 
  and element.values.setBoundsWidth is defined
  and element.values.setBoundsHeight is defined
%}
  this.cameras.main.setBounds({{ element.values.setBoundsX }},{{ element.values.setBoundsY }},{{ element.values.setBoundsWidth }},{{ element.values.setBoundsHeight }});
{% endif %}