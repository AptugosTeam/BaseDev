/*
path: MaterialIcon.tpl
type: file
unique_id: RhqkoHE4
icon: ico-icon-button
helpText: Shows a material icon from the list
children: []
options:
  - name: icon
    display: Icon
    type: text
    options: Access
  - name: color
    display: Color
    type: dropdown
    options: default;primary;secondary;action;disabled
  - name: size
    display: Size Icon
    type: text
    options: ''
  - name: className
    display: className
    type: text
*/
{% set bpr %}
import { MaterialIcons } from '@expo/vector-icons'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set theIcon = element.values.icon | lower %}
{% if theIcon == 'thumbup' %}{% set theIcon = 'thumb-up' %}{% endif %}
<MaterialIcons
  name={{ theIcon | textOrVariable }}
  {% if element.values.color %}color="{{ element.values.color }}"{% endif %}
  size={ {{ element.values.size | default(32)}} } 
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
/>