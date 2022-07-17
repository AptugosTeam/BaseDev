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
  - name: Color
    display: Color
    type: dropdown
    options: default;inherit;primary;secondary;error;info;success;warning
    settings:
      default: primary
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: icon
    display: Icon
    type: dropdown
    options: >-
      None;AcUnit;Add;AddShoppingCart;CallMade;ChevronLeft;ChevronRight;HelpOutline;Home;Link;MoreVert;Search;Send;ShoppingBasket;ShoppingCart;SportsBasketball;AllInbox;Menu;DeleteOutline;Favorite;Clear;Google;Facebook;Twitter;Person;ThumbUp
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
import IconButton from '@mui/material/IconButton'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import {{element.values.icon}}{{ addenum }}Icon from '@mui/icons-material/{{element.values.icon}}{{ addenum }}'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<IconButton
  {% if element.values.Color %}color='{{ element.values.Color }}'{% endif %}
  {% if element.values.Action %}onClickCapture={ {{ element.values.Action | functionOrCall }} }{% endif %}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
>
  {% if element.values.icon %}<{{element.values.icon}}{{ addenum }}Icon />{% endif %}
  {{ content | raw }}
</IconButton>