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
    variableName: count → setter: setcount
    variableName: user → setter: setuser
    variableName: isOpen → setter: setisOpen
    variableName: selectedItem → setter: setselectedItem

    IMPORTANT RULES:
    - NEVER capitalize anything
    - NEVER change casing
    - NEVER transform the variable name
    - The setter is literally "set" + variableName exactly as written

    Correct:
    setcount(5)
    setuser({ name: "John" })
    setisOpen(true)

    Incorrect:
    setCount(5)
    Setcount(5)
    SETCOUNT(5)

    The setter must match EXACTLY what is generated in code.
options:
  - name: variableName
    display: Variable Name
    type: text
    options: ''
  - name: defaultValue
    display: Default Value
    type: text
    options: ''
  - name: renderInPlace
    display: Render In Place
    type: checkbox
    advanced: true
  - name: type
    display: Type Definition
    type: text
    advanced: true
children: []
*/
{% set ph %}
const [{{ element.values.variableName }}, set{{ element.values.variableName }}] = React.useState<{{ element.values.type|default('any') }}>({% if element.children %}{{ content | raw }}{% else %}{{ element.values.defaultValue }}{% endif %})
{% endset %}
{% if element.values.renderInPlace %}
  {{ ph }}
{% else %}
  {{ save_delayed('ph',ph,1) }}
{% endif %}
