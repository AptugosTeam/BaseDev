/*
path: Menu.tpl
type: file
unique_id: pOUXaWDR
icon: ico-menu
children: []
options:
  - name: anchorElement
    display: Open Variable
    type: text
    options: ''
  - name: onClose
    display: On Close
    type: function
    options: ''
  - name: positionVertical
    display: Position Vertical
    type: dropdown
    advanced: true
    options:
      return [['top', 'Top'],['bottom', 'Bottom']]
  - name: positionHorizontal
    display: Position Horizontal
    type: dropdown
    advanced: true
    options: 
      return [['left', 'Left'],['center', 'Center'],['right', 'Right']]
childs:
  - name: MenuList
    element: MenuList
helpText: Menus display a list of choices on temporary surfaces.
*/
{% set bpr %}
import Menu from '@mui/material/Menu'
import MenuItem from '@mui/material/MenuItem'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% if not element.values.anchorElement %}
  {% set ph %}
    const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null)
  {% endset %}
  {{ save_delayed('ph',ph) }}
  {% set anchorElement = 'anchorEl' %}
  {% set onClose = '() => setAnchorEl(null)' %}
{% else %}
  {% set anchorElement = element.values.anchorElement %}
{% endif %}
<Menu
    anchorEl={ {{ anchorElement }} }
    anchorOrigin={ {
      vertical: '{{element.values.positionVertical|default("top")}}',
      horizontal: '{{element.values.positionHorizontal|default("center")}}',
    } }
    transformOrigin={ {
      vertical: 'top',
      horizontal: 'center',
    } }
    open={ Boolean({{ anchorElement }}) }
  {% if not element.values.onClose and element.values.anchorElement %}
    onClose={ () => {set{{ element.values.anchorElement }}(null)
  } }
  {% elseif element.values.onClose %}
    onClose={ {{ element.values.onClose | functionOrCall }} }
  {% else %}
    onClose={ {{ onClose }} }
  {% endif %}
>
{{ content | raw }}
</Menu>