/*
path: MenuItem.tpl
type: file
unique_id: 9ck3oIfw
icon: file.svg
helpText: Adds a menu item into a menu
options:
  - name: onclick
    display: On Click
    type: text
    options: ''
*/
<Menu.Item {% if element.values.onClick %}onPress={ {{ element.values.onclick }} }{% endif %} title="{{ content | raw }}" />