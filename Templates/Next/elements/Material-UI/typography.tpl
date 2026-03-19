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
{% set bpr %}
import Typography from '@mui/material/Typography'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Typography
  {% if type == 'DevelopmentDebug' %}data-aptugo="{{ element.unique_id }}"{% endif %}
  variant="{{ element.values.tag }}"
  {% if element.values.color %}color="{{ element.values.color }}"{% endif %}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  {% if element.values.onclick %}
    onClick={(e) => {{element.values.onclick}} }
  {% endif %}
  >
{{ content | raw }}
</Typography>
