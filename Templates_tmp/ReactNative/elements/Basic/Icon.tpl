/*
path: Icon.tpl
completePath: elements/Basic/Icon.tpl
type: file
unique_id: TTit6AJV
icon: ico-icon
sourceType: javascript
children: []
order: 20
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
    value: '"react-native-iconify": "^1.0.0", "babel-plugin-macros": "^3.1.0",'
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
  <Iconify icon={{element.values.icon | textOrVariable }} {% if element.values.size %}size={ {{element.values.size}} } {% endif %} {% if element.values.color %}color={{element.values.color | textOrVariable}} {% endif %} 
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  />
{% endif %}
