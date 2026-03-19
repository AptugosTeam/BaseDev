/*
path: autolinking.tpl
type: file
unique_id: Gzc1T1q0
icon: ico-autolinking
sourceType: javascript
options:
  - name: fromLink
    display: From Link
    type: dropdown
    options: return aptugo.pageUtils.getAllPages()
children: []
*/
{% if element.values.fromLink %}
  {% set pageFrom = element.values.fromLink | elementData %}
{% else %}
  {% set pageFrom = page %}
{% endif %}
{% for item in pageFrom.children %}
	{% if (item.type == 'page') %}
    {% if (item.path) %}
      {% set innerParams = { 'element': { 'unique_id': item.unique_id, values: { 'destination': item.path, 'linkText': item.name } } } %}
      {% include includeTemplate('navLink.tpl') with innerParams %}
    {% endif %}
  {% endif %}
{% endfor %}
