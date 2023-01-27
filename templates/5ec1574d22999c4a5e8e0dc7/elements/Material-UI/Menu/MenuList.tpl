/*
path: MenuList.tpl
type: file
unique_id: pOUahjDR
icon: ico-menu
children: []
options:
  - name: width
    display: Width
    type: text
    settings:
      default: auto
  - name: height
    display: Height
    type: text
    settings:
      default: auto
  - name: unit
    display: Unit
    type: dropdown
    options: >-
      return [['', 'None'],['px', 'Px'], ['em', 'Em'], ['rem', 'Rem']]
    settings:
      default: '' 
  - name: separator
    display: Advanced Properties
    type: separator
    advanced: true
  - name: sx
    display: Another SX properties
    type: text
    advanced: true
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
    sx={ { width: '{{ element.values.width|default('auto') }}{{ element.values.unit }}', height: '{{ element.values.height|default('auto') }}{{ element.values.unit }}', {{ element.values.sx }} } } 
>
{{ content | raw }}
</MenuList>