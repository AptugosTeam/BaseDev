/*
path: IconButton.tpl
type: file
unique_id: JgKwuk06
icon: ico-icon-button
options:
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
      None;Add;AddShoppingCart;CallMade;chevron-left;chevron-right;HelpOutline;Home;Link;MoreVert;Search;Send;ShoppingBasket;ShoppingCart;SportsBasketball;AllInbox;Menu;DeleteOutline;Favorite;Clear;Google;Facebook;Twitter;Person;ThumbUp
    settings:
      propertyCondition: useFontAwesome
      negatecondition: true
      active: true
  - name: iconstyle
    display: Icon Style
    type: dropdown
    options: >-
      Filled;Outlined;Rounded;TwoTone;Sharp
    settings:
      propertyCondition: useFontAwesome
      negatecondition: true
      active: true
  - name: useFontAwesome
    display: Use FontAwesome
    type: checkbox
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
{% if !element.values.useFontAwesome %}
{% set addenum = '' %}
{% if element.values.iconstyle and element.values.iconstyle != 'Filled' %}
  {% set addenum = element.values.iconstyle %}
{% endif %}
{% set bpr %}
import { MaterialIcons } from '@expo/vector-icons'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { IconButton, Colors } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set theIcon = element.values.icon | lower %}
{% if theIcon == 'thumbup' %}{% set theIcon = 'thumb-up' %}{% endif %}
<IconButton
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  icon={ props => <MaterialIcons {% if element.values.className %}style={ {{ element.values.className ~ 'icon' }} }{% endif %} {% if theIcon %}name={{ theIcon | textOrVariable }} {% endif %}size={32} />}
  {% if element.values.Action %}onPress={ {{ element.values.Action | functionOrCall }} }{% endif %}
>
  {{ content | raw }}
</IconButton>
{% else %}
{% set bpr %}
import Icon from 'react-native-vector-icons/FontAwesome';
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Icon name={ '{{element.values.name|default("square-o")}}' } size={ {{element.values.size|default(20)}} } color={ '{{element.values.color|default("#F96D4E")}}' } 
{% if element.values.Action %}onPress={ {{ element.values.Action | functionOrCall }} }{% endif %}
>
  {{ content | raw }}
</Icon>
{% endif %}