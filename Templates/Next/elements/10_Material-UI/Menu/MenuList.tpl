/*
path: MenuList.tpl
type: file
unique_id: pOUahjDR
icon: ico-menu
children: []
options:
  - name: className
    display: ClassName
    type: styles
    options: ''
childs:
  - name: MenuItem
    element: MenuItem
helpText: Menus display a list of choices on temporary surfaces.
*/
{% set bpr %}
import MenuList from '@mui/material/MenuList'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<MenuList
  {% if element.values.className %}
    className={ {{element.values.className}} }
  {% endif %}
>
{{ content | raw }}
</MenuList>