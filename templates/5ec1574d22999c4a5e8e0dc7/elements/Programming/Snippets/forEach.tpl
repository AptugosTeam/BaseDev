/*
path: forEach.tpl
completePath: elements/Programming/Snippets/forEach.tpl
type: file
unique_id: fore1eNV
icon: f:forEach.svg
sourceType: javascript
helpText: Allows you to loop a variable and render child code
options:
  - name: variable
    display: Source Variable
    type: variable
    options: ''
    settings:
      aptugoOnLoad: |-
        console.log('shooting onload')
        const allVariables = aptugo.variables.variables
        const element = arguments[0];
        const page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id;
        const usesVariable = element.values.variable
        const newLocalVarName = element.values.variablename || 'item'
        finalVarsToAdd = { [newLocalVarName]: allVariables.find(thevar => thevar.name === usesVariable).value }
        aptugo.variables.setElementVariable(element.unique_id, finalVarsToAdd);
      active: true
  - name: variablename
    display: Variable name in which each item will be put in
    type: text
    settings:
      default: 'item'
  - name: indexname
    display: Variable name for the index
    type: text
    settings:
      default: 'index'
      active: true
  - name: disableDefaultVariable
    display: Disable Default Variable
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: filtersource
    display: Condition to filter source values
    type: text
    advanced: true
  - name: code
    display: Code
    type: code
    options: ''
  
children: []
*/
{% if element.values.filtersource %}
{% set addExtra = '.filter(tmp => tmp.' ~ element.values.filtersource ~ ')' %}
{% endif %}
{{ element.values.variable }}{{ addExtra }}.forEach(({{ element.values.variablename | default('item') }},{% if not element.values.disableDefaultVariable %}{{ element.values.indexname | default('index') }}{% endif %}) => {
{% if element.values.code %}
  {{ element.values.code }}
{% endif %}
{{ content | raw }}
})