/*
path: AddToStaticGroup.tpl
keyPath: elements/Games/Snippets/AddToStaticGroup.tpl
unique_id: edDct24M
icon: ico-group-add
options:
  - name: variableNameGroup
    display: Variable Name Group
    type: text
    options: ''
*/

{% set varName = element.values.variableNameGroup | friendly %}
{% set variableDeclarations %}
{{ varName }}:{{ ('any') }}
{% endset %}
{{ save_delayed('variableDeclarations', variableDeclarations) }}

this.{{element.values.variableNameGroup}} = this.physics.add.staticGroup();