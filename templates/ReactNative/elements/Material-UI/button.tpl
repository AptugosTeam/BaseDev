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
sourceType: javascript
children: []
*/
{% set bpr %}
import { Button } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Button
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  {% if element.values.Action %}onPress={ {{ element.values.Action | functionOrCall }} }{% endif %}
>{% if element.values.ButtonText %}{{ element.values.ButtonText }}{% endif %}{{ content | raw }}</Button>