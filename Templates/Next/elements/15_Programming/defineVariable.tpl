/*
path: defineVariable.tpl
completePath: elements/Programming/defineVariable.tpl
type: file
unique_id: E3aMS2PI
order: 2
icon: ico-variable
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
  - name: renderElsewhere
    display: Render Elsewhere
    type: dropdown
    options: >-
      return [ ['inPlace','Render in place'],
      ...aptugo.store.getState().application.tables.map(({ unique_id, singleName }) => [
      aptugo.pageUtils.friendly(singleName).toLowerCase() + '_File_Start',
      'Begining of endpoints for ' + singleName
      ]) ]
    advanced: true
  - name: type
    display: Type Definition
    type: text
    advanced: true
  - name: objectProperty
    display: Belongs to an object
    type: checkbox
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
  {% set variableContent %}
    {% set prev = 'const ' %}
    {% if element.values.objectProperty %}
      {% set prev = 'this.' %}
      {% set variableDeclarations %}
        {{ element.values.variableName }}:{{ element.values.type|default('any') }}
      {% endset %}
      {{ save_delayed('variableDeclarations', variableDeclarations) }}
    {% elseif element.values.willbeModified %}{% set prev = 'let ' %}
    {% endif %}
    {{prev}}{{ element.values.variableName }}{% if element.values.type %}:{{ element.values.type }}{% endif %} = {{ element.values.variableValue|default(content | raw)}}
  {% endset %}
  {% if element.values.renderElsewhere and element.values.renderElsewhere != 'inPlace' %}
    {{ add_setting(element.values.renderElsewhere, variableContent) }}
  {% else %}
    {{ variableContent }}
  {% endif %}
{% endif %}
