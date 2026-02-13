/*
path: button.tpl
type: file
unique_id: hdTHQyeA
icon: ico-button
renderTag: button
render: (elem) => { return elem.values.ButtonText }
options:
  - name: ButtonText
    display: Button Text
    type: text
    options: ''
    settings:
      default: Button
  - name: Action
    display: Action
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: Variant
    display: Variant
    type: dropdown
    options: text;contained;outlined
  - name: Color
    display: Color
    type: dropdown
    options: default;inherit;primary;secondary;error;info;success;warning
    settings:
      default: primary
  - name: disabled
    display: Disabled
    type: variable
    options: ''
    settings:
      active: true
  - name: ariaHidden
    display: Hide from Screen Readers
    type: checkbox
    options: ''
    advanced: true
  - name: fullWidth
    display: Full Width
    type: checkbox
    options: ''
  - name: icon
    display: Icon
    type: dropdown
    options: >-
      None;Add;Home;Link;Send;AllInbox;Map;Menu;DeleteOutline;Favorite;Clear;Google;Facebook;Twitter;Person;Settings;ThumbUp
  - name: buttonType
    display: Type Submit
    type: checkbox
    options: ''
    advanced: true
  - name: extraCode
    display: Extra Code
    type: function
    options: ''
    advanced: true
sourceType: javascript
children: []
*/
{% if element.values.icon and element.values.icon != 'None' %}
{% set bpr %}
import {{ element.values.icon }}Icon from '@mui/icons-material/{{ element.values.icon }}'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% endif %}
{% set bpr %}
import Button from '@mui/material/Button'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Button 
  {% if element.values.ariaHidden %}tabIndex={-1} aria-hidden="true"{% endif %}
  {% if element.values.buttonType %}type='submit'{% endif %}
  {% if element.values.Variant %}variant='{{ element.values.Variant }}'{% endif %}
  {% if element.values.Color %}color='{% if element.values.Color == 'default' %}inherit{% else %}{{ element.values.Color }}{% endif %}'{% endif %}
  {% if element.values.Action %}onClickCapture={ {{ element.values.Action | functionOrCall }} }{% endif %}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  {% if element.values.fullWidth %}fullWidth{% endif %}
  {% if element.values.icon and element.values.icon != 'None' %}startIcon={<{{ element.values.icon }}Icon />}{% endif %}
  {% if element.values.disabled %}disabled={ {{element.values.disabled}} }{% endif %}
  {% if element.values.extraCode %} {{element.values.extraCode}} {% endif %}
>
  {{ element.values.ButtonText }}{{ content | raw }}
</Button>