/*
path: useRef.tpl
completePath: elements/Programming/useRef.tpl
type: file
unique_id: useRef
icon: ico-use-ref
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
  - name: appendCurrent
    display: Append current
    type: checkbox
    options: ''
  - name: renderInPlace
    display: Render In Place
    type: checkbox
    advanced: true
children: []
*/

{% set ph %}
const {{ element.values.variableName }} = React.useRef<{{element.values.typeAnnotation | default('any')}}>({{ element.values.defaultValue }}){% if element.values.appendCurrent %}.current{% endif %}
{% endset %}
{% if element.values.renderInPlace %}
  {{ ph }}
{% else %}
  {{ save_delayed('ph',ph,1) }}
{% endif %}
