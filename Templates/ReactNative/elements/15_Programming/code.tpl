/*
path: code.tpl
type: file
unique_id: 7nq5ukbU
icon: ico-code
sourceType: javascript
helpText: Insert raw custom code exactly as written into the generated output
options:
  - name: code
    display: Code
    helpText: Literal code snippet to inject at the current render location
    type: code
    options: ''
children: []
*/
{{ element.values.code | raw }}
