/*
path: getData.tpl
keyPath: elements/Games/State/getData.tpl
unique_id: EIX2PTOJ
icon: ico-get-data
options:
  - name: object
    display: Source Object
    type: text
  - name: dataName
    display: Source Data 
    type: text
  - name: destinationVariable
    display: Destination Variable
    type: text
*/
const {{ element.values.destinationVariable }} = {{ element.values.object }}.getData({{ element.values.dataName | textOrVariableInCode }})
