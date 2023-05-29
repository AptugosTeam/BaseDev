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
  - name: class
    display: ClassName
    type: text
    options: ''
settings:
  - name: Packages
    value: '"expo-linear-gradient": "~12.1.2",'
*/
{% set bpr %}
import { LinearGradient } from 'expo-linear-gradient';
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<LinearGradient
  {% if element.values.class %}style={ {{element.values.class}} }{% endif %}
  colors={['{{ element.values.from|default('#000000')}}', '{{ element.values.to|default('#343c46')}}']}
  locations={[0, 0.9]}
>
  {{ content | raw }}
</LinearGradient>