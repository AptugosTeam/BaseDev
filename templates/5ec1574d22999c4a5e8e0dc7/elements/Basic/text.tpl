/*
path: text.tpl
completePath: elements/Basic/text.tpl
type: file
unique_id: gBDZLTD1
icon: ico-text
helpText: >-
  Insert simple text anywhere. Can hold variables, code, and anything of your
  choice
sourceType: javascript
options:
  - name: Content
    display: Content
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
children: []
*/
{% if element.values.className or element.values.ClassName %}
  <span className={ {{ element.values.className|default(element.values.ClassName) }} }>
{% endif %}
  {{ element.values.Content | raw }}
  {{ content | raw }}
{% if element.values.className or element.values.ClassName %}
  </span>
{% endif %}