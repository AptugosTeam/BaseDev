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
    settings:
      aptugoOnLoad: >-
        const element = arguments[0];
        const page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id;
        if (element.values.variableName) {
          aptugo.variables.setPageVariable(page, element.unique_id, { [element.values.variableName]: null });
        }
      aptugoOnChange: >-
        const value = arguments[0];
        const element = arguments[1];
        const page = arguments[2];
        if (element.values?.variableName) {
          aptugo.variables.setPageVariable(page, element.unique_id, { [value]: null });
        }
      active: true
  - name: defaultValue
    display: Default Value
    type: text
    options: ''
    settings:
      aptugoOnChange: >-
        const value = arguments[0];
        const element = arguments[1];
        const page = arguments[2];
        if ( element.values.variableName ) aptugo.variables.setPageVariable(page, element.unique_id, { [element.values.variableName]: value });
      active: true
  - name: typeAnnotation
    display: Type Annotation in useRef
    type: text
    options: ''
children: []
*/

{% set ph %}
const {{ element.values.variableName }} = React.useRef<{{element.values.typeAnnotation | default('any')}}>({{ element.values.defaultValue }})
{% endset %}
{{ save_delayed('ph',ph,1) }}
