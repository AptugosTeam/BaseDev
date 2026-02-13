/*
path: CreateGroup.tpl
keyPath: elements/Games/Snippets/CreateGroup.tpl
unique_id: edDctODG
icon: ico-group
options:
  - name: groupName
    display: Group Name
    type: text
    options: ''
    required: true
  - name: addPhysics
    display: Add Physics
    type: checkbox
    options: ''
*/

{% set varName = element.values.groupName | friendly %}
{% set variableDeclarations %}
{{ varName }}:{{ ('any') }}
{% endset %}
{{ save_delayed('variableDeclarations', variableDeclarations) }}

this.{{ element.values.groupName }}=
{% if element.values.addPhysics %}
  this.physics.add.group(
    {{ content | raw }}
  );
{% else %}
  this.add.group(
    {{ content | raw }}
  );
{% endif %}