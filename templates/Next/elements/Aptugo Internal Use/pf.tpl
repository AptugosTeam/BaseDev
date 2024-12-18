/*
path: pf.tpl
completePath: elements/Aptugo Internal Use/pf.tpl
unique_id: 5Z3IkJtS
icon: ico-field
*/
{% for delay in delayed %}
  {{ delay }}
{% endfor %}
{{ content | raw }}