/*
path: typography.tpl
unique_id: hmTuTaFz
children: []
icon: ico-typography
helpText: Renders different typographic html elements
order: 10
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
{% set extraStyles = '' %}
{% set tag = element.values.tag|default('p') %}
{% if tag == 'subtitle1' or tag == 'subtitle2' %}{% set tag = 'h6' %}{% endif %}
{% if tag == 'body1' or tag == 'body2' %}{% set tag = 'p' %}{% endif %}
{% if tag == 'caption' %}{% set extraStyles = 'MuiTypography-root MuiTypography-caption' %}{% set tag = 'span' %}{% endif %}
{% if tag == 'overline' %}{% set extraStyles = 'MuiTypography-root MuiTypography-overline' %}{% set tag = 'span' %}{% endif %}
<{{tag}}
  {% if element.values.className or extraStyles != '' %}className={`{{extraStyles}} {% if element.values.className %}${ {{ element.values.className }} }{% endif %}`}{% endif %}
  {% if element.values.onclick %}
    onClick={(e) => {{element.values.onclick}} }
  {% endif %}
  >
{{ content | raw }}
</{{tag}}>
