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
  - name: FontAwesomeIcon
    display: Font Awesome Icon
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
  - name: fontSize
    display: Icon Size
    type: text
    options: ''
    settings:
      default: 24
  - name: fontUnit
    display: Unit
    type: dropdown
    options: >-
      return [['px', 'Px'], ['em', 'Em'], ['rem', 'Rem']]
    settings:
      default: px
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
  {% set fai = element.values.FontAwesomeIcon|capitalize %}
  {% if fai == 'Menu' %}{% set fai = 'Bars' %}{% endif %}
  {% if fai == 'Alt-route' %}{% set fai = 'Route' %}{% endif %}
  {% if fai == 'Map-marker-alt' %}{% set fai = 'LocationDot' %}{% endif %}
  {% if fai == 'Chevron-left' %}{% set fai = 'ChevronLeft' %}{% endif %}
  {% if fai == 'Magnify' %}{% set fai = 'MagnifyingGlass' %}{% endif %}
  import { fa{{ fai }} } from '@fortawesome/free-solid-svg-icons'
{% else %}
  import {{element.values.icon}}{{ addenum }}Icon from '@mui/icons-material/{{element.values.icon}}{{ addenum }}'
{% endif %}
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% if element.values.useFontAwesome %}
  <FontAwesomeIcon   
  {% if element.values.Action %}
    onClick={ {{ element.values.Action | functionOrCall }} }
  {% endif %} 
    icon={ fa{{ fai }} }
  {% if element.values.fontSize %} 
    style={ { fontSize: "{{ element.values.fontSize }}{{ element.values.fontUnit|default('px') }}" } }
  {% endif %}
  {% if element.values.FontAwesomeColor %} 
    color={'{{ element.values.FontAwesomeColor }}'}
  {% endif %}>
    {{ content | raw }}
  </FontAwesomeIcon>
{% else %}
  <IconButton
    {% if element.values.Color %}
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