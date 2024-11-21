/*
path: storeVariable.tpl
keyPath: elements/Programming/storeVariable.tpl
unique_id: 3a3PEaZR
icon: ico-define-variable
options:
  - name: variableName
    display: Variable Name
    type: text
    options: ''
  - name: variableValue
    display: Value
    type: text
    options: ''
*/
localStorage.setItem('{{ element.values.variableName }}', {{ element.values.variableValue}} )