/*
path: for.tpl
type: file
unique_id: forforfor
icon: ico-loop
sourceType: javascript
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
children: []
*/
for (var {{ element.values.variablename | default('item') }} = {{ element.values.from | default(0) }}; {{ element.values.variablename | default('item') }} {{ element.values.until }}; {{ element.values.variablename | default('item') }}++) {
{% if element.values.code %}
  {{ element.values.code }}
{% endif %}
{{ content | raw }}
}
