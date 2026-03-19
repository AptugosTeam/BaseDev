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
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: separator
    display: Advanced Properties
    type: separator
    advanced: true
  - name: positionVertical
    display: Vertical Position
    type: dropdown
    advanced: true
    settings:
      default: top
    options:
      return [['top', 'Top'],['center', 'Center'],['bottom', 'Bottom'],['number', 'Set number in px']]
  - name: verticalNumber
    display: Set vertical position in px
    type: text
    advanced: true
    settings:
      propertyCondition: positionVertical
      condition: number
      active: true
  - name: positionHorizontal
    display: Horizontal Position
    type: dropdown
    advanced: true
    settings:
      default: center
    options: 
      return [['left', 'Left'],['center', 'Center'],['right', 'Right'],['number', 'Set number in px']]
  - name: horizontalNumber
    display: Set horizontal position in px
    type: text
    advanced: true
    settings:
      propertyCondition: positionHorizontal
      condition: number
      active: true
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
  {% if element.values.className %}
    className={ {{element.values.className}} }
  {% endif %}
  anchorEl={ {{ anchorElement }} }
  anchorOrigin={ {
    {% if element.values.positionVertical == 'number' %} vertical: {{element.values.verticalNumber}}, {% else %} vertical: '{{element.values.positionVertical|default("top")}}', {% endif %}
    {% if element.values.positionHorizontal == 'number' %} horizontal: {{element.values.horizontalNumber}}, {% else %} horizontal: '{{element.values.positionHorizontal|default("center")}}', {% endif %}
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