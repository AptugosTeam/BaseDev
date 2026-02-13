/*
path: LoopGame.tpl
keyPath: elements/ProgramToGame/LoopGame.tpl
unique_id: 8Hzl16JL
icon: ico-iterate
options:
  - name: variableName
    display: Variable Name
    type: text
    options: ''
    required: true
  - name: itemInterate
    display: Item Interate
    type: text
    options: ''
*/
{% if element.values.variableName is defined %}
this.{{ element.values.variableName }}.children.iterate(({{ element.values.itemInterate }}) => {
 {{ content | raw }}});
{% endif %}