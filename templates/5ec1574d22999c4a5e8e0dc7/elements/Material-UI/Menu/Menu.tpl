/*
path: Menu.tpl
type: file
unique_id: pOUXaWDR
icon: ico-menu
children: []
options:
  - name: anchorElement
    display: Anchor Element
    type: text
    options: ''
  - name: onClose
    display: On Close
    type: text
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
{% else %}
  {% set anchorElement = element.values.anchorElement %}
{% endif %}
{% if not element.values.onClose %}
  {% set onClose = '() => setAnchorEl(null)' %}
{% else %}
  {% set onClose = element.values.onClose %}
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
  onClose={ {{ onClose }} }
>
{{ content | raw }}
</Menu>