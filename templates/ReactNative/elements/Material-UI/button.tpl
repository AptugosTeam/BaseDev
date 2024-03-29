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
  - name: icon
    display: Write the name of an icon
    type: text
    options: ''
  - name: type
    display: Type
    type: dropdown
    options: text;outlined;contained;elevated;contained-tonal
sourceType: javascript
children: []
*/
{% set bpr %}
import { Button } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Button
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  {% if element.values.type %}mode={'{{ element.values.type }}'}{% endif %}
  {% if element.values.labelStyle %}labelStyle={ {{ element.values.labelStyle }} }{% endif %}
  {% if element.values.icon %}icon={ '{{ element.values.icon }}' }{% endif %}
  {% if element.values.Action %}onPress={ {{ element.values.Action | functionOrCall }} }{% endif %}
  {% if element.values.disabled %}disabled={ {{element.values.disabled}} }{% endif %}
>{% if element.values.ButtonText %}{{ element.values.ButtonText }}{% endif %}{{ content | raw }}</Button>