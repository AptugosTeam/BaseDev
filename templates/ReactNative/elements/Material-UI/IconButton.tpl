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
  - name: useCommunity
    display: Use Community Icon
    type: checkbox
    settings:
      default: false
  - name: useMaterial
    display: Use Material Icon
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
  - name: FontAwesomeStyle
    display: Font Awesome Style
    type: dropdown
    options: solid;light
    settings:
      propertyCondition: useFontAwesome
      condition: true
      active: true
sourceType: javascript
children: []
*/
{% set tag = 'Icon' %}
{% set bpr %}
{% if element.values.useCommunity %}
import IconCommunity from 'react-native-vector-icons/MaterialCommunityIcons';
{% set tag = 'IconCommunity' %}
{% elseif element.values.useMaterial %}
import IconMaterial from 'react-native-vector-icons/MaterialIcons';
{% set tag = 'IconMaterial' %}
{% else %}
import Icon from 'react-native-vector-icons/FontAwesome5';
{% endif %}
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<{{ tag }} name={{element.values.FontAwesomeIcon|default("square-o")|dashCase | textOrVariable}} size={ {{element.values.FontAwesomeSize|default(20)}} } {% if element.values.FontAwesomeColor %}color={{element.values.FontAwesomeColor | textOrVariable}}{% endif %} 
{% if element.values.Action %}onPress={ {{ element.values.Action | functionOrCall }} }{% endif %}
{% if element.values.FontAwesomeStyle %}{{ element.values.FontAwesomeStyle }}{% endif %}
>
  {{ content | raw }}
</{{ tag }}>