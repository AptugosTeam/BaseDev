/*
path: SceneVariable.tpl
keyPath: elements/Games/SceneVariable.tpl
unique_id: G5nZ0pNf
icon: ico-variable
options:
  - name: name
    display: Variable Name
    type: text
  - name: value
    display: Variable Value
    type: text
  - name: type
    display: Variable Type
    type: dropdown
    options: >-
      return [['any', 'Any'],['number', 'Number'],['Array<any>', 'Array'],['Boolean', 'Boolean']]
*/
{% set varName = element.values.name | friendly %}
{% set varValue = element.values.value %}
{% set variableDeclarations %}
{{ varName }}:{{ element.values.type|default('any') }}
{% endset %}
{{ save_delayed('variableDeclarations', variableDeclarations) }}

{% if element.values.type == 'Boolean' %}
this.{{ varName }} = {{ varValue | lower }}
{% elseif element.values.type == 'Array<any>' %}
this.{{ varName }} = {{ varValue }}
{% else %}
this.{{ varName }} = {% if element.children %}{{ content | raw }}{% else %}{{ varValue | textOrVariableInCode }}{% endif %}
{% endif %}