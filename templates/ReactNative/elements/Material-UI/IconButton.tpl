/*
path: IconButton.tpl
type: file
unique_id: JgKwuk06
icon: ico-icon-button
options:
  - name: useFontAwesome
    display: Use FontAwesome
    type: checkbox
    settings:
      default: false
  - name: Action
    display: Action
    type: text
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: icon
    display: Icon
    type: dropdown
    options: >-
      return [['AcUnit', 'Ac Unit'], ['Add', 'Add'], ['AddShoppingCart', 'Add Shopping Cart'], ['AllInbox', 'All In Box'],['AlternateEmail', 'Alternate Email'],['ArrowBack', 'Arrow Back'],['AttachFile', 'Attach File'],['ChevronLeft', 'Chevron Left'],['ChevronRight', 'Chevron Right'],['Clear', 'Clear'],['CallMade', 'Call Made'],['Delete', 'Delete'],['DeleteOutline', 'Delete Outline'],['Download', 'Download'],['Facebook', 'Facebook'],['Favorite', 'Favorite'],['Google', 'Google'],['HelpOutline', 'Help Outline'],['Home', 'Home'],['Instagram', 'Instagram'],['Link', 'Link'],['ManageAccounts', 'Manage Accounts'],['Menu', 'Menu'],['MoreVert', 'More Vert'],['Person', 'Person'],['Pinterest', 'Pinterest'],['Publish', 'Publish'],['Refresh', 'Refresh'],['Search', 'Search'],['Send', 'Send'],['Settings', 'Settings'],['ShoppingBasket', 'Shopping Basket'],['ShoppingCart', 'Shopping Cart'],['SportsBasketball', 'Sports Basketball'],['Star', 'Star'],['Twitter', 'Twitter'],['ThumbUp', 'Thumb Up'],['Visibility', 'Visibility'],['WhatsApp', 'WhatsApp'],['YouTube', 'YouTube']]
    settings:
      propertyCondition: useFontAwesome
      negatecondition: true
      active: true
  - name: iconstyle
    display: Icon Style
    type: dropdown
    options: >-
      return [['Filled', 'Filled'], ['Outlined', 'Outlined'], ['Rounded', 'Rounded'], ['TwoTone', 'Two Tone'], ['Sharp', 'Sharp']]
    settings:
      propertyCondition: useFontAwesome
      negatecondition: true
      active: true
  - name: Color
    display: Color
    type: dropdown
    options: 
      return [['default', 'Default'], ['inherit', 'Inherit'], ['primary', 'Primary'], ['secondary', 'Secondary'], ['error', 'Error'], ['info', 'Info'], ['success', 'Success'], ['warning', 'Warning']]
    settings:
      propertyCondition: useFontAwesome
      negatecondition: true
      active: true
  - name: fontSize
    display: Icon Size
    type: text
    options: ''
    settings:
      propertyCondition: useFontAwesome
      negatecondition: true
  - name: fontUnit
    display: Unit
    type: dropdown
    options: >-
      return [['px', 'Px'], ['em', 'Em'], ['rem', 'Rem']]
    settings:
      propertyCondition: useFontAwesome
      negatecondition: true
  - name: FontAwesomeIcon
    display: Font Awesome Icon
    type: text
    options: ''
    settings:
      propertyCondition: useFontAwesome
      condition: true
      active: true
  - name: FontAwesomeSize
    display: Size Awesome Icon
    type: text
    options: ''
    settings:
      propertyCondition: useFontAwesome
      condition: true
      active: true
  - name: FontAwesomeColor
    display: Color Awesome Icon (in Hexadecimal)
    type: text
    options: ''
    settings:
      propertyCondition: useFontAwesome
      condition: true
      active: true
sourceType: javascript
children: []
*/
{% set bpr %}
import Icon from 'react-native-vector-icons/FontAwesome';
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Icon name={ '{{element.values.FontAwesomeIcon|default("square-o")|dashCase}}' } size={ {{element.values.FontAwesomeSize|default(20)}} } color={ '{{element.values.FontAwesomeColor|default("#F96D4E")}}' } 
{% if element.values.Action %}onPress={ {{ element.values.Action | functionOrCall }} }{% endif %}
>
  {{ content | raw }}
</Icon>