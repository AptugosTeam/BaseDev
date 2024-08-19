/*
path: IconFontAwesome.tpl
type: file
unique_id: JgK08Ago
icon: ico-icon-button
options:
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

<Icon name={{ element.values.name }}size={ {{ element.values.size }} } color="{{ element.values.color }}" />
{{ content | raw }}