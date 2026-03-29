/*
path: AppPageHeader.tpl
type: file
unique_id: AppHFQ8cc
icon: ico-disqus
helpText: Add Funcionalities in App.tsx
children: []
*/
{% set appImports %}{% for delay in delayed['bpr'] %}{{ delay | raw }}{% endfor %}{% endset %}
{{ add_setting('AppImports', appImports) }}
{% set appPh %}
  {% if element.children %}
    {% for child in element.children %}
      {{ child.rendered | raw }}
    {% endfor %}
  {% else %}
    No children to render.
  {% endif %}
{% endset %}
{{ add_setting('AppPH', appPh) }}