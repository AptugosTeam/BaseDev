/*
path: defineVariable.tpl
completePath: elements/Programming/defineVariable.tpl
type: file
unique_id: E3aMS2PI
order: 2
icon: ico-variable
helpText: Define a local variable or object property that can be reused later in the current generated scope
options:
  - name: variableName
    display: Variable Name
    helpText: Name of the variable that will be declared and exposed to the builder metadata
    type: text
    options: ''
    settings:
      aptugoOnLoad: >-
        const element = arguments[0];
        const containerElement = element.values.objectProperty ? aptugo.pageUtils.findContainerElement(element.unique_id).unique_id : aptugo.pageUtils.findContainerElement(element.unique_id).unique_id;
        if (element.unique_id === 'uXDTU3Wu') console.log('container --->', containerElement);
        if (element.values.variableName) {
          if (containerElement) {
            aptugo.variables.setVariable({ name: element.values.variableName, container: containerElement, unique_id: element.unique_id,value: element.values.variableValue })
          }
        }
      aptugoOnChange: >-
        if (element.values?.variableName) {
          aptugo.variables.setPageVariable(page, element.unique_id, { [value]: element.values ? element.values.variableValue : null });
        }
      active: true
  - name: variableValue
    display: Value
    helpText: Initial value assigned to the variable. If omitted, child content is used instead.
    type: variable
    options: ''
    settings:
      aptugoOnChange: >-
        if ( element.values.variableName ) aptugo.variables.setPageVariable(page, element.unique_id, { [element.values.variableName]: value });
      active: true
  - name: willbeModified
    display: Will it be modified?
    helpText: When enabled, the variable is declared with let instead of const
    type: checkbox
    options: ''
  - name: serverSide
    display: Back-End Variable
    helpText: Emit this variable only in backend-generated code instead of the frontend scope
    type: checkbox
  - name: renderElsewhere
    display: Render Elsewhere
    helpText: Optional alternate render target for emitting the declaration into another generated section
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
    helpText: Optional TypeScript type annotation for the generated variable
    type: text
    advanced: true
  - name: objectProperty
    display: Belongs to an object
    helpText: Generate the variable as a property on this instead of a standalone declaration
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
{% set varValue = element.values.variableValue|default(content | raw) %}
{% if element.values.variableValue %}
  {% set varValue = element.values.variableValue|default(content | raw) %}
{% endif %}
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
    {{prev}}{{ element.values.variableName }}{% if element.values.type %}{% if not element.values.objectProperty %}:{{ element.values.type }}{% endif %}{% endif %} = {{ varValue }}
  {% endset %}
  {% if element.values.renderElsewhere and element.values.renderElsewhere != 'inPlace' %}
    {{ add_setting(element.values.renderElsewhere, variableContent) }}
  {% else %}{{ variableContent }}{% endif %}
{% endif %}
