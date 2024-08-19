/*
path: SceneVariableMap.tpl
keyPath: elements/Games/Maps/SceneVariableMap.tpl
unique_id: G8nZ025J
icon: f:pivot_table_chart.svg
options:
  - name: nameVariableA
    display: Variable A
    type: text
  - name: valueA
    display: Variable Value A
    type: text
    default: ''
    settings: 
      propertyCondition: nameVariableA
      condition: true
      active: true
  - name: typeA
    display: Variable Type A
    type: dropdown
    options: >-
      return [['any', 'Any'],['number', 'Number'],['Array<any>', 'Array'],['Boolean', 'Boolean']]
      default: any
    settings: 
      propertyCondition: nameVariableA
      condition: true
      active: true
  - name: nameVariableB
    display: Variable B Don't touch unless you want trouble!
    type: text
    advanced: true
  - name: valueB
    display: Variable Value B
    type: text
    default: ''
    settings: 
      propertyCondition: nameVariableA
      condition: true
      active: true
  - name: typeB
    display: Variable Type B
    type: dropdown
    options: >-
      return [['any', 'Any'],['number', 'Number'],['Array<any>', 'Array'],['Boolean', 'Boolean']]
      default: any
    settings: 
      propertyCondition: nameVariableB
      condition: true
      active: true    
*/
{% set varNameA = element.values.nameVariableA | friendly %}
{% set varValueA = element.values.valueA %}
{% set typeA = element.values.typeA | default('any') %}

{% set varNameB = element.values.nameVariableB | default('groundLayer') | friendly %}
{% set varValueB = element.values.valueB %}
{% set typeB = element.values.typeB | default('any') %}

{% set variableDeclarations %}
{{ varNameA }}:{{ typeA }}
{{ varNameB }}:{{ typeB }}
{% endset %}
{{ save_delayed('variableDeclarations', variableDeclarations) }}

{% if typeA == 'Boolean' %}
this.{{ varNameA }} = {{ varValueA | lower }}
{% elseif typeA == 'Array<any>' %}
this.{{ varNameA }} = {{ varValueA }}
{% else %}
this.{{ varNameA }} = {% if element.children %}{{ content | raw }}{% else %}{{ varValueA | textOrVariableInCode }}{% endif %}
{% endif %}

{% if typeB == 'Boolean' %}
this.{{ varNameB }} = {{ varValueB | lower }}
{% elseif typeB == 'Array<any>' %}
this.{{ varNameB }} = {{ varValueB }}
{% else %}
this.{{ varNameB }} = {% if element.children %}{{ content | raw }}{% else %}{{ varValueB | textOrVariableInCode }}{% endif %}
{% endif %}