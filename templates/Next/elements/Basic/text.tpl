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
renderTag: span
render: (elem) => { return elem.values.Content }
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
{% if element.values.className or element.values.ClassName or type == 'DevelopmentDebug' %}
  <span {% if type == 'DevelopmentDebug' %}data-aptugo="{{ element.unique_id }}"{% endif %} {% if element.values.className or element.values.ClassName %}className={ {{ element.values.className|default(element.values.ClassName) }} }{% endif %}>
{% endif %}
  {{ element.values.Content | raw }}
  {{ content | raw }}
{% if element.values.className or element.values.ClassName or type == 'DevelopmentDebug' %}
  </span>
{% endif %}