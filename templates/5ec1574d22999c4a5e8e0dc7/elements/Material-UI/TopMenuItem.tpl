/*
path: TopMenuItem.tpl
completePath: elements/Material-UI/TopMenuItem.tpl
unique_id: t8HbLltx
children: []
icon: ico-top-menu-item
options:
  - name: text
    display: Display Text
    type: text
    options: ''
  - name: link
    display: Navigate to
    type: text
    options: ''
  - name: onClick
    display: On Click
    type: function
    options: ''
  - name: className
    display: ClassName
    type: styles
*/
{% if element.values.className is defined and element.values.className|length > 1 %}
{% set bpr %}
import clsx from 'clsx'
{% endset %}
{{ save_delayed('bpr',bpr) }}
  {% set class = 'clsx(' ~ element.values.className|join('') ~ ')' %}
{% else %}
  {% set class = element.values.className %}
{% endif %}
<TopMenuItem
  {% if element.values.className %}
    className={ {{ class }} }
  {% endif %}
  {% if element.values.text %}
    text={{ element.values.text | textOrVariable}}
  {% endif %}
  {% if element.values.link %}
    link={{ element.values.link | textOrVariable }}
  {% endif %}
  {% if element.values.onClick %}
    onClickCapture={ {{ element.values.onClick | functionOrCall }} }
  {% endif %}
  >{{ content|raw }}
</TopMenuItem>
