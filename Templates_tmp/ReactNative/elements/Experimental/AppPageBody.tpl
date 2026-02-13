/*
path: AppPageBody.tpl
type: file
unique_id: AppPBb2zv
icon: ico-disqus
helpText: Add Components in App.tsx Body
children: []
*/
{% set appB %}
  {% if element.children %}
    {% for child in element.children %}
      {{ child.rendered | raw }}
    {% endfor %}
  {% else %}
    No children to render.
  {% endif %}
{% endset %}
{{ add_setting('AppB', appB) }}