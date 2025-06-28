/*
path: for.tpl
type: file
unique_id: forforfor
icon: ico-each
color: rgb(255, 192, 128)
sourceType: javascript
order: 4
helpText: Allows you to loop N times
options:
  - name: from
    display: Start
    type: variable
    options: ''
  - name: until
    display: Condition
    type: variable
    options: ''
  - name: increment
    display: Increment
    type: variable
    options: ''
  - name: code
    display: Code
    type: text
    options: ''
  - name: variablename
    display: Variable name for the loop
    type: text
    settings:
      default: 'item'
      aptugoOnLoad: |-
        const element = arguments[0];
        const page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id;
        const usesVariable = element.values.variablename;
        const newLocalVarName = element.values.variablename || 'item';
        aptugo.variables.setElementVariable(element.unique_id, newLocalVarName);
      active: true
children: []
*/
for (var {{ element.values.variablename | default('item') }} = {{ element.values.from | default(0) }}; {{ element.values.variablename | default('item') }} {{ element.values.until }}; {{ element.values.variablename | default('item') }}++) {
{% if element.values.code %}
  {{ element.values.code }}
{% endif %}
{{ content | raw }}
}
