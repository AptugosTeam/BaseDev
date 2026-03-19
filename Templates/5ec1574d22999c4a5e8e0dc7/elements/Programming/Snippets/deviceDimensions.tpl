/*
path: deviceDimensions.tpl
type: file
unique_id: deviceDimensions
icon: ico-field
sourceType: javascript
options:
  - name: variableName
    display: Store In
    type: text
children: []
*/
const {{ element.values.variableName | default('window') }} = { width: window.innerWidth, height: window.innerHeight }