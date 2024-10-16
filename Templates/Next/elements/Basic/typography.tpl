/*
path: typography.tpl
unique_id: hmTuTaFz
children: []
icon: ico-typography
helpText: Renders different typographic html elements
renderTag: (elem) => { return elem.values.tag }
calculatedName: >-
  function (ele) { 
    try {
      return ele.values.tag
    } catch(e) {
      return 'Typography'
    }
  }
options:
  - name: tag
    display: Tag
    type: dropdown
    options: h1;h2;h3;h4;h5;h6;p
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: onclick
    display: On Click
    type: function
    options: ''
    advanced: true
childs:
  - name: Text Content
    element: text
*/
{% set tag = element.values.tag|default('p') %}
{% if tag == 'body1' %}{% set tag = 'p' %}{% endif %}
<{{tag}}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  {% if element.values.onclick %}
    onClick={(e) => {{element.values.onclick}} }
  {% endif %}
  >
{{ content | raw }}
</{{tag}}>
