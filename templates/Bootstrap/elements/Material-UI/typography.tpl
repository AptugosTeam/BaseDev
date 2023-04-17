/*
path: typography.tpl
completePath: elements/Material-UI/typography.tpl
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
    options: >-
      h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit
childs:
  - name: Text Content
    element: text
*/
{% set tag = element.values.tag %}
{% if tag == 'body1' %}{% set tag = 'p' %}{% endif %}
<{{ tag }}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}>
{{ content | raw }}
</{{ tag }}>
