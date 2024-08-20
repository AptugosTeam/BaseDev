/*
path: code.tpl
type: file
unique_id: 7nq5ukbU
icon: ico-code
sourceType: javascript
options:
  - name: code
    display: Code
    type: code
    options: ''
  - name: serverSide
    display: Back-End Code
    type: checkbox
    advanced: true
    settings:
      default: false
settings:
  - name: ServerAddenum
    value: |-
      {% if element.values.serverSide %}
      {{ element.values.code | raw }}
      {% endif %}
children: []
*/
{% if not element.values.serverSide %}
  {{ element.values.code | raw }}
{% endif %}