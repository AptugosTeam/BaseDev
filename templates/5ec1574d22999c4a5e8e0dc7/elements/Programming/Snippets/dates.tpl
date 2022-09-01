/*
path: dates.tpl
completePath: elements/Programming/Snippets/dates.tpl
type: file
unique_id: dates1eNV
icon: f:dates.svg
sourceType: javascript
helpText: Converts date strings into usable dates
options:
  - name: variable
    display: Source Variable
    type: variable
    options: ''  
children: []
*/
new Date({{ element.values.variable | textOrVariable }}).getHours()
