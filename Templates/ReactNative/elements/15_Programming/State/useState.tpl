/*
path: useState.tpl
completePath: elements/Programming/useState.tpl
type: file
unique_id: cHWAkFVW
icon: ico-use-state
options:
  - name: variableName
    display: Variable Name
    type: text
    options: ''
  - name: defaultValue
    display: Default Value
    type: text
    options: ''
  - name: typeAnnotation
    display: Type Annotation in useState
    type: text
    options: ''
children: []
*/
{% set ph %}
const [{{ element.values.variableName }}, set{{ element.values.variableName }}] = React.useState<{{element.values.typeAnnotation | default('any')}}>({{ element.values.defaultValue }})
{% endset %}
{{ save_delayed('ph',ph,1) }}
