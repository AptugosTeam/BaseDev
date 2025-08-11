/*
path: defineVariable.tpl
type: file
unique_id: E3aMS2PI
icon: ico-define-variable
helpText: Allows you to define a variable that will be used later
options:
  - name: variableName
    display: Name
    type: text
    options: ''
  - name: variableValue
    display: Value
    type: text
    options: ''
  - name: willbeModified
    display: Will it be modified?
    type: checkbox
    options: ''
sourceType: javascript
children: []
*/

{% set varName = element.values.variableName | default('defaultVariable') %}
{% set varValue = element.values.variableValue | default('') %}
{% set isLet = element.values.willbeModified %}

{% if isLet and varValue == '' %}
    let {{ varName }}
{% else %}
    {% if isLet %}let{% else %}const{% endif %} {{ varName }} = {{ varValue }}
{% endif %}