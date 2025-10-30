/*
path: LinearGradient.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/ReactNative/elements/Material-UI/LinearGradient.tpl
keyPath: elements/Material-UI/LinearGradient.tpl
unique_id: WSocKGyO
options:
  - name: from
    display: From Color
    type: text
  - name: to
    display: To Color
    type: text
  - name: colors
    display: Colors array items
    type: text
    options: ''
  - name: class
    display: ClassName
    type: text
    options: ''
  - name: locations
    display: Locations
    type: text
    options: ''
  - name: start
    display: Start coords
    type: text
    options: ''
  - name: end
    display: End coords
    type: text
    options: ''
settings:
  - name: Packages
    value: '"expo-linear-gradient": "~14.1.5",'
*/
{% set bpr %}
import { LinearGradient } from 'expo-linear-gradient';
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<LinearGradient
  {% if element.values.class %}style={ {{element.values.class}} }{% endif %}
  {% if element.values.colors %}
  colors={ {{ element.values.colors | raw }} }
  {% else %}
  colors={['{{ element.values.from|default('#000000')}}', '{{ element.values.to|default('#343c46')}}']}
  {% endif %}
  {% if element.values.locations %}
  locations={ {{ element.values.locations | raw }} }
  {% endif %}
  {% if element.values.start %}start={ {{ element.values.start | raw }} }{% endif %}
  {% if element.values.end %}end={ {{ element.values.end | raw }} }{% endif %}
  {% if content %}
>
  {{ content | raw }}
</LinearGradient>
  {% else %}
  />
  {% endif %}