/*
path: Ionicons.tpl
completePath: elements/Experimental/Ionicons.tpl
unique_id: I0CNGO1m
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
    value: '"@expo/vector-icons": "13.0.0",'
*/
{% set bpr %}
import { Ionicons } from '@expo/vector-icons'
{% endset %}
{{ save_delayed('bpr',bpr)}}

{% if element.values.icon %}
  <Ionicons name="{{element.values.icon}}" {% if element.values.size %}size={ {{element.values.size}} } {% endif %} {% if element.values.color %}color={{element.values.color | textOrVariable}} {% endif %} 
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  />
{% endif %}
