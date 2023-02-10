/*
path: IconNative.tpl
type: file
unique_id: JgKMAX06
icon: ico-icon-button
options:
  - name: Action
    display: Action
    type: text
    options: ''
  - name: name
    display: Font Awesome Icon
    type: text
    options: ''
  - name: size
    display: Size Awesome Icon
    type: text
    options: ''
  - name: color
    display: Color Awesome Icon (in Hexadecimal)
    type: text
    options: ''
sourceType: javascript
children: []
*/
{% set bpr %}
import Icon from 'react-native-vector-icons/FontAwesome';
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Icon name={ '{{element.values.name|default("square-o")}}' } size={ {{element.values.size|default(20)}} } color={ '{{element.values.color|default("#F96D4E")}}' } />
  {{ content | raw }}