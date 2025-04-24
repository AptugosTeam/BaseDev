/*
path: Iconify.tpl
completePath: elements/Experimental/Iconify.tpl
unique_id: ICNA0O1m
children: []
icon: ico-image
options:
  - name: icon
    display: Icon
    type: text
    options: ''
  - name: size
    display: size
    type: text
    options: ''
  - name: color
    display: Color
    type: text
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-native-svg": "13.9.0","react-native-iconify": "^1.0.0", "babel-plugin-macros": "^3.1.0",'
  - name: BabelAdd
    value: 'plugins.push("babel-plugin-macros")'
  - name: BabelAdd
    value: 'plugins.push("react-native-iconify/plugin")'
*/
{% set bpr %}
import { Iconify } from 'react-native-iconify'
{% endset %}
{{ save_delayed('bpr',bpr)}}

{% if element.values.icon %}
  <Iconify icon="{{element.values.icon}}" {% if element.values.size %}size={ {{element.values.size}} } {% endif %} {% if element.values.color %}color={{element.values.color | textOrVariable}} {% endif %} 
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  />
{% endif %}
