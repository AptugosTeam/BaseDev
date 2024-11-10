/*
path: UpdateCheckForKeyDown.tpl
display: Check for Key Down
keyPath: elements/Games/Snippets/UpdateCheckForKeyDown.tpl
unique_id: yZFBK4LZ
icon: ico-keyboard
options:
  - name: key
    display: Key to Check
    type: text
    options: ''
*/
{% set keys = element.values.key|split(',') %}
{% set function = 'if' %}
{% for key in keys %}
  {% if loop.index > 1 %}{% set function = 'else if' %}{% endif %}
  {{ function }}(this.keys.{{ key }}.isDown) {
    {{ element.children[loop.index - 1].rendered | raw }}
  }
{% endfor %}
{% if element.children.length > keys.length %}
else {
  {{ element.children[keys.length].rendered | raw }}
}
{% endif %}
