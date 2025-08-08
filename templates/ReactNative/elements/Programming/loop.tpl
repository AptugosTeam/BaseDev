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
    display: Variable name for each item
    type: text
    settings:
      default: 'item'
  - name: indexname
    display: Variable name for index
    type: text
    settings:
      default: 'index'
  - name: addReturnWrapper
    display: Add return and Fragment wrapper
    type: checkbox
    settings:
      default: true
  - name: code
    display: Code
    type: text
    options: ''
  - name: filtersource
    display: Condition to filter source values
    type: text
    advanced: true
  - name: filterFunction
    display: Filter function
    type: function
    options: ''
    advanced: true
  
children: []
*/
{# Logic to prepare the array filtering #}
{% set addExtra = '' %}
{% if element.values.filtersource %}
{% set addExtra = '.filter(tmp => tmp.' ~ element.values.filtersource ~ ')' %}
{% elseif element.values.filterFunction%}
{% set addExtra = '.filter(' ~ element.values.filterFunction ~ ')' %}
{% endif %}
{ {{ element.values.variable }}{{ addExtra }}.map(({{ element.values.variablename | default('item') }}, {{ element.values.indexname | default('index') }}) => {
    {% if element.values.code %}
    {{ element.values.code }}
    {% endif %}
    {% if element.values.addReturnWrapper is not defined or element.values.addReturnWrapper %}
    return <React.Fragment key={ {{ element.values.indexname | default('index') }} }>{{ content | raw }}</React.Fragment>
    {% else %}
    {{ content | raw }}
    {% endif %}
})}