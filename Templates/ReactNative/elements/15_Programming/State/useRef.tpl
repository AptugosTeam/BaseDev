/*
path: useRef.tpl
completePath: elements/Programming/useRef.tpl
type: file
unique_id: cHWrtFVW
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
    display: Type Annotation in useRef
    type: text
    options: ''
children: []
*/
{% set bpr %}
import { useRef } from 'react'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
const {{ element.values.variableName }} = useRef<{{element.values.typeAnnotation | default('any')}}>({{ element.values.defaultValue }})
{% endset %}
{{ save_delayed('ph',ph,1) }}
