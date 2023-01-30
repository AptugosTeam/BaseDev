/*
path: MenuItem.tpl
completePath: elements/Material-UI/Menu/MenuItem.tpl
type: file
unique_id: 9ck3oIfw
icon: f:MenuItem.svg
helpText: Adds a menu item into a menu
options:
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: onclick
    display: On Click
    type: function
    options: ''
  - name: separator
    display: Advanced Properties
    type: separator
    advanced: true
  - name: disabled
    display: Disabled?
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
  {% if element.values.className %}
    className={ {{element.values.className}} }
  {% endif %}
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