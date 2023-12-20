/*
path: YesIcon.tpl
completePath: elements/Experimental/YesIcon.tpl
type: file
unique_id: UiCt6AJV
icon: f:YesIcon.svg
sourceType: javascript
children: []
options:
  - name: icon
    display: Icon
    type: text
    options: ''
  - name: fontSize
    display: Font Size
    type: text
    options: ''
  - name: color
    display: Color (in hexadecimal)
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-native-iconify": "^0.2.10", "react-native-svg": "^13.4.0",'
*/
{% set bpr %}
import { Iconify } from 'react-native-iconify'
{% endset %}
{{ save_delayed('bpr',bpr) }}
  <Iconify
  {% if element.values.icon %}
  icon="{{element.values.icon}}" 
  {% endif %}
  {% if element.values.fontSize %}
    size={ {{element.values.fontSize}} }
  {% endif %}
  {% if element.values.color %}
    color="{{element.values.color}}" 
  {% endif %}
/>