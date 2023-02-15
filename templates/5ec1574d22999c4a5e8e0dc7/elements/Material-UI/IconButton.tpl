/*
path: IconButton.tpl
type: file
completePath: elements/Material-UI/IconButton.tpl
unique_id: JgKwuk06
icon: ico-icon-button
sourceType: javascript
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
settings:
  - name: Packages
    value: '"@fortawesome/fontawesome-svg-core": "6.3.0","@fortawesome/free-solid-svg-icons": "6.3.0","@fortawesome/react-fontawesome": "0.2.0",'
children: []
*/
{% set addenum = '' %}
{% if element.values.iconstyle and element.values.iconstyle != 'Filled' and element.values.icon != 'Google' and element.values.icon != 'Twitter' and element.values.icon != 'Instagram' and element.values.icon != 'Pinterest' and element.values.icon != 'WhatsApp' and element.values.icon != 'YouTube' %}
  {% set addenum = element.values.iconstyle %}
{% endif %}
{% set bpr %}
{% if element.values.useFontAwesome %}
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
{% else %}
import IconButton from '@mui/material/IconButton'
{% endif %}
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
{% if element.values.useFontAwesome %}
import { fa{{ element.values.FontAwesomeIcon }} } from '@fortawesome/free-solid-svg-icons'
{% else %}
import {{element.values.icon}}{{ addenum }}Icon from '@mui/icons-material/{{element.values.icon}}{{ addenum }}'
{% endif %}
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% if element.values.useFontAwesome %}
  <FontAwesomeIcon   {% if element.values.Action %}
    onClick={ {{ element.values.Action | functionOrCall }} }
  {% endif %} icon={ fa{{ element.values.FontAwesomeIcon }} } {% if element.values.FontAwesomeColor %} color={'{{ element.values.FontAwesomeColor }}'}{% endif %}>{{ content | raw }}</FontAwesomeIcon>
{% else %}
<IconButton
  {% if element.values.Color != 'custom' %}
    color="{{ element.values.Color }}"
  {% endif %}
  {% if element.values.Action %}
    onClick={ {{ element.values.Action | functionOrCall }} }
  {% endif %}
  {% if element.values.className %}
    className={ {{ element.values.className }} }
  {% endif %}
>
  {% if element.values.icon %}
    <{{element.values.icon}}{{ addenum }}Icon
      {% if element.values.sx or element.values.fontSize %}
        sx={ {
          {% if element.values.fontSize %}
            fontSize: "{{ element.values.fontSize }}{{ element.values.fontUnit|default('px') }}",
          {% endif %}
          {% if element.values.Color == 'custom' %}
            color: "{{ element.values.custom }}",
          {% endif %}
          {{element.values.sx}}
        } }
      {% endif %}
    />
  {% endif %}
  {{ content | raw }}
</IconButton>
{% endif %}