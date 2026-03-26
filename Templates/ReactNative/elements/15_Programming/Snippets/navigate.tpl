/*
path: navigate.tpl
completePath: elements/Programming/Snippets/navigate.tpl
type: file
unique_id: navigate
icon: f:navigate.svg
sourceType: javascript
options:
  - name: to
    display: To
    type: dropdown
    options: return aptugo.pageUtils.getAllPages()
  - name: navigationType
    display: Navigation Type
    type: dropdown
    options: navigate;replace;push;goBack;reset
children: []
*/
{% set pageFrom = element.values.to | elementData %}
{% set routeTo = pageFrom.path %}
{% if routeTo == '/' %}
  {% set routeTo = 'Dashboard' %}
{% elseif routeTo|first == '/' %}
  {% set routeTo = routeTo|slice(1) %}
{% endif %}
router.{{ element.values.navigationType | default('navigate') }}('{{ routeTo }}')
