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
  - name: value
    display: Value
    type: text
    options: ''
  - name: separator
    display: Advanced Properties
    type: separator
    advanced: true
  - name: disabled
    display: Disabled?
    type: text
    advanced: true
    settings:
      default: false
  - name: selected
    display: Is Selected?
    type: text
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
  {% if element.values.value %}
    value={{ element.values.value | textOrVariable }}
  {% endif %}
  {% if element.values.onclick %}
    onClick={ {{ element.values.onclick | functionOrCall }} }
  {% endif %}
  {% if element.values.disabled %}
    disabled={ {{ element.values.disabled }} }
  {% endif %}
  {% if element.values.selected %}
    selected={ {{ element.values.selected }} }
  {% endif %}
  >
  {{ content | raw }}
</MenuItem>