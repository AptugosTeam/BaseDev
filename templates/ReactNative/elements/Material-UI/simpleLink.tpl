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
    options: NavLink;A
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: style
    display: Extra Styles
    type: text
    options: ''
  - name: target
    display: Link Target
    type: dropdown
    options: _self;_blank;_parent;_top
sourceType: javascript
children: []
*/
{% set bpr %}
import { TouchableOpacity } from "react-native"
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<TouchableOpacity
  {% if element.values.className %}style={ {{element.values.className}} }{% endif %}
  onPress={() => navigation.push( {{ element.values.destination|textOrVariableInCode }}{% if element.values.parameters %}, {{ element.values.parameters }}{% endif %} )}
  key='{{ element.unique_id }}'
>
  {{ content | raw }}
</TouchableOpacity>