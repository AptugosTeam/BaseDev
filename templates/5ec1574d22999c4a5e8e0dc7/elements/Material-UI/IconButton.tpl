/*
path: IconButton.tpl
type: file
completePath: elements/Material-UI/IconButton.tpl
unique_id: JgKwuk06
icon: ico-icon-button
sourceType: javascript
options:
  - name: Action
    display: On Click
    type: text
    options: ''
  - name: Color
    display: Color
    type: dropdown
    options:
      return [['default', 'Default'], ['inherit', 'Inherit'], ['primary', 'Primary'], ['secondary', 'Secondary'], ['error', 'Error'], ['info', 'Info'], ['success', 'Success'], ['warning', 'Warning']]
    settings:
      default: default
  - name: size
    display: Size
    type: dropdown
    options:
      return [['small', 'Small'], ['medium', 'Medium'], ['large', 'Large']]
    settings:
      default: medium
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: icon
    display: Icon
    required: true
    type: dropdown
    options: >-
      return [['AcUnit', 'Ac Unit'], ['Add', 'Add'], ['AddShoppingCart', 'Add Shopping Cart'], ['AllInbox', 'All In Box'],['AlternateEmail', 'Alternate Email'],['ArrowBack', 'Arrow Back'],['AttachFile', 'Attach File'],['ChevronLeft', 'Chevron Left'],['ChevronRight', 'Chevron Right'],['Clear', 'Clear'],['CallMade', 'Call Made'],['Delete', 'Delete'],['DeleteOutline', 'Delete Outline'],['Download', 'Download'],['Facebook', 'Facebook'],['Favorite', 'Favorite'],['Google', 'Google'],['HelpOutline', 'Help Outline'],['Home', 'Home'],['Instagram', 'Instagram'],['Link', 'Link'],['ManageAccounts', 'Manage Accounts'],['Menu', 'Menu'],['MoreVert', 'More Vert'],['Person', 'Person'],['Pinterest', 'Pinterest'],['Publish', 'Publish'],['Refresh', 'Refresh'],['Search', 'Search'],['Send', 'Send'],['Settings', 'Settings'],['ShoppingBasket', 'Shopping Basket'],['ShoppingCart', 'Shopping Cart'],['SportsBasketball', 'Sports Basketball'],['Star', 'Star'],['Twitter', 'Twitter'],['ThumbUp', 'Thumb Up'],['Visibility', 'Visibility'],['WhatsApp', 'WhatsApp'],['YouTube', 'YouTube']]
  - name: iconstyle
    display: Icon Style
    type: dropdown
    options: >-
      Filled;Outlined;Rounded;TwoTone;Sharp
children: []
*/
{% set addenum = '' %}
{% if element.values.iconstyle and element.values.iconstyle != 'Filled' %}
  {% set addenum = element.values.iconstyle %}
{% endif %}
{% set bpr %}
import IconButton from '@mui/material/IconButton'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import {{element.values.icon}}{{ addenum }}Icon from '@mui/icons-material/{{element.values.icon}}{{ addenum }}'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<IconButton
  {% if element.values.Color %}
    color='{{ element.values.Color }}'
  {% endif %}
  size='{{ element.values.size }}'
  {% if element.values.Action %}
    onClick={ {{ element.values.Action | functionOrCall }} }
  {% endif %}
  {% if element.values.className %}
    className={ {{ element.values.className }} }
  {% endif %}
>
  {% if element.values.icon %}
    <{{element.values.icon}}{{ addenum }}Icon />
  {% endif %}
  {{ content | raw }}
</IconButton>