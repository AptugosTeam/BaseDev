/*
path: loop.tpl
type: file
unique_id: IRpM1eNV
icon: f:loop.svg
sourceType: javascript
helpText: Allows you to loop a variable and render child elements
options:
  - name: variable
    display: Source Variable
    type: variable
    options: ''
    settings:
      aptugoOnLoad: |-
        const allVariables = aptugo.variables.variables
        const element = arguments[0];
        const page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id;
        const usesVariable = element.values.variable
        const newLocalVarName = element.values.variablename || 'item'
        const foundVariable = allVariables.find(thevar => thevar.name === usesVariable)
        finalVarsToAdd = { [newLocalVarName]: foundVariable ? foundVariable.value : ''}
        aptugo.variables.setElementVariable(element.unique_id, finalVarsToAdd);
      active: true
  - name: variablename
    display: Variable name in which each item will be put in
    type: text
    settings:
      default: 'item'
  - name: indexName
    display: Alternative index name
    type: text
    settings:
      default: 'index'
    advanced: true
  - name: filtersource
    display: Condition to filter source values
    type: text
    advanced: true
  - name: filterFunction
    display: Filter function
    type: function
    options: ''
    advanced: true
  - name: code
    display: Code
    type: text
    options: ''
  - name: usefragment
    display: Do Not Use Fragment
    type: checkbox
    options: ''
    advanced: true
  
children: []
*/
{% if element.values.filtersource %}
{% set addExtra = '.filter(tmp => tmp.' ~ element.values.filtersource ~ ')' %}
{% endif %}
{% if not element.values.filtersource and element.values.filterFunction%}
{% set addExtra = '.filter(tmp => ' ~ element.values.filterFunction ~ ')' %}
{% endif %}
{ {{ element.values.variable }}{{ addExtra }}.map(({{ element.values.variablename | default('item') }},{{ element.values.indexName | default('index') }}) => {
{% if element.values.code %}{{ element.values.code }}{% endif %}
    return {% if not element.values.usefragment %}<React.Fragment key={ '{{ element.unique_id }}_' + {{ element.values.indexName | default('index') }}}>{% endif %}{{ content | raw }}{% if not element.values.usefragment %}</React.Fragment>{% endif %}
})}