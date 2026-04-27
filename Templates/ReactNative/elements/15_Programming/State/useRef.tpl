/*
path: useRef.tpl
completePath: elements/Programming/useRef.tpl
type: file
unique_id: cHWrtFVW
helpText: Create a React ref to keep a mutable value or component reference without triggering rerenders
options:
  - name: variableName
    display: Variable Name
    helpText: Name of the ref variable that will be created
    type: text
    options: '' 
  - name: defaultValue
    display: Default Value
    helpText: Initial value assigned to the ref current property
    type: text
    options: ''
  - name: typeAnnotation
    display: Type Annotation in useRef
    helpText: Optional TypeScript type used for the ref generic annotation
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
