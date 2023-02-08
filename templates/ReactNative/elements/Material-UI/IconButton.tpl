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
  - name: iconstyle
    display: Icon Style
    type: dropdown
    options: >-
      Filled;Outlined;Rounded;TwoTone;Sharp
sourceType: javascript
children: []
*/
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