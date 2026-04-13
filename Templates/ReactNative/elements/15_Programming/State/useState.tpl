/*
path: useState.tpl
completePath: elements/Programming/useState.tpl
type: file
unique_id: cHWAkFVW
icon: ico-use-state
helpText: >
  Creates a React state variable using useState.

    The setter function name is ALWAYS:
    set + EXACT variableName (unchanged, same casing).

    DO NOT modify the variable name in any way when building the setter.

    Examples:
    variableName: count -> setter: setcount
    variableName: user -> setter: setuser
    variableName: isOpen -> setter: setisOpen
    variableName: selectedItem -> setter: setselectedItem

    IMPORTANT RULES:
    - NEVER capitalize anything
    - NEVER change casing
    - NEVER transform the variable name
    - The setter is literally "set" + variableName exactly as written

    The setter must match EXACTLY what is generated in code.
options:
  - name: variableName
    display: Variable Name
    helpText: Name of the React state variable. The generated setter is always set + variableName exactly as written.
    type: text
    options: ''
  - name: defaultValue
    display: Default Value
    helpText: Initial state value passed to useState
    type: text
    options: ''
  - name: typeAnnotation
    display: Type Annotation in useState
    helpText: Optional TypeScript generic type used in React.useState<...>
    type: text
    options: ''
children: []
*/
{% set ph %}
const [{{ element.values.variableName }}, set{{ element.values.variableName }}] = React.useState<{{element.values.typeAnnotation | default('any')}}>({{ element.values.defaultValue }})
{% endset %}
{{ save_delayed('ph',ph,1) }}
