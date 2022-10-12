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
  - name: disabled
    display: disabled?
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: selected
    display: Is Selected?
    type: checkbox
    advanced: true
    settings:
      default: false
childs:
  - name: text
    element: text
*/
<MenuItem
    {% if element.values.onclick %}
      onClick={ {{ element.values.onclick }} }
    {% endif %}
    {% if element.values.disabled %}
      disabled 
    {% endif %}
    {% if element.values.selected %}
      selected={true}
      {% endif %}
  >
  {{ content | raw }}
</MenuItem>