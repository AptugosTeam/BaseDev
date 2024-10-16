/*
path: updateStateVariable.tpl
completePath: elements/Programming/Snippets/updateStateVariable.tpl
type: file
unique_id: updateStateVariable
icon: f:../../Z-Icons/updateStateVariable.svg
sourceType: javascript
helpText: Updates the value of a state variable
options:
  - name: variable
    display: Variable to Update
    type: variable
    options: ''
  - name: newvalue
    display: New Value
    type: variable
    options: ''  
children: []
*/
set{{ element.values.variable }}({{ element.values.newvalue}})
