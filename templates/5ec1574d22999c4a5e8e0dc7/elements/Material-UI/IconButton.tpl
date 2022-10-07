/*
path: IconButton.tpl
type: file
completePath: elements/Material-UI/IconButton.tpl
unique_id: JgKwuk06
icon: ico-icon-button
sourceType: javascript
options:
  - name: Action
    display: onClick
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
      AcUnit;Add;AddShoppingCart;AllInbox;AlternateEmail;ArrowBack;AttachFile;ChevronLeft;ChevronRight;Clear;CallMade;Delete;DeleteOutline;Download;Facebook;Favorite;Google;HelpOutline;Home;Instagram;Link;ManageAccounts;Menu;MoreVert;Person;Pinterest;Publish;Refresh;Search;Send;Settings;ShoppingBasket;ShoppingCart;SportsBasketball;Star;Twitter;ThumbUp;Visibility;WhatsApp;YouTube
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