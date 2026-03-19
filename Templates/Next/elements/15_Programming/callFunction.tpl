/*
path: callFunction.tpl
type: file
unique_id: r0mQRZ4N2
icon: ico-function2
sourceType: javascript
order: 6
helpText: Calls a function
options:
  - name: functionName
    display: Function to Call
    type: variable
    options: ''
  - name: functionParameters
    display: Parameters
    type: text
    options: ''
  - name: objectProperty
    display: Belongs to an object
    type: checkbox
    advanced: true
children: []
*/
{% if element.values.objectProperty %}this.{% endif %}
{{ element.values.functionName }}({{ element.values.functionParameters }})