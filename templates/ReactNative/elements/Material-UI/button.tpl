/*
path: button.tpl
type: file
unique_id: hdTHQyeA
icon: ico-button
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
    type: text
    options: ''
  - name: labelStyle
    display: ClassName for Label
    type: text
    options: ''
  - name: disabled
    display: Disabled
    type: variable
    options: ''
    settings:
      active: true
  - name: type
    display: Type
    type: dropdown
    options: text;outlined;contained;elevated;contained-tonal
  - name: buttonColor
    type: text
    advanced: true
  - name: icon
    display: Write the name of an icon
    type: text
    options: ''
    settings:
      propertyCondition: Iconify
      condition: false
  - name: Iconify
    display: Use Iconify
    type: checkbox
  - name: IconifyName
    display: Name Iconify
    type: text
    options: ''
    settings:
      propertyCondition: Iconify
      condition: true
  - name: sizeIconify
    display: Size Iconify
    type: text
    options: ''
    settings:
      propertyCondition: Iconify
      condition: true
  - name: colorIconify
    display: Color Iconify
    type: text
    options: ''
    settings:
      propertyCondition: Iconify
      condition: true
  - name: classNameIconify
    display: ClassName Iconify
    type: text
    options: ''
    settings:
      propertyCondition: Iconify
      condition: true
sourceType: javascript
children: []
settings:
  - name: Packages
    value: '"react-native-svg": "^15.12.1","react-native-iconify": "^1.0.0",'
  - name: BabelAdd
    value: 'plugins.push("react-native-iconify/plugin")'
*/
{% set bpr %}
import { Button } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% if element.values.Iconify %}
{% set bpr %}
import { Iconify } from 'react-native-iconify'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% endif %}
<Button
  {% if element.values.buttonColor %}buttonColor={{ element.values.buttonColor | textOrVariable }}{% endif %}
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  {% if element.values.type %}mode={'{{ element.values.type }}'}{% endif %}
  {% if element.values.labelStyle %}labelStyle={ {{ element.values.labelStyle }} }{% endif %}
  {% if element.values.icon %}icon={ '{{ element.values.icon }}' }{% endif %}
  {% if element.values.Iconify %}icon={() => <Iconify icon="{{element.values.IconifyName}}" {% if element.values.sizeIconify %}size={ {{element.values.sizeIconify}} } {% endif %} {% if element.values.colorIconify %}color={{element.values.colorIconify | textOrVariable}} {% endif %}{% if element.values.classNameIconify %}style={ {{ element.values.classNameIconify }} }{% endif %}/>}{% endif %}
  {% if element.values.Action %}onPress={ {{ element.values.Action | functionOrCall }} }{% endif %}
  {% if element.values.disabled %}disabled={ {{element.values.disabled}} }{% endif %}
>{% if element.values.ButtonText %}{{ element.values.ButtonText }}{% endif %}{{ content | raw }}</Button>