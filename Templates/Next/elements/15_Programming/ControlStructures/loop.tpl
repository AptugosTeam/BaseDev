/*
path: loop.tpl
type: file
unique_id: IRpM1eNV
icon: ico-loop-1
sourceType: javascript
color: rgb(255, 192, 128)
order: 2
helpText: Allows you to loop a variable and render child elements
options:
  - name: variable
    display: Source Variable
    type: variable
    options: ''
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
  - name: sortsource
    display: Sort source values (a,b)
    type: code
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
    type: code
    options: ''
  - name: usefragment
    display: Do Not Use Fragment
    type: checkbox
    options: ''
    advanced: true
  
children: []
*/
{% set addExtra = '' %}
{% if element.values.filtersource %}
{% set addExtra = '.filter(tmp => tmp.' ~ element.values.filtersource ~ ')' %}
{% endif %}
{% if not element.values.filtersource and element.values.filterFunction%}
  {% set addExtra = '.filter(tmp => ' ~ (element.values.filterFunction|functionOrCall) ~ ')' %}
{% endif %}
{% if element.values.sortsource %}
{% set addExtra = addExtra ~ '.sort((a,b) => ' ~ element.values.sortsource ~ ')' %}
{% endif %}
{ {{ element.values.variable }}{{ addExtra }}?.map(({{ element.values.variablename | default('item') }},{{ element.values.indexName | default('index') }}) => {
{% if element.values.code %}{{ element.values.code }}{% endif %}
    return ({% if not element.values.usefragment %}<React.Fragment key={ '{{ element.unique_id }}_' + {{ element.values.indexName | default('index') }}}>{% endif %}{{ content | raw }}{% if not element.values.usefragment %}</React.Fragment>{% endif %})
})}