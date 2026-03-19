/*
path: PhaserContainer.tpl
keyPath: elements/Games/PhaserContainer.tpl
unique_id: eQuSMzHg
icon: f:package_2.svg
options:
  - name: positionX
    display: Position X
    type: text
    options: ''
  - name: positionY
    display: Position Y
    type: text
    options: ''
*/
// this.add.container({{ element.values.positionX }}, {{ element.values.positionY }}).add([
//   {% for child in element.children %}
//     {{ child.rendered }},
//   {% endfor %}
// ])