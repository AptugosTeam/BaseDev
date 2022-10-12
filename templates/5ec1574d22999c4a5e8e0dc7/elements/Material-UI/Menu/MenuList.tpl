/*
path: MenuList.tpl
type: file
unique_id: pOUahjDR
icon: ico-menu
children: []
options:
  - name: width
    display: Width (in px)
    type: text
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
    sx={ { width:'{{ element.values.width|default("320px") }}' } } 
>
{{ content | raw }}
</MenuList>