/*
path: MenuItem.tpl
completePath: elements/Material-UI/Menu/MenuItem.tpl
type: file
unique_id: 9ck3oIfw
icon: f:MenuItem.svg
helpText: Adds a menu item into a menu
options:
  - name: onclick
    display: On Click
    type: text
    options: ''
*/
<MenuItem
    {% if element.values.onclick %}onClick={ {{ element.values.onclick }} }{% endif %}
>{{ content | raw }}</MenuItem>