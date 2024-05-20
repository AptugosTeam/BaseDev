/*
path: AppBeforePageRender.tpl
type: file
unique_id: AppBPR26m
icon: ico-disqus
helpText: Add Imports in App.tsx
children: []
*/
{% set appImports %}
  {% if element.children %}
    {% for child in element.children %}
      {{ child.rendered | raw }}
    {% endfor %}
  {% else %}
    No children to render.
  {% endif %}
{% endset %}
{{ add_setting('AppImports', appImports) }}