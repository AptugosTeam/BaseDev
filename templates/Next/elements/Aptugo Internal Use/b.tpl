/*
path: b.tpl
completePath: elements/Aptugo Internal Use/b.tpl
type: file
unique_id: evkkxPDn
icon: ico-body
sourceType: javascript
internalUse: true
children: []
options:
  - name: className
    display: ClassName
    type: styles
  - name: extraThemeOptions
    display: Extra Theming options
    type: text    
*/
{% if element.values.className is defined and element.values.className is iterable and element.values.className|length > 1 %}
{% set bpr %}
import clsx from 'clsx'
{% endset %}
{{ save_delayed('bpr',bpr) }}
  {% set class = 'clsx(' ~ element.values.className|join(',') ~ ')' %}
{% else %}
  {% set class = element.values.className|default('classes.mainPanel') %}
{% endif %}
{% for delay in delayed %}
  {{ delay }}
{% endfor %}
<div {% if class %}className={ {{ class }} }{% endif %} >
{{ content|raw }}
</div>