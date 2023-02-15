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