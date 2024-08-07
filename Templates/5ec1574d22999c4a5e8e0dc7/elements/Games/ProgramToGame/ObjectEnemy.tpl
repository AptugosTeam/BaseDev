/*
path: ObjectEnemy.tpl
keyPath: elements/ProgramToGame/ObjectEnemy.tpl
unique_id: IcPG18JL
icon: f:asset-loader.svg
options:
  - name: variableName
    display: Variable Name Enemy
    type: text
  - name: asset
    display: Asset to display
    type: text
    options: ''
  - name: setX
    display: Set (X)
    type: text
    options: ''
  - name: setY
    display: Set (Y)
    type: text
    options: ''
  - name: setScaleX
    display: Set Scale (X)
    type: text
    options: ''
  - name: setScaleY
    display: Set Scale (Y)
    type: text
    options: ''
*/
this.{{ element.values.variableName }}.create({{ element.values.setX }}, {{ element.values.setY }},'{{ element.values.asset}}').setScale({{element.values.setScaleX | default(1)}}, {{element.values.setScaleY | default(1)}}).setData('id', i)