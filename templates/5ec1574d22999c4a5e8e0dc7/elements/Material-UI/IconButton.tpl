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
    type: function
    options: ''
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
      return [['Filled', 'Filled'], ['Outlined', 'Outlined'], ['Rounded', 'Rounded'], ['TwoTone', 'Two Tone'], ['Sharp', 'Sharp']]
    settings:
      default: Filled
  - name: Color
    display: Color
    type: dropdown
    options: 
      return [['custom', 'Custom'], ['default', 'Default'], ['inherit', 'Inherit'], ['primary', 'Primary'], ['secondary', 'Secondary'], ['error', 'Error'], ['info', 'Info'], ['success', 'Success'], ['warning', 'Warning']]
    settings:
      default: default
  - name: custom
    display: Custom Color
    type: text
    settings:
      propertyCondition: Color
      condition: custom
      active: true
  - name: fontSize
    display: Size
    type: text
    settings:
      default: 24
  - name: fontUnit
    display: Unit
    type: dropdown
    options: >-
      return [['px', 'Px'], ['em', 'Em'], ['rem', 'Rem']]
    settings:
      default: px
  - name: sx
    display: Extra Styles
    type: text
    advanced: true
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
children: []
*/
{% set addenum = '' %}
{% if element.values.iconstyle and element.values.iconstyle != 'Filled' and element.values.icon != 'Google' and element.values.icon != 'Twitter' and element.values.icon != 'Instagram' and element.values.icon != 'Pinterest' and element.values.icon != 'WhatsApp' and element.values.icon != 'YouTube' %}
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