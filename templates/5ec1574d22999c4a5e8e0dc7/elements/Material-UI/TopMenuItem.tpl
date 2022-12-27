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
    required: true
  - name: link
    display: Navigate to
    type: text
    options: ''
  - name: targets
    display: Link Target
    type: dropdown
    options: >-
      return [['_self', 'Self'],['_blank', 'Blank'],['_parent', 'Parent'],['_top', 'Top'],['variable', 'Variable']]
    settings:
      default: _self
  - name: variable
    display: Variable
    type: text
    settings:
      propertyCondition: targets
      condition: variable
      active: true
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
  text={{ element.values.text | textOrVariable | default("' '") }}
  {% if element.values.link %}
    link={{ element.values.link | textOrVariable }}
  {% endif %}
  {% if element.values.targets != 'variable' %}
    target="{{ element.values.targets }}"
  {% elseif element.values.targets %}
      target={{ element.values.variable | textOrVariable }}
  {% endif %}
  
  {% if element.values.onClick %}
    onClickCapture={ {{ element.values.onClick | functionOrCall }} }
  {% endif %}
  >{{ content|raw }}
</TopMenuItem>
