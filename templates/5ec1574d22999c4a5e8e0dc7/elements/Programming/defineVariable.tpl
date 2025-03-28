/*
path: defineVariable.tpl
completePath: elements/Programming/defineVariable.tpl
type: file
unique_id: E3aMS2PI
icon: ico-define-variable
helpText: Allows you to define a variable that will be used later
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
          aptugo.variables.setPageVariable(page, element.unique_id, { [element.values.variableName]: element.values ? element.values.variableValue : null });
        }
      aptugoOnChange: >-
        const value = arguments[0];
        const element = arguments[1];
        const page = arguments[2];
        if (element.values?.variableName) {
          aptugo.variables.setPageVariable(page, element.unique_id, { [value]: element.values ? element.values.variableValue : null });
        }
      active: true
  - name: variableValue
    display: Value
    type: text
    options: ''
    settings:
      aptugoOnChange: >-
        const value = arguments[0];
        const element = arguments[1];
        const page = arguments[2];
        if ( element.values.variableName ) aptugo.variables.setPageVariable(page, element.unique_id, { [element.values.variableName]: value });
      active: true
  - name: willbeModified
    display: Will it be modified?
    type: checkbox
    options: ''
  - name: serverSide
    display: Back-End Variable
    type: checkbox
  - name: type
    display: Type Definition
    type: text
    advanced: true
  - name: priority
    display: Priority
    type: dropdown
    options: Normal;High;Low
    advanced: true
settings:
  - name: ServerAddenum
    value: |-
      {% if element.values.serverSide %}
        {% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}
      {% endif %}
sourceType: javascript
children: []
*/

{% if not element.values.serverSide %}
  {% if element.values.willbeModified %}
    {% set variableDeclaration %}let {{ element.values.variableName }}{% if element.values.type %}:{{ element.values.type }}{% endif %}{% if element.values.variableValue %} = {{ element.values.variableValue|default(content | raw)}}{% endif %}{% endset %}
  {% else %}
    {% set variableDeclaration %}const {{ element.values.variableName }}{% if element.values.type %}:{{ element.values.type }}{% endif %} = {{ element.values.variableValue|default(content | raw)}}{% endset %}
  {% endif %}

  {% if element.values.priority %}
    {{ save_delayed('ph', variableDeclaration, 1) }}
  {% else %}
    {{ variableDeclaration }}
  {% endif %}
{% endif %}