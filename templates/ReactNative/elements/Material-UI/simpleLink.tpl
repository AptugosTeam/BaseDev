/*
path: simpleLink.tpl
type: file
unique_id: BG7vdEr8
icon: ico-link
options:
  - name: destination
    display: Destination
    type: text
    options: ''
  - name: parameters
    display: Parameters
    type: text
    options: ''
  - name: tagToUse
    display: Use Tag
    type: dropdown
    options: >-
      return [['navigate', 'Navigate'], ['push', 'Push'], ['A', 'External']]
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: style
    display: Extra Styles
    type: text
    options: ''
sourceType: javascript
children: []
*/
{% set bpr %}
import { TouchableOpacity, Linking } from "react-native"
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<TouchableOpacity
  {% if element.values.className %}style={ {{element.values.className}} }{% endif %}
  {% if element.values.tagToUse == "A" %}
  onPress={() => Linking.openURL( {{ element.values.destination|textOrVariableInCode }}{% if element.values.parameters %}, {{ element.values.parameters }}{% endif %} )}
  {% else %}
  onPress={() => navigation.{{ element.values.tagToUse|default('push') }}( {{ element.values.destination|textOrVariableInCode }}{% if element.values.parameters %}, {{ element.values.parameters }}{% endif %} )}
  {% endif %}
  key='{{ element.unique_id }}'
>
  {{ content | raw }}
</TouchableOpacity>